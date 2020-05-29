# Splits the de-compressed gi_taxid_nucl.dmp file from NCBI into a bunch of smaller files for faster lookups
import argparse
import os


def parseargs():    # handle user arguments
	parser = argparse.ArgumentParser(description="Split NCBI gi_taxid file into a bunch of smaller files.")
	parser.add_argument('--gi_taxid_file', required=True, help='De-compressed gi_taxid_nucl.dmp file from NCBI.')
	parser.add_argument('--outdir', required=True, help='Output directory.')
	args = parser.parse_args()
	return args


if __name__ == '__main__':
	args = parseargs()
	if not args.outdir.endswith('/'):
		args.outdir += '/'
	if not os.path.exists(args.outdir):
		os.makedirs(args.outdir)

	with(open(args.gi_taxid_file, 'r')) as infile:
		cur_min, cur_max, chunk_size = 0, 1000000, 1000000
		cur_outfile = open(args.outdir + str(cur_min) + '_to_' + str(cur_max) + '.dmp', 'w')
		for line in infile:
			splits = line.strip().split('\t')
			gi, taxid = splits[0], splits[1]
			if int(gi) > cur_max:
				cur_min += chunk_size
				cur_max += chunk_size
				cur_outfile.close()
				cur_outfile = open(args.outdir + str(cur_min) + '_to_' + str(cur_max) + '.dmp', 'w')
			else:
				cur_outfile.write(line)
		cur_outfile.close()
