Image editing for paper readme
all relevant data is in 11.17_files/images_for_paper_selection

Two images for each condition were selected from the full set

Processing:
opened
run colouring_channels macro to get right channel colours 
Note: biop luts need to be downloaded and unpacked into the luts folder in fiji

set ROI - use ROIs per image in ROIset_all,these are all the same size and named by image number
duplicate image with ROI selection

then manually set channel threshholds to obtain "good" images 
=> in theory this should all be the same, however during aquiry different settings (laser power/gain) were used to get best image (ie not saturated, filling 2/3 of histogram) - therefore adjusted the values manually. final values used are in excel sheet:image_processing_values

run add_scalebar:composite macro - change suze if scalebar in code if necessary
(important - dont add scalebar as overlay (implemented in code) otherwise it will not show up in tif file
save as tif
=> final images are in folder composite

For BRAF single channel images
select full image with ROI selected
run make BRAF single channel  macro
(set channel value in code -for some images values were adjusted from excel to remove saturation)
save as tiff
(lut needs to be applied, otherwise tiff will be pale - in code)
final images are infolder braf

