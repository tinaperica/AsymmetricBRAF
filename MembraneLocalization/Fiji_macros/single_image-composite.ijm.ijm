open("W:/Work/SHOC2_project/11.10_braf_muts_data/New-01-Airyscan Processing-01.czi");
selectImage("New-01-Airyscan Processing-01.czi");
//run("Channels Tool...");
Property.set("CompositeProjection", "Sum");
Stack.setDisplayMode("composite");
//run("Brightness/Contrast...");
run("Enhance Contrast", "saturated=0.35");
run("Enhance Contrast", "saturated=0.35");
run("Stack to RGB");
run("Scale Bar...", "width=10 height=20 thickness=8 font=36 bold"); //this adds scalebar into tif, otherwise use overlay
saveAs("Tiff", "W:/Work/SHOC2_project/11.10_braf_muts_data/ed/New-01-Airyscan Processing-01_ed.tif");

