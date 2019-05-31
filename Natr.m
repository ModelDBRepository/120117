% FUNCTION "NATR" - CALCULATION OF STATIONARY DISTRIBUTION
% AND TIME CONSTANT FOR Na TTX-R

function [tmNatr,pmNatr,thNatr,phNatr,tsNatr,psNatr]=Natr(V)
am=1.032/(1+exp((V+6.99)/-14.8712));
bm=5.79/(1+exp((V+130.4)/22.9));
ah=0.06435/(1+exp((V+73.26)/3.719));
bh=0.135/(1+exp((V+10.28)/-9.093));
as=0.00000016*exp(-(V)/12);
bs=0.0005/(1+exp(-(V+32)/23));
tmNatr=1/(am+bm);
pmNatr=am/(am+bm);
thNatr=1/(ah+bh);
phNatr=ah/(ah+bh);
tsNatr=1/(as+bs);
psNatr=as/(as+bs);
return
