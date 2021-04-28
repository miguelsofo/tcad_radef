import os

def clean():
	os.system("rm ../logs/*")
	os.system("rm ../plts/*")
	os.system("rm ../currents/*")
	os.system("rm ../savs/*")
	os.system("rm ../out_svisual/*")
	return 0

#clean()
#os.system("sprocess SPROCESS.cmd")
#os.system("sdevice SDEVICE_iv_ford.cmd")
os.system("sdevice SDEVICE_iv_back.cmd")

