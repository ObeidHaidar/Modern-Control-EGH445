clear all;

%% parameters

m=0.15;
Mc=0.4;
l=0.2;
g=9.81;

%% matrices xa

Aa=[0,0,1,0;0,0,0,1;0,-m*g/Mc,0,0;0,g*(Mc+m)/(l*Mc),0,0];
Ba=[0;0;1/Mc;-1/(l*Mc)];
Ca=eye(4);
Da=zeros(4,1);

%% controllability
C_AaBa=ctrb(Aa,Ba);
Rank =rank(C_AaBa);
if Rank == min(size(C_AaBa))
    disp('the linearised model is controllable')
end

%% compute the controller
Pa=[-3 -4 -5 -6];
Ka=place(Aa,Ba,Pa);
K_SF=Ka;
%% simulation
x10=0.2; %initial condition position
x20=deg2rad(20); %initial condition angle
x30=0; %initial condition velocity
x40=0; %initial condition angular velocity¸ç
x2_bar=0;

sim('CP_SFC_Lin_a_n9558292.slx')% linear
sim('CP_SFC_NLin_n9558292.slx')% non-linear

%% plot
figure
subplot(5,1,1)
plot(tout_NL,F_NL,ta,Fa,'--')
title('Control Force','FontSize',18)
legend('Non-Linear','Linear')
grid on
subplot(5,1,2)
plot(tout_NL,x1,ta,x1a,'--')
legend('Non-Linear','Linear')
title('Position x [m]','FontSize',18)
grid on
subplot(5,1,3)
plot(tout_NL,x2,ta,x2a,'--')
legend('Non-Linear','Linear')
title('Angle [rad]','FontSize',18)
grid on
subplot(5,1,4)
plot(tout_NL,x3,ta,x3a,'--')
legend('Non-Linear','Linear')
title('Velocity [m/s]','FontSize',18)
grid on
subplot(5,1,5)
plot(tout_NL,x4,ta,x4a,'--')
legend('Non-Linear','Linear')
title('Angular Velocity [rad/s]','FontSize',18)
grid on

%% animation linear
Cart_Pendulum_Animation(tout,x1a,x2a,0,0)
pause
%% animation non linear
Cart_Pendulum_Animation(tout,x1,x2,0,0)


