%% Quadrotor parameters
m=0.5;
J= 0.0112;
bt=1;
g=9.8;
l=0.2;
lf=l;
lr=l;

%% Set initial conditions for generalised displacements and momenta to zero

cipx=0;
cipy=0;
ciLtheta=0;
cix=0;
ciy=0;
citheta=0;

%% reference signals

xref=10;
txref=1;

yref=10;
tyref=1;


Acx=4;
Tcx=30;

Acy=4;
Tcy=30;

SteptTc=20;

SteptOff=80;


%% Controller

kx=.5;
ky=.5;
kt=5;
kvx=.1;
kvy=1;
kvt=5;

