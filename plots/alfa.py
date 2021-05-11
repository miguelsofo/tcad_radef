import matplotlib.pyplot as plt
import numpy as np
import matplotlib.backends.backend_pdf
import pandas as pd

# ----------------------------------------
iv=pd.read_csv('../results/alfa.plt.csv',skiprows=[1])
iv.info()

fig=plt.figure()
plt.plot(iv['time'].to_numpy()*1e9,iv['a.cont TotalCurrent'].to_numpy()*1e3,'.-')
plt.xlabel('time (ns)')
plt.ylabel('Ia (mA/um)')
plt.title('Alfa')
plt.grid()
plt.show()
plt.close(fig)

times=[0, 1e-9, 1.01e-9, 1.02e-9, 1.03e-9, 1.04e-9, 1.05e-9, 1.1e-9, 1.2e-9, 1.3e-9, 1.5e-9, 2e-9, 3e-9, 5e-9, 10e-9, 15e-9, 20e-9, 25e-9, 30e-9, 35e-9, 40e-9]
for i in range(0,len(times)):
	fig=plt.figure()
	ia=iv['a.cont TotalCurrent'].to_numpy()*1e3
	plt.plot(iv['time'].to_numpy()*1e9,ia,'.-')
	plt.vlines(times[i]*1e9,ymin=np.min(ia)*1.1,ymax=np.max(ia)*1.1,label='%0.2lf ns'%(times[i]*1e9),color='red')
	plt.xlabel('time (ns)')
	plt.ylabel('Ia (mA/um)')
	plt.title('Alfa')
	plt.legend(loc='lower right')
	plt.grid()
	plt.savefig('alfa'+str(i)+'.png')
	plt.show()
	plt.close(fig)

fig=plt.figure()
plt.plot(iv['time'].to_numpy()*1e9,iv['Integr eDensity'].to_numpy(),'.-',label='e')
plt.plot(iv['time'].to_numpy()*1e9,iv['Integr hDensity'].to_numpy(),'.-',label='h')
plt.xlabel('time (ns)')
plt.ylabel('Integr eDensity')
plt.legend(loc='upper right')
plt.title('Alfa')
plt.grid()
plt.show()
plt.close(fig)
exit()
