python3 parse_opal_results.py --opal_results cami_profiles/R*/opal_results/ --rank family --output plot_inputs/family_all_metrics.tsv --f1_output plot_inputs/f1_per_dataset_family.tsv --l1_output plot_inputs/l1_per_dataset_family.tsv
python3 parse_opal_results.py --opal_results cami_profiles/R*/opal_results/ --rank genus --output plot_inputs/genus_all_metrics.tsv --f1_output plot_inputs/f1_per_dataset_genus.tsv --l1_output plot_inputs/l1_per_dataset_genus.tsv
python3 parse_opal_results.py --opal_results cami_profiles/R*/opal_results/ --rank species --output plot_inputs/species_all_metrics.tsv --f1_output plot_inputs/f1_per_dataset_species.tsv --l1_output plot_inputs/l1_per_dataset_species.tsv
python3 parse_opal_results.py --opal_results cami_profiles/R*/opal_results/ --rank all --output plot_inputs/all_all_metrics.tsv --f1_output plot_inputs/f1_per_dataset_all.tsv --l1_output plot_inputs/l1_per_dataset_all.tsv
#
python3 parse_opal_results.py --opal_results cami_profiles/thresh_0pt01pct*/opal_results/ --rank family --output plot_inputs/family_all_metrics_thresh_0pt01pct.tsv --f1_output plot_inputs/f1_per_dataset_family_thresh_0pt01pct.tsv --l1_output plot_inputs/l1_per_dataset_family_thresh_0pt01pct.tsv
python3 parse_opal_results.py --opal_results cami_profiles/thresh_0pt01pct*/opal_results/ --rank genus --output plot_inputs/genus_all_metrics_thresh_0pt01pct.tsv --f1_output plot_inputs/f1_per_dataset_genus_thresh_0pt01pct.tsv --l1_output plot_inputs/l1_per_dataset_genus_thresh_0pt01pct.tsv
python3 parse_opal_results.py --opal_results cami_profiles/thresh_0pt01pct*/opal_results/ --rank species --output plot_inputs/species_all_metrics_thresh_0pt01pct.tsv --f1_output plot_inputs/f1_per_dataset_species_thresh_0pt01pct.tsv --l1_output plot_inputs/l1_per_dataset_species_thresh_0pt01pct.tsv
python3 parse_opal_results.py --opal_results cami_profiles/thresh_0pt01pct*/opal_results/ --rank all --output plot_inputs/all_all_metrics_thresh_0pt01pct.tsv --f1_output plot_inputs/f1_per_dataset_all_thresh_0pt01pct.tsv --l1_output plot_inputs/l1_per_dataset_all_thresh_0pt01pct.tsv
#
python3 parse_opal_results.py --opal_results peabody_profiles/*_cutoff/opal_results/ --rank family --output plot_inputs/peabody_family_all_metrics.tsv --f1_output plot_inputs/peabody_family_f1_per_cutoff.tsv
python3 parse_opal_results.py --opal_results peabody_profiles/*_cutoff/opal_results/ --rank genus --output plot_inputs/peabody_genus_all_metrics.tsv --f1_output plot_inputs/peabody_genus_f1_per_cutoff.tsv
python3 parse_opal_results.py --opal_results peabody_profiles/*_cutoff/opal_results/ --rank species --output plot_inputs/peabody_species_all_metrics.tsv --f1_output plot_inputs/peabody_species_f1_per_cutoff.tsv
python3 parse_opal_results.py --opal_results peabody_profiles/*_cutoff/opal_results/ --rank all --output plot_inputs/peabody_all_all_metrics.tsv --f1_output plot_inputs/peabody_all_f1_per_cutoff.tsv
#
python3 parse_opal_results.py --opal_results hmp_profiles/*_cutoff/opal_results/ --rank family --output plot_inputs/hmp_family_all_metrics.tsv --f1_output plot_inputs/hmp_family_f1_per_cutoff.tsv
python3 parse_opal_results.py --opal_results hmp_profiles/*_cutoff/opal_results/ --rank genus --output plot_inputs/hmp_genus_all_metrics.tsv --f1_output plot_inputs/hmp_genus_f1_per_cutoff.tsv
python3 parse_opal_results.py --opal_results hmp_profiles/*_cutoff/opal_results/ --rank species --output plot_inputs/hmp_species_all_metrics.tsv --f1_output plot_inputs/hmp_species_f1_per_cutoff.tsv
python3 parse_opal_results.py --opal_results hmp_profiles/*_cutoff/opal_results/ --rank all --output plot_inputs/hmp_all_all_metrics.tsv --f1_output plot_inputs/hmp_all_f1_per_cutoff.tsv
#
python parse_timing_memory.py
#
