% FUNCTION "KDR" - CALCULATION OF STATIONARY DISTRIBUTION
% AND TIME CONSTANT FOR POTASSIUM

function [tnKdr,pnKdr]=Kdr(V)
a=0.001265*(V+14.273)./(1-exp((V+14.273)/-10));
b=0.125*exp((V+55)/-2.5);
tnKdr=1/(a+b);
pnKdr=(1+exp((V+14.62)/-18.38)).^-1;
return
