reset_settings
# Load TDR file.
set mydata2D [load_file ../structure/Loadable_fps.tdr]

set myplot2D [create_plot -dataset $mydata2D]
list_regions -plot $myplot2D
list_materials -plot $myplot2D
list_fields -plot $myplot2D

set_window_full -on

set_field_prop -plot $myplot2D -geom $mydata2D BTotal -show_bands
export_view ../out_svisual/boron.png -plots $myplot2D -resolution 1500x1500 -format PNG -overwrite 

set_material_prop [list_materials -plot $myplot2D] -show_mesh
export_view ../out_svisual/mesh.png -plots $myplot2D -resolution 1500x1500 -format PNG -overwrite 

zoom_plot -plot $myplot2D -window {0 3.5 1.5 6.5}
export_view ../out_svisual/zoom.png -plots $myplot2D -resolution 1500x1500 -format PNG -overwrite 

set mydata1D [create_cutline -plot $myplot2D -type y -at 5.0]
export_variables -dataset $mydata1D -filename ../out_svisual/sprocess.csv -overwrite
