# Computes metrics across a series of OPAL results


import argparse
import os
import sys


METRICS = ['Purity (precision)', 'Completeness (recall)', 'F1 score',
	'Jaccard index', 'L1 norm error', 'Weighted UniFrac error']
RANK_METRICS = ['Purity (precision)', 'Completeness (recall)', 'L1 norm error', 'Weighted UniFrac error']
RANKS = ['superkingdom', 'phylum', 'class', 'order', 'family', 'genus', 'species', 'na']


def parseargs():    # handle user arguments
	parser = argparse.ArgumentParser(description='Compute metrics across a series of OPAL results.')
	parser.add_argument('--opal_results', required=True, nargs='+', help='OPAL results folders to use.')
	# parser.add_argument('opal_results', help='Opal results folder for all experiments. Required.')
	parser.add_argument('--output', default='summary_opal_results.tsv', help='Where to write results.')
	parser.add_argument('--f1_output', default='NONE', help='File to write F1 Score per dataset (default: not done).')
	parser.add_argument('--l1_output', default='NONE', help='File to write L1 Error per dataset (default: not done).')
	parser.add_argument('--per_dataset_metric', default='F1 score',
		help='If using --per_dataset_output, which metric to output.')
	parser.add_argument('--per_dataset_output', default='NONE',
		help='Output file name to write --per_dataset_metric per dataset. Default: do not do this.')
	# parser.add_argument('--prefix', default='', help='Include only experiment folders with this prefix.')
	parser.add_argument('--rank', default='all', help='Only compute metrics for this rank.')
	args = parser.parse_args()
	return args


def parse_opal_results(dirs):  # opal_results, prefix):
	'''Parse OPAL results file, gathering desired metrics that we use.'''
	# get list of dirs to get results for and make dicts for holding the results
	#dirs = [os.path.join(opal_results, d) + '/' for d in os.listdir(opal_results)
	#	if os.path.isdir(os.path.join(opal_results, d)) and d.startswith(prefix)]
	# we will store results sorted both by metric and method, useful for different scoring
	metric_sorted_results, method_sorted_results = {d: {} for d in dirs}, {d: {} for d in dirs}

	for experiment_dir in dirs:  # for each directory, get rank and metric results
		metric_exp_res, method_exp_res = {}, {}
		with(open(experiment_dir + 'results.tsv', 'r')) as infile:
			infile.readline()  # skip header line
			for line in infile:
				splits = line.strip().split('\t')
				method, rank, metric, result = splits[0], splits[1], splits[2], float(splits[4])
				if method == 'Gold standard' or metric not in METRICS or rank not in RANKS:
					continue  # skip unused metrics/ranks and the gold standard results

				# initialize sub-dicts as necessary and store results
				if metric not in metric_exp_res:
					metric_exp_res[metric] = {}
				if rank not in metric_exp_res[metric]:
					metric_exp_res[metric][rank] = {}
				metric_exp_res[metric][rank][method] = result
				if method not in method_exp_res:
					method_exp_res[method] = {}
				if metric not in method_exp_res[method]:
					method_exp_res[method][metric] = {}
				method_exp_res[method][metric][rank] = result

		# ensure that F1 and L1 values are filled for all ranks
		for method in method_exp_res:
			for rank in RANKS:
				if rank == 'na':
					continue
				if method not in metric_exp_res['L1 norm error'][rank]:
					metric_exp_res['L1 norm error'][rank][method] = 2.0
				if method not in metric_exp_res['F1 score'][rank]:
					metric_exp_res['F1 score'][rank][method] = 0.0
				if rank not in method_exp_res[method]['L1 norm error']:
					method_exp_res[method]['L1 norm error'][rank] = 2.0
				if rank not in method_exp_res[method]['F1 score']:
					method_exp_res[method]['F1 score'][rank] = 0.0
		metric_sorted_results[experiment_dir] = metric_exp_res
		method_sorted_results[experiment_dir] = method_exp_res
	return metric_sorted_results, method_sorted_results


def compute_rank_results(metric_sorted_results, user_rank):
	'''Return OPAL results using their rank-based scoring method.'''
	rank_results = {experiment_dir: {} for experiment_dir in metric_sorted_results}
	for experiment_dir in rank_results:
		for metric in RANK_METRICS:
			# here we get the ranks of each method at each tax level
			# we keep a running total sum over all levels
			rank_sums = {}
			for rank in RANKS:
				# Weighted UniFrac is rank-independent; evalutated only on 'na'
				if metric == 'Weighted UniFrac error' and rank != 'na':
					continue
				if metric != 'Weighted UniFrac error' and rank == 'na':
					continue
				if user_rank != 'all' and rank != user_rank and metric != 'Weighted UniFrac error':
					continue

				method_results = [[method, metric_sorted_results[experiment_dir][metric][rank][method]]
					for method in metric_sorted_results[experiment_dir][metric][rank]]
				# lower is better for l1/unifrac, higher is better for recall/precision/f1/jaccard
				if metric == 'L1 norm error' or metric == 'Weighted UniFrac error':
					method_results.sort(key = lambda x: x[1])
				else:
					method_results.sort(key = lambda x: x[1], reverse = True)
				results_only = [x[1] for x in method_results]
				# index method returns first index, allowing ties to be scored the same
				method2rank = {res[0]: results_only.index(res[1]) for res in method_results}
				for method in method2rank:
					if method not in rank_sums:
						rank_sums[method] = 0
					rank_sums[method] += method2rank[method]
			rank_results[experiment_dir][metric] = rank_sums

		# now compute "Overall" metric which is the sum over the other rank_metrics
		rank_results[experiment_dir]['Overall'] = {}
		for method in rank_results[experiment_dir][RANK_METRICS[0]]:
			rank_results[experiment_dir]['Overall'][method] = 0
			for metric in RANK_METRICS:
				rank_results[experiment_dir]['Overall'][method] += (
					rank_results[experiment_dir][metric][method])
	return rank_results


