% FUNCTION "NATS" - CALCULATION OF STATIONARY DISTRIBUTION
% AND TIME CONSTANT FOR Na TTX-S

function [tmNats,pmNats,thNats,phNats]=Nats(V);
am=11.49/(1+exp((V+8.58)/-8.47));
bm=11.49/(1+exp((V+67.2)/27.8));
ah=0.0658*exp(-(V+120)/20.33);
bh=3/(1+exp((V-6.8)/-12.998));
tmNats=1/(am+bm);
pmNats=am/(am+bm);
thNats=1/(ah+bh);
phNats=ah/(ah+bh);
return
