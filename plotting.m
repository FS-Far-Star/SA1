caseref = 'GOE462'
% Load the .mat file
data = load(['Data/' caseref '.mat']);
data_5 = load(['Data/' caseref '_3.2.mat']);

% Inspect variable names
% disp(fieldnames(data));

% Assuming variable names are: alpha, cl, cd
alpha = data.alpha;  % Angle of attack (degrees)
cl = data.clswp;        % Lift coefficient
cd = data.cdswp;        % Drag coefficient
ld = data.lovdswp;      % Lift to Drag
xs = data_5.xs;
cp = data_5.cp;

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

% Plot L to D vs Alpha
figure;
plot(alpha, ld, 'r-', 'LineWidth', 2);
xlabel('\alpha (deg)');
ylabel('Lift to Drag');
title('Lift to Drag vs angle of attack');
grid on;

% Plot C_p
figure;
plot(xs, cp, 'r-', 'LineWidth', 2);
xlabel('xs');
ylabel('C_pp');
title('C_p along the section');
grid on;