set infile ../structure/Loadable_fps.tdr
set out_csv "../out_svisual/Loadable_fps.tdr_ycut5.0um.csv"
set ycut 5.0
set mydata2D [load_file $infile]
set myplot2D [create_plot -dataset $mydata2D]
list_fields -plot $myplot2D
list_regions -plot $myplot2D
list_materials -plot $myplot2D
set mydata1D [create_cutline -plot $myplot2D -type y -at $ycut]
export_variables -dataset $mydata1D -filename $out_csv -overwrite
