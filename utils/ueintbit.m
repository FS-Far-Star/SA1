function f = ueintbit(xa,ua,xb,ub)
u_bar = (ua+ub)/2;
du = ub-ua;
dx = xb-xa;

f = dx * (u_bar^5 + (5 * u_bar^3 *du^2)/6 + (u_bar * du^4)/16);