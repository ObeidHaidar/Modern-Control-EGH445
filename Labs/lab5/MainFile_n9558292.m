%% MainFile_n9558292

clear all;

%% Load model and controller parameters
x10=0; %initial condition position
x20=pi; %initial condition angle
x30=0; %initial condition velocity
x40=0; %initial condition angular velocity
stept=1; %Step time
stepi=0; %Step initial value
stepf=0.1; %Step final value

m=0.15;
Mc=0.4;
l=0.2;
g=9.81;

%% simulation
sim('Cart_Pendulum_n9558292.slx')

%% Plots
figure(1)
subplot(5,1,1)
plot(tout,Force)
title('Input Force','FontSize',18)
grid on
subplot(5,1,2)
plot(tout,x1)
title('Position x [m]','FontSize',18)
grid on
subplot(5,1,3)
plot(tout,x2)
title('Angle [rad]','FontSize',18)
grid on
subplot(5,1,4)
plot(tout,x3)
title('Velocity [m/s]','FontSize',18)
grid on
subplot(5,1,5)
plot(tout,x4')
title('Angular Velocity [rad/s]','FontSize',18)
grid on

%% animation
Cart_Pendulum_Animation(tout,x1,x2,0,0)