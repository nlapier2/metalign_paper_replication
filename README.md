# Metalign Paper Replication

This repository was made to facilitate replication of the results in the Metalign paper. For the Metalign repository, see: https://github.com/nlapier2/Metalign

If you use our software, please cite the paper, which can be found here: 

LaPierre, N., Alser, M., Eskin, E. et al. Metalign: efficient alignment-based metagenomic profiling via containment min hash. Genome Biol 21, 242 (2020). https://doi.org/10.1186/s13059-020-02159-0


The organization of the repository is as follows, roughly in reverse chronological order of how things were run:
* paper_plots.ipynb is a jupyter notebook that was used to produce the figures in the paper, which are located in the figures/ directory
* generate_cami_plot_inputs.sh runs two helper scripts, parse_opal_results.py and parse_timing_memory.py, that reformat the OPAL and timing output for easier plotting in paper_plots.ipynb. These reformatted files are contained in the plot_inputs/ directory.
* cami_profiles/ and peabody_profiles/ contain the CAMI/OPAL format profiles produced by each method, with various cutoff thresholds
* processing_scripts/ contains the lines and scripts run to apply cutoff thresholds to the profiles and then generate all the OPAL results
* cami_timing/, peabody_timing/, and tara_timing/ contain the raw timing and memory output for each method on each dataset, produced via the GNU time utility
* conversion_scripts/ contains the scripts used to convert the raw program output formats to CAMI/OPAL format. We did this with our own custom scripts, except for Metalign and mOTUs2, which natively output this format, and MetaPhlAn2, for which we used the following repository (courtesy of David Koslicki): https://github.com/dkoslicki/CAMIMetaPhlAn
* run_scripts/ contains scripts with the commands used to run the methods, and also data preprocessing (e.g. format conversions)

If you are interested in replicating our results and have any questions, please feel free to open up an issue for this repo.
