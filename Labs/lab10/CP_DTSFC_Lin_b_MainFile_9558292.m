clear all;

%% parameters

m=0.15;
Mc=0.4;
l=0.2;
g=9.81;

%% matrices

Ab=[0,0,1,0;0,0,0,1;0,-m*g/Mc,0,0;0,-g*(Mc+m)/(l*Mc),0,0];
Bb=[0;0;1/Mc;1/(l*Mc)];
Cb=eye(4);
Db=zeros(4,1);

%% continuous-time state-space model

sysc=ss(Ab,Bb,Cb,Db);

%% discrete-time state-space model

T_s=0.03;
sysdzoh=c2d(sysc,T_s,'zoh');

%% eigenvalues

Pb_c=[-3,-4,-5,-6];
Pb_d= exp(T_s*Pb_c);

%% controllability

K_db = place(sysdzoh.A,sysdzoh.B,Pb_d);
K_b=K_db;

%% simulation
x10=0.2; %initial condition position
x20=deg2rad(20); %initial condition angle
x30=0; %initial condition velocity
x40=0; %initial condition angular velocity¸ç
sim('CP_DTSFC_Lin_b_9558292') % Discrete-time model
sim('CP_SD_SFC_Lin_b_9558292' )%Sampled-data model

%% plot
figure
subplot(5,1,1)
stem(tda,x1da)
hold on
plot(ta,x1a,'r')
legend('Discrete-time model','sampled-data model')
title('Position x [m]','FontSize',18)
grid on
subplot(5,1,2)
stem(tda,x2da)
hold on
plot(ta,x2a,'r')
legend('Discrete-time model','sampled-data model')
title('Angle [rad]','FontSize',18)
grid on
subplot(5,1,3)
stem(tda,x3da)
hold on
plot(ta,x3a,'r')
legend('Discrete-time model','sampled-data model')
title('Velocity [m/s]','FontSize',18)
grid on
subplot(5,1,4)
stem(tda,x4da)
hold on
plot(ta,x4a,'r')
legend('Discrete-time model','sampled-data model')
title('Angular Velocity [rad/s]','FontSize',18)
grid on
subplot(5,1,5)
stem(tda,Fda)
hold on
plot(ta,Fa,'r')
legend('Discrete-time model','sampled-data model')
title('Control Force [N]','FontSize',18)
grid on
