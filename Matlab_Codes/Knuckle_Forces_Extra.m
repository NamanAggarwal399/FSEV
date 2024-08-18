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

rLBJ=(LBJ-TCP);
rUBJ=(UBJ-TCP);
rPRO=(PRO-TCP);
rTRO=(TRO-TCP);

rF1=(LAFI-LBJ)/norm(LAFI-LBJ);
rF2=(LARI-LBJ)/norm(LARI-LBJ);
rF3=(UAFI-UBJ)/norm(UAFI-UBJ);
rF4=(UARI-UBJ)/norm(UARI-UBJ);
rF5=(PRI-PRO)/norm(PRI-PRO);
rF6=(TRI-TRO)/norm(TRI-TRO);

rM1=(cross(rLBJ/1000,rF1));
rM2=(cross(rLBJ/1000,rF2));
rM3=(cross(rUBJ/1000,rF3));
rM4=(cross(rUBJ/1000,rF4));
rM5=(cross(rPRO/1000,rF5));
rM6=(cross(rTRO/1000,rF6));


%g=9.8; %Acceleration due to gravity
%syms F1 F2 F3 F4 F5 F6
%eqn1= F1*rF1(1)+F2*rF2(1)+F3*rF3(1)+F4*rF4(1)+F5*rF5(1)+F6*rF6(1)==1.4*1391.8;
%eqn2= F1*rF1(2)+F2*rF2(2)+F3*rF3(2)+F4*rF4(2)+F5*rF5(2)+F6*rF6(2)==1.4*1391.8;
%eqn3= F1*rF1(3)+F2*rF2(3)+F3*rF3(3)+F4*rF4(3)+F5*rF5(3)+F6*rF6(3)==-1391.8;
%eqn4= F1*rM1(1)+F2*rM2(1)+F3*rM3(1)+F4*rM4(1)+F5*rM5(1)+F6*rM6(1)==0;
%eqn5= F1*rM1(2)+F2*rM2(2)+F3*rM3(2)+F4*rM4(2)+F5*rM5(2)+F6*rM6(2)==0;
%eqn6= F1*rM1(3)+F2*rM2(3)+F3*rM3(3)+F4*rM4(3)+F5*rM5(3)+F6*rM6(3)==0;

%sol = solve([eqn1, eqn2, eqn3, eqn4, eqn5, eqn6], [F1, F2, F3, F4, F5, F6]);
%C=[rF1(1) rF1(2) rF1(3) rM1(1) rM1(2) rM1(3); rF2(1) rF2(2) rF2(3) rM2(1) rM2(2) rM2(3);
   % rF3(1) rF3(2) rF3(3) rM3(1) rM3(2) rM3(3); rF4(1) rF4(2) rF4(3) rM4(1) rM4(2) rM4(3);
   % rF5(1) rF5(2) rF5(3) rM5(1) rM5(2) rM5(3); rF6(1) rF6(2) rF6(3) rM6(1) rM6(2) rM6(3)]
%d=[1.4*1391.8; 1.4*1391.8; 1391.8; 0; 0; 0]
%sol= lsqnonneg(C,d)
%ans=C\d

C=[rF1(1) rF2(1) rF3(1) rF4(1) rF5(1) rF6(1); rF1(2) rF2(2) rF3(2) rF4(2) rF5(2) rF6(2);
    rF1(3) rF2(3) rF3(3) rF4(3) rF5(3) rF6(3); rM1(1) rM2(1) rM3(1) rM4(1) rM5(1) rM6(1);
    rM1(2) rM2(2) rM3(2) rM4(2) rM5(2) rM6(2); rM1(3) rM2(3) rM3(3) rM4(3) rM5(3) rM6(3)]
d=[1.4*1391.8; 1.4*1391.8; -1391.8; 0; 0; 0]
ans=C\d;
%F1= double(sol.F1)
%F2= double(sol.F2)
%F3= double(sol.F3)
%F4= double(sol.F4)
%F5= double(sol.F5)
%F6= double(sol.F6)

C1 = [rF1(1) rF2(1) rF3(1) rF4(1) rF5(1) rF6(1);
    rF1(2) rF2(2) rF3(2) rF4(2) rF5(2) rF6(2)
    rF1(3) rF2(3) rF3(3) rF4(3) rF5(3) rF6(3)];


Ct = (transpose(C1));

%Result of components of forces
ans = transpose(ans);
LAF = (ans(1))*Ct(1,:)
LAR = (ans(2))*Ct(2,:)
UAF = (ans(3))*Ct(3,:)
UAR = (ans(4))*Ct(4,:)
PR = (ans(5))*Ct(5,:)
TR = (ans(6))*Ct(6,:)

F1magn =sqrt(sum(LAF.*LAF));
F2magn =sqrt(sum(LAR.*LAR));
F3magn =sqrt(sum(UAF.*UAF));
F4magn =sqrt(sum(UAR.*UAR));
F5magn =sqrt(sum(PR.*PR));
F6magn =sqrt(sum(TR.*TR));


%Validation of forces in X,Y,Z direction.
Fxn = LAF(1)+LAR(1)+UAF(1)+UAR(1)+PR(1)+TR(1) 
Fyn = LAF(2)+LAR(2)+UAF(2)+UAR(2)+PR(2)+TR(2)
Fzn = LAF(3)+LAR(3)+UAF(3)+UAR(3)+PR(3)+TR(3)

Fubjn = UAF+UAR+PR %Force applied on UBJ
Flbjn = LAF+LAR %Force applied on LBJ
Ftien = TR %Force applied on Tierod