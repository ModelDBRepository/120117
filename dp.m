% FUNCTION "DP" - RUNGE-KUTTA CALCULATION OF DIFFERENTIAL

function [dp]=dp(dt,tau,Inf,p0)
d1=(Inf-p0)/tau;
p1=p0+.5*dt*d1;
d2=(Inf-p1)/tau;
p2=p0+.5*dt*d2;
d3=(Inf-p2)/tau;
p3=p0+dt*d3;
d4=(Inf-p3)/tau;
dp=dt*(d1+2*d2+2*d3+d4)/6;
return
