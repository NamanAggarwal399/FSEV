%LAFI=[157.17 254.2 156.27]; %lower a arm front
%LARI=[-249.58 254.2 156.27]; %lower a arm rear
%UAFI=[85.21 254.2 329.7];%upper A-arm front
%UARI=[-221.49 254.2 313.24]; %upper a arm rear
%UBJ=[-14.05 565.6 353.86];%upper ball joint
%LBJ=[14.05 572.58 153.99];%lower ball joint
%PRI=[-14.05 327.58 117.4];%pull rod inboard point
%PRO=[-14.05 468.40 319.54];%pull rod outboard point
%TCP=[14.05 605  0];%tire contact point
%TRI=[91.43 243.43 206.27]; %tie rod chassis point
%TRO=[95.3800  538.7700  214.150]; %tie rod knuckle point

r1x=157.17, r1y=254.2, r1z=156.27;
r2x=-249.58, r2y=254.2, r2z=156.27;
r3x=85.21, r3y=254.2, r3z=329.7;
r4x=-221.49, r4y=254.2, r4z=313.24;
r5x=-14.05, r5y=565.6, r5z=353.86;
r6x=14.05, r6y=572.58, r6z=153.99;
r7x=-14.05, r7y=327.58, r7z=117.4;
r8x=-14.05, r8y=468.40, r8z=319.54;
r9x=14.05, r9y=605, r9z=0;
r10x=91.43, r10y=243.43, r10z=206.27;
r11x=95.38, r11y=538.77, r11z=214.15;

rlx=r6x-r9x, rly=r6y-r9y, rlz=r6z-r9z; %LBJ r vector
rrx=r5x-r9x, rry=r5y-r9y, rrz=r5z-r9z; % UBJ r vector
rpx=r8x-r9x, rpy=r8y-r9y, rpz=r8z-r9z; % Pull Rod r vector
rtx=r11x-r9x, rty=r11y-r9y, rtz=r11z-r9z; %Tie Rod r vector

rF1x=r1x-r6x, rF1y=r1y-r6y, rF1z=r1z-r6z; % F1 on Lower a arm front
rF2x=r2x-r6x, rF2y=r2y-r6y, rF2z=r2z-r6z; % F2 on Lower a arm rear
rF3x=r3x-r5x, rF3y=r3y-r5y, rF3z=r3z-r5z; % F3 on upper a arm front
rF4x=r4x-r5x, rF4y=r4y-r5y, rF4z=r4z-r5z; % F4 on upper a arm rear
rF5x=r7x-r8x, rF5y=r7y-r8y, rF5z=r7z-r8z; % F5 on pull rod
rF6x=r10x-r11x, rF6y=r10y-r11y, rF6z=r10z-r11z; % F6 on tie rod













