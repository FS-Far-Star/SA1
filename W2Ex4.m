clear
close all

global Re ue0 duedx

Re = 10^7;
ue0 = 1;
duedx = 0;

x0 = 0.01;
thick0(1) = 0.037*x0*(Re*x0)^(-1/5);
thick0(2) = 1.80*thick0(1);

[delx, thickhist] = ode45(@thickdash,[0 0.99],thick0);

theta7 = zeros(length(delx),1);
theta9 = zeros(length(delx),1);

x = x0 + delx;

for i = 1:length(delx)
    theta7(i) = 0.037 * x(i) * (Re * x(i))^(-1/5);
    theta9(i) = 0.023 * x(i) * (Re * x(i))^(-1/6);
end

mycolors = [1 0 0; 0 1 0; 0 0 1];

hold on
plot(x,thickhist(:,1))
plot(x,theta7)
plot(x,theta9)
legend('theta','theta7', 'theta9','Location','southeast')
ax = gca;
ax.ColorOrder = mycolors;
ylabel('θ/L')
xlabel('x/L') 