def compute_metric_results(method_sorted_results, user_rank):
	'''Return OPAL metrics averaged over all taxonomic levels for each method.'''
	metric_results = {experiment_dir: {} for experiment_dir in method_sorted_results}
	for experiment_dir in method_sorted_results:
		for method in method_sorted_results[experiment_dir]:
			for metric in method_sorted_results[experiment_dir][method]:
				running_total = 0.0
				for rank in RANKS:
					# Weighted UniFrac is rank-independent; evalutated only on 'na'
					if metric == 'Weighted UniFrac error' and rank != 'na':
						continue
					if metric != 'Weighted UniFrac error' and rank == 'na':
						continue
					if user_rank != 'all' and rank != user_rank and metric != 'Weighted UniFrac error':
						continue
					running_total += method_sorted_results[experiment_dir][method][metric][rank]

				if metric not in metric_results[experiment_dir]:
					metric_results[experiment_dir][metric] = {}
				if metric != 'Weighted UniFrac error' and user_rank == 'all':
					running_total /= float(len(RANKS) - 1)
				metric_results[experiment_dir][metric][method] = running_total
	return metric_results


def average_over_dirs(dir_results):
	'''Average over the directories for the results'''
	avg_results = {}
	# first sum over all the directory results
	for experiment_dir in dir_results:
		for metric in dir_results[experiment_dir]:
			for method in dir_results[experiment_dir][metric]:
				if method not in avg_results:
					avg_results[method] = {}
				if metric not in avg_results[method]:
					avg_results[method][metric] = 0.0
				avg_results[method][metric] += dir_results[experiment_dir][metric][method]
	# now get the average by dividing by the number of directories
	for method in avg_results:
		for metric in avg_results[method]:
			avg_results[method][metric] /= float(len(dir_results))
	return avg_results


def write_results(output, rank_results, metric_results, avg_rank, avg_met):
	'''Write both rank and metric results in excel/sheets-friendly format'''
	with(open(output, 'w')) as outfile:
		outfile.write('\t'.join(METRICS) + '\tMethod\n')
		for method in avg_met:
			outfile.write(method + '\t')
			for metric in METRICS:#avg_met[method]:
				outfile.write(str(avg_met[method][metric]) + '\t')
			outfile.write(method + '\n')


def write_per_dataset_output(per_dataset_outfile, metric_results, output_metric):
	# metric_results[experiment_dir][metric][method] = running_total
	per_dataset_method_results = {}
	for experiment_dir in metric_results:
		for method in metric_results[experiment_dir][output_metric]:
			if method not in per_dataset_method_results:
				per_dataset_method_results[method] = []
			per_dataset_method_results[method].append(
				str(metric_results[experiment_dir][output_metric][method]))
	with(open(per_dataset_outfile, 'w')) as outfile:
		for method in per_dataset_method_results:
			outfile.write(method + '\t' + '\t'.join(per_dataset_method_results[method]) + '\n')



def main():
	args = parseargs()
	args.rank = args.rank.lower()
	if args.rank != 'all' and (args.rank not in RANKS or args.rank == 'na'):
		sys.exit("--rank options are: ['superkingdom', 'phylum', 'class', \
			'order', 'family', 'genus', 'species', 'all']")
	metric_sorted_res, method_sorted_res = parse_opal_results(args.opal_results)  # , args.prefix)
	rank_results = compute_rank_results(metric_sorted_res, args.rank)
	metric_results = compute_metric_results(method_sorted_res, args.rank)
	avg_rank = average_over_dirs(rank_results)
	avg_met = average_over_dirs(metric_results)
	write_results(args.output, rank_results, metric_results, avg_rank, avg_met)
	if args.f1_output != 'NONE':
		write_per_dataset_output(args.f1_output, metric_results, 'F1 score')
	if args.l1_output != 'NONE':
		write_per_dataset_output(args.l1_output, metric_results, 'L1 norm error')
	if args.per_dataset_output != 'NONE':
		write_per_dataset_output(args.per_dataset_output, metric_results, args.per_dataset_metric)


if __name__ == '__main__':
	main()
#
