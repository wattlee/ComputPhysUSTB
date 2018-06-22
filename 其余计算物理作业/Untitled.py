import numpy as np
import matplotlib.pyplot as plt
import math
import cmath
from mpl_toolkits.mplot3d import Axes3D

def Hydrogen_wavefunc(n,l,m,r,theta,phi):
    if n == 1 and l == 0 and m == 0:
        psi = np.exp(-r)
    if n == 2 and l == 0 and m == 0:
        psi = (2-r)*np.exp(-r/2)
    if n == 2 and l == 1 and m == 0:
        psi = r*np.exp(-r/2)*np.cos(theta)
    if n == 2 and l == 1 and m == 1:
        psi = r*np.exp(-r/2)*np.sin(theta)*np.exp(complex(0,1)*phi)
    if n == 3 and l == 0 and m == 0:
        psi = (27-18*r+2*r**2)*np.exp(-r/3)
    if n == 3 and l == 1 and m == 0:
        psi = (6-r)*r*np.exp(-r/3)*np.cos(theta)
    if n == 3 and l == 1 and m == 1:
        psi = (6-r)*r*np.exp(-r/3)*np.sin(theta)*np.exp(complex(0,1)*phi)
    if n == 3 and l == 2 and m == 0:
        psi = r**2*np.exp(-r/3)*(3*np.cos(theta)**2-1)
    if n == 3 and l == 2 and m == 1:
        psi = r**2*np.exp(-r/3)*np.sin(theta)*np.cos(theta)*np.exp(complex(0,1)*phi)
    if n == 3 and l == 2 and m == 2:
        psi = r**2*np.exp(-r/3)*np.sin(theta)**2*np.exp(complex(0,2)*phi)
    model = abs(psi)**2
    return model
r = np.linspace(1,11,1000)
theta = np.linspace(0,math.pi,1000)
phi = np.linspace(0,2*math.pi,1000)
x = r*np.sin(theta)*np.cos(phi)
y = r*np.sin(theta)*np.sin(phi)
z = r*np.cos(theta)
ax = plt.subplot(111, projection='3d')
# for n in range(1,4):
#     for l in range(0,n):
#         for m in range(0,l+1):
res = []
for i in range(100):
    for j in range(100):
        for k in range(100):
            prob = Hydrogen_wavefunc(3,2,0,r[i],theta[j],phi[k])
            if abs(prob - 10)<0.1:
                ax.scatter(x[i],y[i],z[i],marker = ',')
            res.append(prob)
ax.set_zlabel('Z')  # 坐标轴
ax.set_ylabel('Y')
ax.set_xlabel('X')
plt.show()
#print(res)
