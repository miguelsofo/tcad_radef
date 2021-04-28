#set infile ../currents/ford_iv.plt
#set outfile  ../out_svisual/ford_iv.plt.csv
set infile ../currents/back_iv.plt
set outfile  ../out_svisual/back_iv.plt.csv
set mydata [load_file $infile]
export_variables -dataset $mydata -filename $outfile -overwrite
