function [int,ils,itr,its,delta_e,theta_t] = bl_solv(x,cp)

np = length(x);

global Re duedx ue0

ue = sqrt(1-cp);
laminar = true;
int = 0;
ils = 0;
itr = 0;
its = 0;

thwaites = 0;
theta_t = zeros(1,length(x));

He = zeros(np,1);
He(1) = 1.57258;

i = 1;

while laminar && i < np
    i = i + 1;
    thwaites = thwaites + ueintbit(x(i-1),ue(i-1),x(i),ue(i));
    theta_t(i) = ( 0.45/Re * ue(i)^(-6) * thwaites)^0.5;

    Rethet = Re * ue(i) * theta_t(i);

    m = -Re * theta_t(i)^2 * duedx;
    H = thwaites_lookup(m);
    He(i) = laminar_He(H);

    if log(Rethet) >= 18.4*He(i) - 21.74
        int = i;
        laminar = false;
    elseif m >= 0.09
        ils = i;
        laminar = false;
        He(i) = 1.51509; %set to exact value
    end
end

delta_e = He(i).*theta_t(i);
while its == 0 && i<np
    i = i+1;
    thick0(1) = theta_t(i-1);
    thick0(2) = delta_e;
    ue0 = ue(i-1);
    duedx = (ue(i-1) - ue(i))/(x(i-1)-x(i));
    [~, thickhist] = ode45(@thickdash,[0,x(i)-x(i-1)],thick0);
    theta_t(i) = thickhist(end,1);
    delta_e = thickhist(end,2);
    He(i) = delta_e/theta_t(i);
    if He(i)>1.58 && ils~=0 && itr == 0
        itr = i;
    end
    if He(i)<1.46
        its = i;
    end
end

He(i:np) = He(i);
for m =i:np-1
    theta_t(m+1) = theta_t(m)*(ue(m)/ue(m+1))^(2.803+2);
end


end