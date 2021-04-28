import os
import csv
import numpy as np

def run_svisual():
	os.system('sleep 2')
	os.system('svisual -bx tmp.tcl')
	#os.system('rm *.log')	
	os.system('rm *.BAK')	
	#os.system('rm tmp.tcl')
	return 0

def tmplt_imgs():
	ftmp = open("tmp.tcl","w")  
	ftmp.write('set mydata2D [load_file @inTDR@]\n')
	ftmp.write('set myplot2D [create_plot -dataset $mydata2D]\n')
	ftmp.write('list_regions -plot $myplot2D\n')
	ftmp.write('list_materials -plot $myplot2D\n')
	ftmp.write('list_fields -plot $myplot2D\n')
	ftmp.write('set_legend_prop -plot $myplot2D -title_font_family arial -title_font_factor 1.7 -title_font_color #000000 -title_font_att bold\n')
	ftmp.write('set_legend_prop -plot $myplot2D -label_font_family arial -label_font_factor 1.5 -label_font_color #000000 -label_font_att bold\n')
	ftmp.write('set_legend_prop -plot $myplot2D -show_background\n')
	#ftmp.write('windows_style -aspect_ratio_off\n')
	ftmp.write('set_window_full -on\n')
	ftmp.write('set_field_prop -plot $myplot2D -geom $mydata2D @field@ -show_bands\n')
	#ftmp.write('set_vector_prop -plot $myplot2D -geom $mydata2D ElectricField-V -show\n')
	#ftmp.write('zoom_plot -plot $myplot2D -window {-1 0 10 24}\n')
	ftmp.write('export_view ../out_svisual/@fname@_@field@.png -plots $myplot2D -resolution 1500x1500 -format PNG -overwrite\n')
	#ftmp.write('set_material_prop [list_materials -plot $myplot2D] -show_mesh\n')
	#ftmp.write('export_view ../out_svisual/@fname@_@field@_mesh.png -plots $myplot2D -resolution 1500x1500 -format PNG -overwrite\n') 
	#ftmp.write('zoom_plot -plot $myplot2D -window {0 3.5 1.5 6.5}\n')
	#ftmp.write('export_view ../out_svisual/@fname@_@field@_zoom.png -plots $myplot2D -resolution 1500x1500 -format PNG -overwrite\n') 	
	ftmp.close()
	return 0

def field2png(inTDR):
	## Plot images
	basename=inTDR.rsplit('/',1)[1]
	#fields=['hDensity','eDensity','ElectrostaticPotential','Abs(ElectricField-V)','SpaceCharge','TotalCurrentDensity','eCurrentDensity','hCurrentDensity']
	fields=['AcceptorConcentration']
	for f in fields:
		tmplt_imgs()
		os.system("sed -i 's/@field@/"+f+"/g' tmp.tcl")
		os.system("sed -i 's/@inTDR@/"+inTDR.replace("/","\/")+"/g' tmp.tcl")
		os.system("sed -i 's/@fname@/"+basename+"/g' tmp.tcl")
		run_svisual()
	return 0
	
# ------------------------------
for i in range(11):
	tdrfile='../plts/back_'+str(i).zfill(4)+'_des.tdr'
	field2png(tdrfile)


