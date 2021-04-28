import matplotlib.pyplot as plt
import numpy as np
import matplotlib.backends.backend_pdf
import pandas as pd

# ----------------------------------------
# Fordward:
ivf=pd.read_csv('../results/ford_iv.plt.csv',skiprows=[1])
fig=plt.figure()
plt.plot(ivf['a.cont OuterVoltage'].to_numpy(),ivf['a.cont TotalCurrent'].to_numpy()*1e3,'.-')
#plt.plot(ivf['a.cont OuterVoltage'].to_numpy(),ivf['a.cont eCurrent'].to_numpy()*1e3,'.-')
#plt.plot(ivf['a.cont OuterVoltage'].to_numpy(),ivf['a.cont hCurrent'].to_numpy()*1e3,'.-')
plt.xlabel('Vak (V)')
plt.ylabel('Ia (mA/um)')
plt.xlim([0,2])
plt.title('Fordward')
#plt.yscale('log')
plt.grid()
plt.show()
plt.close(fig)

# Backward:
ivb=pd.read_csv('../results/back_iv.plt.csv',skiprows=[1])
fig=plt.figure()
plt.plot(ivb['a.cont OuterVoltage'].to_numpy(),ivb['a.cont TotalCurrent'].to_numpy()*1e3,'.-')
plt.xlabel('Vak (V)')
plt.ylabel('Ia (mA/um)')
plt.title('Backward')
#plt.yscale('log')
plt.grid()
plt.show()
plt.close(fig)

exit()
