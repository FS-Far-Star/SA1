clear
close all

global Re ue0 duedx

Re = 10^7;
ue0 = 1;
duedx = -0.6;

x0 = 0.01;
thick0(1) = 0.037*x0*(Re*x0)^(-1/5);
thick0(2) = 1.80*thick0(1);

[delx, thickhist] = ode45(@thickdash,[0 0.99],thick0);


He = thickhist(:,2)./thickhist(:,1);
He = He(:);
threshold_He = 1.46;
cross_idx = find((He(1:end-1) > threshold_He) & (He(2:end) <= threshold_He), 1);

x = x0 + delx;
threshold = ones(length(x))*threshold_He;

if ~isempty(cross_idx)
    idx_before = cross_idx;
    idx_after = cross_idx + 1;
end

fprintf('Separation occurs between x/L = %.2e and x/L = %.2e\n', x(idx_before), x(idx_after));

mycolors = [1 0 0; 0 0 1];

figure;
hold on
plot(x,He)
plot(x,threshold)
ax = gca;
ax.ColorOrder = mycolors;
ylabel('He')
xlabel('x/L') 
hold off

figure;
hold on
plot(x,thickhist(:,1))
plot(x,thickhist(:,2))
legend('θ','δ_e','Location','southeast')
ax = gca;
ax.ColorOrder = mycolors;
ylabel('θ/L')
xlabel('x/L') 