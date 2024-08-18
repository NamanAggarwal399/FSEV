

forces(1.4*1500, 1.4*1500, 1500)

function [F1, F2, F3, F4, F5, F6]= forces(al, ac, aw)

LAFI=[157.17 254.2 156.27]; %lower a arm front
LARI=[-249.58 254.2 156.27]; %lower a arm rear
UAFI=[85.21 254.2 329.7];%upper A-arm front
UARI=[-221.49 254.2 313.24]; %upper a arm rear
UBJ=[-14.05 565.6 353.86];%upper ball joint
LBJ=[14.05 572.58 153.99];%lower ball joint
PRI=[-14.05 327.58 117.4];%pull rod inboard point
PRO=[-14.05 468.40 319.54];%pull rod outboard point
TCP=[14.05 605  0];%tire contact point
TRI=[91.43 243.43 206.27]; %tie rod chassis point
TRO=[95.3800  538.7700  214.150]; %tie rod knuckle point

rLBJ=(LBJ-TCP)/norm(LBJ-TCP);
rUBJ=(UBJ-TCP)/norm(UBJ-TCP);
rPRO=(PRO-TCP)/norm(PRO-TCP);
rTRO=(TRO-TCP)/norm(TRO-TCP);

rF1=(LAFI-LBJ)/norm(LAFI-LBJ);
rF2=(LARI-LBJ)/norm(LARI-LBJ);
rF3=(UAFI-UBJ)/norm(UAFI-UBJ);
rF4=(UARI-UBJ)/norm(UARI-UBJ);
rF5=(PRI-PRO)/norm(PRI-PRO);
rF6=(TRI-TRO)/norm(TRI-TRO);

rM1=(cross(rLBJ,rF1))/norm(cross(rLBJ,rF1));
rM2=(cross(rLBJ,rF2))/norm(cross(rLBJ,rF2));
rM3=(cross(rUBJ,rF3))/norm(cross(rUBJ,rF3));
rM4=(cross(rUBJ,rF4))/norm(cross(rUBJ,rF4));
rM5=(cross(rPRO,rF5))/norm(cross(rPRO,rF5));
rM6=(cross(rTRO,rF6))/norm(cross(rTRO,rF6));


g=9.8; %Acceleration due to gravity
syms F1 F2 F3 F4 F5 F6
eqn1= F1*rF1(1)+F2*rF2(1)+F3*rF3(1)+F4*rF4(1)+F5*rF5(1)+F6*rF6(1)==al;
eqn2= F1*rF1(2)+F2*rF2(2)+F3*rF3(2)+F4*rF4(2)+F5*rF5(2)+F6*rF6(2)==ac;
eqn3= F1*rF1(3)+F2*rF2(3)+F3*rF3(3)+F4*rF4(3)+F5*rF5(3)+F6*rF6(3)==aw;
eqn4= F1*rM1(1)+F2*rM2(1)+F3*rM3(1)+F4*rM4(1)+F5*rM5(1)+F6*rM6(1)==0;
eqn5= F1*rM1(2)+F2*rM2(2)+F3*rM3(2)+F4*rM4(2)+F5*rM5(2)+F6*rM6(2)==0;
eqn6= F1*rM1(3)+F2*rM2(3)+F3*rM3(3)+F4*rM4(3)+F5*rM5(3)+F6*rM6(3)==0;

sol = solve([eqn1, eqn2, eqn3, eqn4, eqn5, eqn6], [F1, F2, F3, F4, F5, F6]);
F1= double(sol.F1)
F2= double(sol.F2)
F3= double(sol.F3)
F4= double(sol.F4)
F5= double(sol.F5)
F6= double(sol.F6)

end







 

