clear all;

%% parameters

m=0.15;
Mc=0.4;
l=0.2;
g=9.81;

%% matrices xa

Ab=[0,0,1,0;0,0,0,1;0,-m*g/Mc,0,0;0,-g*(Mc+m)/(l*Mc),0,0];
Bb=[0;0;1/Mc;1/(l*Mc)];
Cb=eye(4);
Db=zeros(4,1);

%% controllability
C_AbBb=ctrb(Ab,Bb);
Rank =rank(C_AbBb);
if Rank == min(size(C_AbBb))
    disp('the linearised model is controllable')
end

%% compute the controller
Pb=[-3 -4 -5 -6];
Kb=place(Ab,Bb,Pb);
K_SF=Kb;
%% simulation
x10=0.4; %initial condition position
x20=deg2rad(200); %initial condition angle
x30=0; %initial condition velocity
x40=0; %initial condition angular velocity¸ç
x2_bar=pi;
sim('CP_SFC_Lin_b_n9558292.slx')% linear
sim('CP_SFC_NLin_n9558292.slx')% non-linear

%% plot
figure
subplot(5,1,1)
plot(tout_NL,F_NL,tb,Fb,'--')
title('Control Force','FontSize',18)
legend('Non-Linear','Linear')
grid on
subplot(5,1,2)
plot(tout_NL,x1,tb,x1b,'--')
legend('Non-Linear','Linear')
title('Position x [m]','FontSize',18)
grid on
subplot(5,1,3)
plot(tout_NL,x2,tb,x2b,'--')
legend('Non-Linear','Linear')
title('Angle [rad]','FontSize',18)
grid on
subplot(5,1,4)
plot(tout_NL,x3,tb,x3b,'--')
legend('Non-Linear','Linear')
title('Velocity [m/s]','FontSize',18)
grid on
subplot(5,1,5)
plot(tout_NL,x4,tb,x4b,'--')
legend('Non-Linear','Linear')
title('Angular Velocity [rad/s]','FontSize',18)
grid on

%% animation linear
Cart_Pendulum_Animation(tout,x1b,x2b,0,pi)
%% animation non linear
% Cart_Pendulum_Animation(tout,x1,x2,0,pi)


