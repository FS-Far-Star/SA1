clear
close all

global Re ue0 duedx

Re = 10^7;
ue0 = 1;
duedx = 0;

x0 = 0.01;
thick0(1) = 0.037*x0*(Re*x0)^(-1/5);
thick0(2) = 1.80*thick0(1);