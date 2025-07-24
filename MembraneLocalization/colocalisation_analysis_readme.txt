Colocalisation_readme

images renamed off microscope according to identifier (recorded maually) - see rename czi_files
also saved as Tiff files - use save_images_as_tiffs_macro

processing: 
biodock model trained to include all membrane stain (not segment within membrane, this is important for coloc of braf and kras)
this is currently only available online in my project - I can share it though

=> labels nuclei
=labels cells 
(both based on membrane/nuclear stain)
can introduce manual correction step for each image if required - only done here for the prelabelled ones
if anything this model may overlabel - ie. after labelling everything correctly try and label more/smaller things - currently am removing these by filtering for size after rpocessing

downloaded the cell labels for each image, these are json files.
to check: can load these into fiji as an ROI: use import_json_ROI_perimage macros (is written in python, not fijimacrolanguage)

analysis done per label per image in python, excluding the nuclues - the correct script is PCC_nucleus_exclusion.ipynb
(note: the debug images do not currently number the cells - need to adjust - the PCC_calculation_from_labels (nucleus included file does this  adjust)

Important: need to set pixel scaling manually - can get this from image files or alternatively open image in fiji - set scale reads it in.
possibly adjust folder settings - may have moved these around. 


this outputs a csv file per image with Cell_ID for each label,  the calculated Pearson Correlation per labelled region, Mean_intensity and sum_intensity for BRAF and KRAS, 
and area in microns for each labelled regions

Files are in

11.17_files/PCC_calculation_no_nuc/results_no_nuc
additionally- makes an overlay of the labels with cellID and the original image for debugging if necessary - these are in debug

further analysis and plotting in R
script is coloc_quantification_11.17_nucleus_excluded
file with all measurements - to load in straight away - all_images_nonuc_PCC.csv

set filters to control for
a) transfected - assumed transfection efficiency of 2´0%, set threshold at 80th percentile for mean_intensity and filtered for this in KRAS and BRAF (to avoid quantifying zero zero pixels)
	=> this was done individually for each BRAF/KRAS condition - mean_intensity values are different depending on sample
also: the way the cells were labelled to inlcude all membrane means that som labels overlap and a non-transfetced cell next to a transfected cell will also include some of thazt membrane - the filtering above should fix this though
b) overly transfected cells/aggregates/artefacts - set an upper limit of 5000 to exclude these

c) size: to remove missegmented cells - ie. very small, or to remove partially cropped cells on image border
empirically set to 60 after manually checking some of the debug images.
could change this. 

filtered image set: all_images_nonuc_filter_PCC - for direct plotting. 


plot however :) ...


Notes currently:
on PCC calculation - image was not threshholded before calculating , some programs do this to remove zero zero pixels, but since we segmented to biologically relevant area, i think this is fine. 
would it be better to remove the nucleus from the PCC? this should be easy enough to implement (need to also load nuclear labels) - i think thi si sleading to the slightly positive PCC for non-correlated things,maybe this is ok. 
images are of IRES constructs with eGFP, not mGFP which we then used in flow. possibly would need to reclone, redo etc. 

