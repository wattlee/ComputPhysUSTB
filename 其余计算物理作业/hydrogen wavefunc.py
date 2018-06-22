# function plot_phi(Z,a0,me,n,l,m,V)
import numpy as np
import math
import plotly
import plotly.plotly as py
import plotly.graph_objs as go
from skimage import measure
plotly.tools.set_credentials_file(username='wattlee', api_key='l1kNd2JlKNtLzhXgvp0U')


def LaguerreGen(*varargin):
    nargin = len(varargin)
    if nargin == 1:
        n = varargin[0]
        alpha = 0
    elif nargin == 2:
        n = varargin[0]
        alpha = varargin[1]

    if (nargin==0)or(nargin>2)or(n!=abs(round(n)))or(alpha<-1):
        print('n must be integer, and (optional) alpha >= -1')

    L = np.zeros(n+1,n+1)
    
    if n == 0:
        L[0,:] = np.ones(n+1)
    else:
        L[0,:] = [np.zeros(n),1]
        L[1,:] = [np.zeros(n-1),-1,(alpha+1)]
        for i in range(3,n+2):
            A1 = 1/(i-1) * (np.convolve(np.array([np.zeros(n-1), -1, (2*(i-1)+alpha-1)]),L[i-2,:]))
            A2 = 1/(i-1) * (np.convolve(np.array([np.zeros(n), ((i-1)+alpha-1)]), L[i-3,:]))
            B1 = A1[len(A1)-n-1:len(A1)-1]
            B2 = A2[len(A2)-n-1:len(A1)-1]
            L[i,:] = B1 - B2
    y = L[n,:]
    return y

def compute_Ylm(j,m,theta,phi):
    y = assoc_legendre(j, m, np.cos(theta))*np.exp(1j*m*phi)
    if m < 0:
        y = np.sqrt((2*j+1)/(4*np.pi)*np.prod(np.arange((j+m+1),(j-m+1),1)))*y
    else:
        y = np.sqrt((2*j+1)/(4*np.pi)/np.prod(np.arange((j-m+1),(j+m+1),1)))*y
    return y 

def assoc_legendre(j,m,x):
    if m < 0:
        m = -m
        px = assoc_legendre(j, m, x)
        px = (-1)**m*1/np.prod(np.arange((j-m+1),(j+m+1),1))*px
        return px

    p0 = (-1)**m*np.prod(np.arange((2*m-1),1-1,-2))*(1-x**2)**(m/2)
    p1 = x*((2*m+1)*p0)

    if j == m:
        px = p0
        return px
    elif j == m+1:
        px = p1
        return px

    for n in range(m+1,j):
        px = 1/(n - m + 1)*((2*n+1)*x*p1-(n+m)*p0)
        p0 = p1
        p1 = px
    return px


n = 3
l = 2
m = 0
Z = 1
a0 = 1
me = 1
V = 1.0e-2 # value of iso_abs_phi.

 
mn = 2000
# mu = (me.*mn)./(me + mn)
# amu = me./mu.*a0
mu = (me*mn)/(me +mn)
amu = me/mu*a0


rlims = 15
xlims = np.array([-rlims,rlims])
ylims = np.array([-rlims,rlims])
zlims = np.array([-rlims,rlims])

rn = 100
rx = rn
ry = rn
rz = rn

nx = 2*rx + 1
ny = 2*ry + 1
nz = 2*rz + 1

grids = np.zeros(nx,ny,nz)
x = np.tile(np.reshape(np.linspace(xlims(1),xlims(2),nx),(nx,1),order="F"),np.array([1,ny,nz]))
y = np.tile(np.reshape(np.linspace(ylims(1),ylims(2),ny),(1,ny),order="F"),np.array([nx,1,nz]))
z = np.tile(np.reshape(np.linspace(zlims(1),zlims(2),nz),(1,1,nz),order="F"),np.array([nx,ny,1]))

r = np.sqrt(x**2 + y**2 + z**2)
theta = np.arccos(z/np.sqrt(x**2 + y**2 + z**2))
phi = np.arctan2(y,x)

r1 = np.sqrt( (2*Z/n/amu) )**3 * (math.factorial(n-1-1)/(2*n*math.factorial(n+1)))
r2 = np.exp(-Z*r/n/amu)
r3 = (2*Z*r/n/amu)**l
r4 = np.polyval(LaguerreGen(n-l-1,2*l+1),2*Z*r/n/amu)

R = r1*r2*r3*r4

Y = compute_Ylm(l,m,theta,phi)

psi = R*Y

out = np.sqrt(psi*np.conj(psi))

res = np.meshgrid(np.arange(-rx,rx+1,1),np.arange(-ry,ry+1,1),np.arange(-rz,rz+1,1))

x1 = res(0)*rlims/rn
y1 = res(1)*rlims/rn
z1 = res(2)*rlims/rn

vertices, simplices = measure.marching_cubes_classic(out, V)
#x,y,z = zip(*vertices)
colormap=['rgb(255,105,180)','rgb(255,255,51)','rgb(0,191,255)']
fig = plotly.figure_factory.create_trisurf(x=x1,
                                           y=y1,
                                           z=z1,
                                           plot_edges=False,
                                           colormap=colormap,
                                           simplices=simplices,
                                           title="Isosurface")
py.iplot(fig)
