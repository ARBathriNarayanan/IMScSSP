#Had to use a text editor to write this code, so there might be bugs
import cmath as cm
import scipy as sp
from scipy.interpolate import pade 
import numpy as np
from numpy.polynomial import Polynomial as poly

#Constructing Pade Approximant using polynomial fit (Without noise)
#Hypothesis: This method might give a lot of errors

# Getting the data points required
#t=p**2
num = 100
p = np.linspace(1, num, num)
a0 = 1.04
r = 0.96
pd = [func(a0, r, p[i]) for i in range(len(p))]
#print(t,pd)

#Constructing the Pade polynomial fitting the data

# 1. Finding the best order polynomial for the function

ks=[]
for i in range(11):
    coeff=np.polyfit(p,pd,i)
    poly=np.poly1d(coeff)
    kaisq=0
    for j in range(num):
        kaisq=kaisq+(pd[j]-poly(p[j]))**2
    ks.append(kaisq)
imin=np.argmin(ks)
coeff=np.polyfit(p,pd,imin)

# 2. Getting the coefficients
coeff=np.flip(coeff)
print(coeff)

# 3.Optimization of (m,n) in Pade using Kai square
ks=[]
for i in range(len(coeff)-1,-1,-1):
    j=len(coeff)-i-1
    pi,qi=pade(coeff,j,i)
    gi=pi/qi
    kaisq=0
    for j in range(num):
        kaisq=kaisq+(pd[j]-pi(x[j])/qi(x[j]))**2
    ks.append(kaisq)
i=np.argmin(ks)
p=0
q=0
p,q=pade(coeff,i,len(coeff)-1-i)
p.r
