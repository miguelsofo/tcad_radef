import matplotlib.pyplot as plt 
import numpy as np
import pandas as pd

#data="../out_svisual/back_0004_des.tdr_ycut5.0um.csv"
#data="../out_svisual/back_0000_des.tdr_ycut5.0um.csv"
data="../out_svisual/init_peh_des.tdr_ycut5.0um.csv"
df=pd.read_csv(data,skiprows=[1])
df.info()
fig=plt.figure()

f="Abs(ElectricField-V)"
f="ElectricField-X"
f="ElectrostaticPotential"
f="AcceptorConcentration"
f="DonorConcentration"
f="eDensity"
f="hDensity"
y = df['X'].to_numpy()
z = df[f].to_numpy()
plt.plot(y,z,'.-',label=f)
plt.xlabel(r'x ($\mu$m)')
plt.ylabel('y')
plt.legend(loc="upper right")
plt.grid()
plt.show()
