%% MainFile_Linearised_a_n9558292

clear all;

%% Load model and controller parameters
x10a_tilde=0; %initial condition position
x20a_tilde=pi; %initial condition angle
x30a_tilde=0; %initial condition velocity
x40a_tilde=0; %initial condition angular velocity
stepta_tilde=1; %Step time
stepia_tilde=0; %Step initial value
stepfa_tilde=10; %Step final value

m=0.15;
Mc=0.4;
l=0.2;
g=9.81;

%% simulation
sim('Cart_Pendulum_Linearised_a_n9558292')

%% Plots
figure(2)
subplot(5,1,1)
plot(touta_tilde,Fa_tilde)
title('Input Force','FontSize',18)
grid on
subplot(5,1,2)
plot(touta_tilde,x1a_tilde)
title('Position x [m]','FontSize',18)
grid on
subplot(5,1,3)
plot(touta_tilde,x2a_tilde)
title('Angle [rad]','FontSize',18)
grid on
subplot(5,1,4)
plot(touta_tilde,x3a_tilde)
title('Velocity [m/s]','FontSize',18)
grid on
subplot(5,1,5)
plot(touta_tilde,x4a_tilde')
title('Angular Velocity [rad/s]','FontSize',18)
grid on
