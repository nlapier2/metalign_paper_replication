import argparse
import glob
import os
import subprocess


def parseargs():    # handle user arguments
	parser = argparse.ArgumentParser(description="Apply abundance cutoff threshold to CAMI-format profiles.")
	parser.add_argument('--indir', required=True, help='Input directory with CAMI-format profiles.')
	parser.add_argument('--outdir', required=True, help='Output directory to wrire modified profiles to.')
	parser.add_argument('--threshold', required=True, type=float, help='Abundance cutoff threshold to apply.')
	parser.add_argument('--gold_standard', default='NONE', help='Gold standard profile to not apply threshold to.')
	args = parser.parse_args()
	return args


# Re-write profile in new location, except missing lines for taxa with abundance below --threshold
def apply_threshold(profile, outname, threshold):
	with(open(profile, 'r')) as infile:
		with(open(outname, 'w')) as outfile:
			for line in infile:
				if len(line) < 5 or line.startswith('@') or line.startswith('#'):  # write empty and comment lines
					outfile.write(line)
				else:
					# print(profile, line)
					abundance = float(line.strip().split('\t')[4])
					if abundance >= threshold:  # only write lines above the abundance cutoff threshold
						outfile.write(line)


if __name__ == '__main__':
	args = parseargs()
	if not args.indir.endswith('/'):
		args.indir += '/'
	if not args.outdir.endswith('/'):
		args.outdir += '/'
	if not os.path.isdir(args.outdir):
		os.makedirs(args.outdir)

	# gather filenames to apply this to, ignoring the --gold_standard file if applicable, and call apply_threshold
	profile_list = glob.glob(args.indir + '*')
	if args.gold_standard in profile_list:
		profile_list.remove(args.gold_standard)
		outname = args.outdir + args.gold_standard.split(args.indir)[1]
		subprocess.Popen(['cp', args.gold_standard, outname]).wait()
	profile_list = [i for i in profile_list if not os.path.isdir(i)]
	for profile in profile_list:
		outname = args.outdir + profile.split(args.indir)[1]  # same filename as in --indir, but written to --outdir
		apply_threshold(profile, outname, args.threshold)
