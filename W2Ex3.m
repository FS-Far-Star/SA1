clear
close all

dx = .01;
x = (0:dx:1);
ue = zeros(1,length(x));
Re = 1.8 * 10^6;
duedx = -0.5;
n = length(x);
laminar = true;
int = 0;
ils = 0;

for i = 1:length(x)
    ue(i) = 1 + x(i)*duedx; 
end

thwaites = 0;
theta_t = zeros(1,length(x));
theta_b = zeros(1,length(x));

i = 1;

while laminar && i < n
    i = i + 1;
    thwaites = thwaites + ueintbit(x(i-1),ue(i-1),x(i),ue(i));
    theta_t(i) = ( 0.45/Re * ue(i)^(-6) * thwaites)^0.5;

    Rethet = Re * ue(i) * theta_t(i);

    m = -Re * theta_t(i)^2 * duedx;
    H = thwaites_lookup(m);
    He = laminar_He(H);

    if log(Rethet) >= 18.4*He - 21.74
        int = i;
        laminar = false;
    elseif m >= 0.09
        ils = i;
        laminar = false;   
    end
end

format shortE;

if int ~= 0
disp(['Natural transition at ' num2str(x(int)) ...
 ' with Rethet ' sprintf('%.1e', Rethet)]) %2sf
end

if ils ~= 0
disp(['Separation at ' num2str(x(ils)) ...
 ' with Rethet ' sprintf('%.1e', Rethet)])
end

% hold on
% plot(x,theta_t)
% legend('Thwaites','Location','southeast')
% ylabel('θ/L')
% xlabel('x/L') 