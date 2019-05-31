clear
% MAIN SIMULATION MODULE - SUBFUNCTIONS BELOW
Cm=0.81; % Capacitance
Ena=62.94; % Reversal potential Na (mV)
Ek=-92.34; % Reversal potential K (mV)
El=-54.3; % Reversal potential Leak (mV)
gnats=35.135; % Peak Conductance Na TTX-S (mS/cm2)
gnatr=6.9005; % Peak Conductance Na TTX-R (mS/cm2)
gkdr=2.1; % Peak Conductance Potassium (mS/cm2)
gl=0.14; % Peak Conductance Leak (mS/cm2)
dt=.1; % Integration step (ms)
tmax=1000; % Simulation time (ms)
T=1:dt:tmax; % Timeline (ms)
% Memory allocation;
Inats(size(T))=0;
Inatr(size(T))=0;
Ikdr(size(T))=0;
If(size(T))=0;
Il(size(T))=0;
Is(size(T))=0;
ms(size(T))=0;
hs(size(T))=0;
mr(size(T))=0;
hr(size(T))=0;
sr(size(T))=0;
n(size(T))=0;
f(size(T))=0;
% Initial values
Vm(1)=-65;
[tmNats,pmNats,thNats,phNats]=Nats(Vm(1));
ms(1)=pmNats;
hs(1)=phNats;
[tmNatr,pmNatr,thNatr,phNatr,tsNatr,psNatr]=Natr(Vm(1));
mr(1)=pmNatr;
hr(1)=phNatr;
sr(1)=psNatr;
[tnKdr,pnKdr]=Kdr(Vm(1));
n(1)=pnKdr;
for i=1:size(T,2)
    Inats(i)=gnats*(ms(i)^3)*hs(i)*(Vm(i)-Ena);
    Inatr(i)=gnatr*mr(i)*hr(i)*sr(i)*(Vm(i)-Ena);
    Ikdr(i)=gkdr*n(i)*(Vm(i)-Ek);
    Il(i)=gl*(Vm(i)-El);
    Vm(i+1)=Vm(i)-(dt/Cm)*(Inats(i)+Inatr(i)+Ikdr(i)+Il(i));
    [tmNats,pmNats,thNats,phNats]=Nats(Vm(i+1));
    [dpms]=dp(dt,tmNats,pmNats,ms(i));
    ms(i+1)=ms(i)+dpms;
    [dphs]=dp(dt,thNats,phNats,hs(i));
    hs(i+1)=hs(i)+dphs;
    [tmNatr,pmNatr,thNatr,phNatr,tsNatr,psNatr]=Natr(Vm(i+1));
    [dpmr]=dp(dt,tmNatr,pmNatr,mr(i));
    mr(i+1)=mr(i)+dpmr;
    [dphr]=dp(dt,thNatr,phNatr,hr(i));
    hr(i+1)=hr(i)+dphr;
    [dphs]=dp(dt,tsNatr,psNatr,sr(i));
    sr(i+1)=sr(i)+dphs;
    [tnKdr,pnKdr]=Kdr(Vm(i+1));
    [dpkdr]=dp(dt,tnKdr,pnKdr,n(i));
    n(i+1)=n(i)+dpkdr;
end
plot(Vm)
