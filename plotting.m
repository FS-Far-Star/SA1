% Load the .mat file
data = load(['Data/tryout.mat']);
data_2 = load(['Data/tryout2.mat']);

% Assuming variable names are: alpha, cl, cd
alpha = data.alpha;  % Angle of attack (degrees)
alpha2 = data_2.alpha;  % Angle of attack (degrees)
ld = data.lovdswp;      % Lift to Drag
ld2 = data_2.lovdswp;      % Lift to Drag
cl = data.clswp;        % Lift coefficient
cd = data.cdswp;        % Drag coefficient
cl2 = data_2.clswp;        % Lift coefficient
cd2 = data_2.cdswp;        % Drag coefficient

figure;
plot(alpha, ld, 'r--', 'LineWidth', 2);     % Plot first dataset
hold on;                                   % Keep current plot
plot(alpha2, ld2, 'b-', 'LineWidth', 2);  % Plot second dataset with different style
legend('Re = 5e5','Re = 2e7')
xlabel('\alpha (deg)');
ylabel('Lift to Drag');
title('Lift to Drag vs Angle of Attack');
grid on;
