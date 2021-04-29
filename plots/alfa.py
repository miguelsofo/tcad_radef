import matplotlib.pyplot as plt
import numpy as np
import matplotlib.backends.backend_pdf
import pandas as pd

# ----------------------------------------
iv=pd.read_csv('../out_svisual/alfa.plt.csv',skiprows=[1])
iv.info()

fig=plt.figure()
plt.plot(iv['time'].to_numpy()*1e9,iv['a.cont TotalCurrent'].to_numpy()*1e3,'.-')
plt.xlabel('time (ns)')
plt.ylabel('Ia (mA/um)')
plt.title('Alfa')
plt.grid()
plt.show()
plt.close(fig)

fig=plt.figure()
plt.plot(iv['time'].to_numpy()*1e9,iv['Integr eDensity'].to_numpy(),'.-',label='e')
plt.plot(iv['time'].to_numpy()*1e9,iv['Integr hDensity'].to_numpy(),'.-',label='h')
plt.xlabel('time (ns)')
plt.ylabel('Ia (mA/um)')
plt.legend(loc='upper right')
plt.title('Alfa')
plt.grid()
plt.show()
plt.close(fig)

exit()
