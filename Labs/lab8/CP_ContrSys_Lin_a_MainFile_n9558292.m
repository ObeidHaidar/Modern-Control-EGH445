clear all;

%% parameters

m=0.15;
Mc=0.4;
l=0.2;
g=9.81;

%% matrices

Aa=[0,0,1,0;0,0,0,1;0,-m*g/Mc,0,0;0,g*(Mc+m)/(l*Mc),0,0];
Ba=[0;0;1/Mc;-1/(l*Mc)];
Ca=[1,0,0,0;0,1,0,0];
Da=zeros(2,1);

%% controllability
OB=obsv(Aa,Ca);
Rank =rank(OB);
if Rank == min(size(OB))
    disp('the linearised model is observable')
end

%% compute the controller
PLa=[-63 -64 -65 -66];
La=place(Aa',Ca',PLa)';
Pa=[-3 -4 -5 -6];
Ka=place(Aa,Ba,Pa);
K_SF=Ka;
%% simulation
x10=0.2; %initial condition position
x20=deg2rad(20); %initial condition angle
x30=0; %initial condition velocity
x40=0; %initial condition angular velocity¸ç
x2_bar=0;
x1_bar=0;
sim('CP_ContrSys_Lin_a_n9558292') % linear
sim('CP_ContrSys_NLin_n9558292.slx' )%nonlinear

%% plot
figure
subplot(4,1,1)
plot(tout_NL,x1,tout_NL,x1hat,ta,x1a,'--',ta,x1ahat,'--')
legend('Non-Linear','Non-Linear hat','Linear','Linear hat')
title('Position x [m]','FontSize',18)
grid on
subplot(4,1,2)
plot(tout_NL,x2,tout_NL,x2hat,ta,x2a,'--',ta,x2ahat,'--')
legend('Non-Linear','Non-Linear hat','Linear','Linear hat')
title('Angle [rad]','FontSize',18)
grid on
subplot(4,1,3)
plot(tout_NL,x3,tout_NL,x3hat,ta,x3a,'--',ta,x3ahat,'--')
legend('Non-Linear','Non-Linear hat','Linear','Linear hat')
title('Velocity [m/s]','FontSize',18)
grid on
subplot(4,1,4)
plot(tout_NL,x4,tout_NL,x4hat,ta,x4a,'--',ta,x4ahat,'--')
legend('Non-Linear','Non-Linear hat','Linear','Linear hat')
title('Angular Velocity [rad/s]','FontSize',18)
grid on
