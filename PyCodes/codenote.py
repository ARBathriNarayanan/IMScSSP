#Whatever codes are written in Python, is available here. The code will be updated here as well as in the Jupyter notebook 
import cmath as cm

z=[4.00+0.001j,4.00-0.001j,-4.00+0.001j,-4.00-0.001j]

def msqrt(x):
    x=cm.sqrt(x)
    if x.imag<=0.0: x*=-1
    return x  

for i in range(len(z)):
    print (z[i],cm.sqrt(z[i]),msqrt(z[i]))



