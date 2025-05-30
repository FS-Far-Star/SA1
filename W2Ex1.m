clear
close all

x = (0:.01:1);
ue = ones(length(x));
Re = 2500;

thwaites = 0;
theta_t = zeros(1,length(x));
theta_b = zeros(1,length(x));

for i = 2:length(x)
    thwaites = thwaites + ueintbit(x(i-1),ue(i-1),x(i),ue(i));
    theta_t(i) = (0.45/Re * ue(i)^(-6) * thwaites)^0.5;
    theta_b(i) = 0.664/(Re^0.5) * x(i)^0.5;
end

mycolors = [1 0 0; 0 0 1];

hold on
plot(x,theta_t)
plot(x,theta_b)
legend('Thwaites', 'Blasius','Location','southeast')
ax = gca;
ax.ColorOrder = mycolors;
ylabel('θ/L')
xlabel('x/L') 