import argparse


RANKS = {'superkingdom': 0, 'phylum': 1, 'class': 2, 'order': 3, 'family': 4, 'genus': 5, 'species': 6, 'strain': 7}
RANK_LIST = ['superkingdom', 'phylum', 'class', 'order', 'family', 'genus', 'species', 'strain']


def parseargs():    # handle user arguments
	parser = argparse.ArgumentParser(description="Convert gottcha format profile to CAMI/OPAL format profile.")
	parser.add_argument('--gottcha', required=True, help='Input gottcha file name.')
	parser.add_argument('--cami', required=True, help='CAMI/OPAL format output file.')
	parser.add_argument('--SampleID', required=True, help='What to put for SampleID field in CAMI/OPAL format.')
	args = parser.parse_args()
	return args


def build_taxtree():
	# taxtree is stored as a dict with TaxID keys linking to taxonomic name, taxonomic rank, and parent TaxID
	# Thus, it will be easy to traverse through lineage given starting TaxID
	name_to_taxid = {}
	taxtree = {}
	with(open('taxonomy/names.dmp', 'r')) as names:
		for line in names:
			if 'scientific name' not in line:
				continue  # skip alternate names and other unnecessary info
			# splits = line.split('|')[1].strip()
			taxid = line.split()[0]
			name = line.split('|')[1].strip()
			name_to_taxid[name] = taxid
			taxtree[taxid] = [name]  # Key is TaxID, value is tax. name
	with(open('taxonomy/nodes.dmp', 'r')) as nodes:
		for line in nodes:
			splits = line.split()
			# add taxonomic rank and parent TaxID to list of info for this taxID
			taxtree[splits[0]].extend([splits[4], splits[2]])
	return name_to_taxid, taxtree


# Uses taxtree to find lineage of taxid in both taxonomic names and IDs
def trace_lineages(taxid, taxtree):
	name_lineage, taxid_lineage = ['' for i in range(8)], ['' for i in range(8)]
	cur_taxid = taxid
	# Record lowest level taxonomic info if it's below species level
	if cur_taxid in taxtree:
		name, rank, parent = taxtree[cur_taxid]
	else:
		return 'NONE', 'NONE'
	if rank not in RANKS:  # strains are recorded as 'no rank' in nodes.dmp
		name_lineage[-1] = name
		taxid_lineage[-1] = cur_taxid
		cur_taxid = parent  # traverse up to parent taxid
	# Now traverse up the tree
	while cur_taxid != '1':  # while we're not at the root
		if cur_taxid in taxtree:
			name, rank, parent = taxtree[cur_taxid]
		else:
			return 'NONE', 'NONE'
		if rank in RANKS:  # if this is a relevant CAMI taxonomic rank
			index = RANKS[rank]  # then record this node's info at the rank
			name_lineage[index] = name
			taxid_lineage[index] = cur_taxid
		cur_taxid = parent  # traverse up to parent taxid and repeat
	name_lineage, taxid_lineage = '|'.join(name_lineage).strip('|'), '|'.join(taxid_lineage).strip('|')
	return name_lineage, taxid_lineage


def read_gottcha_file(gottcha_file, name_to_taxid):
	# Example line: phylum  Firmicutes      0.0389  {other stuff}
	taxid_to_abundance = {}
	with(open(gottcha_file, 'r')) as infile:
		infile.readline()  # skip header
		for line in infile:
			splits = line.strip().split('\t')
			name = splits[1]
			if name not in name_to_taxid:  # 'Unassigned' in name:
				continue
			taxid = name_to_taxid[name]
			rank = splits[0]
			abundance = '%.5f' % (float(splits[2]) * 100)  # gottcha's results are out of 1; convert to out of 100
			taxid_to_abundance[taxid] = [rank, abundance]
	return taxid_to_abundance


def generate_cami_fields(taxid_to_abundance, taxtree):
	taxid_to_cami_fields = {}
	for taxid in taxid_to_abundance:
		# cami fields example: 1224    phylum  2|1224  Bacteria|Proteobacteria 28.463359800760507
		rank, abundance = taxid_to_abundance[taxid]
		name_lineage, taxid_lineage = trace_lineages(taxid, taxtree)
		taxid_to_cami_fields[taxid] = [rank, taxid_lineage, name_lineage, abundance]
	return taxid_to_cami_fields


# push abundance levels of lower level taxa up to their higher levels (e.g. species up to genus up to family etc)
def push_up_abundances(taxid_to_cami_fields):
	initial_abundaces = {key: taxid_to_cami_fields[key] for key in taxid_to_cami_fields}
	for taxid in initial_abundaces:
		rank, taxid_lineage, name_lineage, abundance = initial_abundaces[taxid]
		if rank != 'phylum':  # only need to push phylum up to superkingdom level for gottcha
			continue
		num_pipes = taxid_lineage.count('|')
		for i in range(num_pipes):
			higher_taxid = taxid_lineage.split('|')[i]
			if higher_taxid in taxid_to_cami_fields:
				old_abundance = float(taxid_to_cami_fields[higher_taxid][-1])
				taxid_to_cami_fields[higher_taxid][-1] = str(old_abundance + float(abundance))
			else:
				higher_rank = RANK_LIST[i]
				higher_taxlin = '|'.join(taxid_lineage.split('|')[:i + 1])
				higher_namelin = '|'.join(name_lineage.split('|')[:i + 1])
				taxid_to_cami_fields[higher_taxid] = [higher_rank, higher_taxlin, higher_namelin, abundance]
	return taxid_to_cami_fields


def write_cami_file(taxid_to_cami_fields, cami_file, sample_id):
	with(open(cami_file, 'w')) as outfile:
		outfile.write('@SampleID:' + str(sample_id) + '\n')
		outfile.write('@Version:GOTTCHA\n')
		outfile.write('@Ranks: superkingdom|phylum|class|order|family|genus|species|strain\n\n')
		outfile.write('@@TAXID\tRANK\tTAXPATH\tTAXPATHSN\tPERCENTAGE\t_CAMI_genomeID\t_CAMI_OTU\n')
		for i in range(len(RANK_LIST)):
			for taxid in taxid_to_cami_fields:
				rank = taxid_to_cami_fields[taxid][0]
				if rank == RANK_LIST[i]:  # print by rank
					taxid_to_cami_fields[taxid][-1] = '%.5f' % (float(taxid_to_cami_fields[taxid][-1]))
					outfile.write(taxid + '\t' + '\t'.join(taxid_to_cami_fields[taxid]) + '\n')


if __name__ == '__main__':
	args = parseargs()
	name_to_taxid, taxtree = build_taxtree()
	taxid_to_abundance = read_gottcha_file(args.gottcha, name_to_taxid)
	taxid_to_cami_fields = generate_cami_fields(taxid_to_abundance, taxtree)
	taxid_to_cami_fields = push_up_abundances(taxid_to_cami_fields)
	write_cami_file(taxid_to_cami_fields, args.cami, args.SampleID)
