clear all
% Load the .mat file
data = load('Data\naca0012.mat');

% Inspect variable names
disp(fieldnames(data));

% Assuming variable names are: alpha, cl, cd
alpha = data.alpha;  % Angle of attack (degrees)
cl = data.clswp;        % Lift coefficient
cd = data.cdswp;        % Drag coefficient

% Plot Cl vs Alpha
figure;
plot(alpha, cl, 'b-', 'LineWidth', 2);
xlabel('\alpha (deg)');
ylabel('C_L');
title('Lift Coefficient vs. Angle of Attack');
grid on;

% Plot Cd vs Alpha
figure;
plot(alpha, cd, 'r-', 'LineWidth', 2);
xlabel('\alpha (deg)');
ylabel('C_D');
title('Drag Coefficient vs. Angle of Attack');
grid on;

% Plot Cd vs Cl
figure;
plot(cl, cd, 'r-', 'LineWidth', 2);
xlabel('C_L');
ylabel('C_D');
title('Drag Coefficient vs. Lift Coefficient');
grid on;
