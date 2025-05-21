clear
close all

dx = .01;
x = (0:dx:1);
ue = zeros(1,length(x));
Rel = 1 * 10^6;
u_gradient = -0.2;
n = length(x);
laminar = true;

for i = 1:length(x)
    ue(i) = 1 + x(i)*u_gradient; 
end

thwaites = 0;
theta_t = zeros(1,length(x));
theta_b = zeros(1,length(x));

i = 1;
while laminar && i < n
    i = i + 1;
    thwaites = thwaites + 0.45/Rel * ue(i)^(-6) * ueintbit(x(i-1),ue(i-1),x(i),ue(i));
    theta_t(i) = thwaites^0.5;

    Rethet = Rel * ue(i) * theta_t(i);

    m = -Rel * theta_t(i)^2 * u_gradient;
    H = thwaites_lookup(m);
    He = laminar_He(H);

    if log(Rethet) >= 18.4*He - 21.74
        laminar = false;
        disp([x(i) Rethet/1000])
    end
end

hold on
plot(x,theta_t)
legend('Thwaites','Location','southeast')
ylabel('θ/L')
xlabel('x/L') 