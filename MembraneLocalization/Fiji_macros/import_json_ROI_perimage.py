from ij.gui import Roi, PolygonRoi
from ij.plugin.frame import RoiManager
import json

# Load GeoJSON file
geojson_path = "W:/Work/SHOC2_project/11.17_brafmuts_membrane_data/predicted_labels/KRASG12D_BRAF_AAAA_19.json"
with open(geojson_path, 'r') as f:
    data = json.load(f)

# Initialize ROI Manager
roi_manager = RoiManager.getInstance()
if not roi_manager:
    roi_manager = RoiManager()

# Parse GeoJSON and add ROIs
for feature in data['features']:
    geometry = feature['geometry']
    if geometry['type'] == 'Polygon':
        coords = geometry['coordinates'][0]
        x_points = [p[0] for p in coords]
        y_points = [p[1] for p in coords]
        roi = PolygonRoi(x_points, y_points, len(x_points), Roi.POLYGON)
        roi_manager.addRoi(roi)
        
# Save ROIs to a set
roi_manager.runCommand("Save", "W:/Work/SHOC2_project/11.17_brafmuts_membrane_data/predicted_labels//roi_set.zip")