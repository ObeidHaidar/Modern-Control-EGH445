%% MainFile_Linearised_b_n9558292

clear all;

%% Load model and controller parameters
x10b_tilde=0; %initial condition position
x20b_tilde=pi; %initial condition angle
x30b_tilde=0; %initial condition velocity
x40b_tilde=0; %initial condition angular velocity
steptb_tilde=1; %Step time
stepib_tilde=0; %Step initial value
stepfb_tilde=0.1; %Step final value

m=0.15;
Mc=0.4;
l=0.2;
g=9.81;

%% simulation
sim('Cart_Pendulum_Linearised_b_n9558292')

%% Plots
figure(3)
subplot(5,1,1)
plot(toutb_tilde,Fb_tilde)
title('Input Force','FontSize',18)
grid on
subplot(5,1,2)
plot(toutb_tilde,x1b_tilde)
title('Position x [m]','FontSize',18)
grid on
subplot(5,1,3)
plot(toutb_tilde,x2b_tilde)
title('Angle [rad]','FontSize',18)
grid on
subplot(5,1,4)
plot(toutb_tilde,x3b_tilde)
title('Velocity [m/s]','FontSize',18)
grid on
subplot(5,1,5)
plot(toutb_tilde,x4b_tilde')
title('Angular Velocity [rad/s]','FontSize',18)
grid on

%% compare both
figure(3)
subplot(5,1,1)
plot(touta_tilde,Fa_tilde,toutb_tilde,Fb_tilde)
title('Input Force','FontSize',18)
legend('a','b')
grid on
subplot(5,1,2)
plot(touta_tilde,x1a_tilde,toutb_tilde,x1b_tilde)
title('Position x [m]','FontSize',18)
legend('a','b')
grid on
subplot(5,1,3)
plot(touta_tilde,x2a_tilde,toutb_tilde,x2b_tilde)
title('Angle [rad]','FontSize',18)
legend('a','b')
grid on
subplot(5,1,4)
plot(touta_tilde,x3a_tilde,toutb_tilde,x3b_tilde)
title('Velocity [m/s]','FontSize',18)
legend('a','b')
grid on
subplot(5,1,5)
plot(touta_tilde,x4a_tilde,toutb_tilde,x4b_tilde')
title('Angular Velocity [rad/s]','FontSize',18)
legend('a','b')
grid on