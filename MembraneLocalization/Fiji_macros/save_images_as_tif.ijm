// Define input and output folders
//best to create separate folders for this
inputDir = "W:/Work/SHOC2_project/11.10_braf_muts_data/ed/";
outputDir = "W:/Work/SHOC2_project/11.10_braf_muts_data/ed/";

// Get a list of all files in the input directory with ".czi" extension
list = getFileList(inputDir);
for (i = 0; i < list.length; i++) {
    if (endsWith(list[i], ".czi")) {
       // Get the base filename without extension using string manipulation
        dotIndex = indexOf(list[i], ".czi");
        baseName = substring(list[i], 0, dotIndex);
        
        // Open the image
        open(inputDir + list[i]);


        // Save the processed image to the output folder with modified name
        saveAs("Tiff", outputDir + baseName + ".tif");

        // Close the image to free memory
        close();
    }
}