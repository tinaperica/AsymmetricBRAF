// Define input and output folders
inputDir = "W:/Work/SHOC2_project/11.17_brafmuts_membrane_data/airy_scan_processed/";
outputDir = "W:/Work/SHOC2_project/11.17_brafmuts_membrane_data/airy_scan_processed/composites/";

// Get a list of all files in the input directory with ".czi" extension
list = getFileList(inputDir);
for (i = 0; i < list.length; i++) {
    if (endsWith(list[i], ".czi")) {
       // Get the base filename without extension using string manipulation
        dotIndex = indexOf(list[i], ".czi");
        baseName = substring(list[i], 0, dotIndex);
        
        // Open the image
        open(inputDir + list[i]);

                  // Apply your processing steps
        //run("Brightness/Contrast...");
	run("Enhance Contrast", "saturated=0.2");
	run("Red");
Stack.setChannel(2);
run("Enhance Contrast", "saturated=0.25");
	run("Magenta");
Stack.setChannel(3);
	run("Green");
run("Enhance Contrast", "saturated=0.25");
Stack.setChannel(4);
run("Enhance Contrast", "saturated=0.2");
Property.set("CompositeProjection", "Sum");
Stack.setDisplayMode("composite");
        run("Stack to RGB");
        run("Scale Bar...", "width=10 height=20 thickness=8 font=36 bold");

        // Save the processed image to the output folder with modified name
        saveAs("Tiff", outputDir + baseName + "_edited.tif");

        // Close the image to free memory
        close();
          close();
    }
}