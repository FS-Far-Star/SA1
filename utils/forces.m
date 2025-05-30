function [cl cd] = forces(circ,cp,delstarl,thetal,delstaru,thetau)

cl = -2*circ;

theta_te = thetal(length(thetal)) + tetau(length(thetau));
del_te = delstarl(length(delstarl)) + delsaru(length(delstaru));

H_te = del_te/theta_te;

ue_te = (1-cp(length(cp)))^(0.5);

theta_inf = theta_te * ue_te ^ ((H_te+5)/2);

cd = 2*theta_inf;