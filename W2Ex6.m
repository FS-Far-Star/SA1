clear
close all

global Re ue0 duedx
Re_list = [1e5, 1e6, 1e4];
legend_labels = cell(1, numel(Re_list));

figure(1); clf; hold on; 
figure(2); clf; hold on; 

for j = 1:length(Re_list)
    Re = Re_list(j);
    ue0 = 1;
    duedx = -0.6;
    
    dx = .01;
    x = (0:dx:1);
    ue = zeros(1,length(x));
    duedx = -0.25;
    n = length(x);
    laminar = true;
    int = 0;
    ils = 0;
    itr = 0;
    its = 0;
    
    for i = 1:length(x)
        ue(i) = 1 + x(i)*duedx; 
    end
    
    thwaites = 0;
    theta_t = zeros(1,length(x));
    theta_b = zeros(1,length(x));
    
    He = zeros(n,1);
    He(1) = 1.57258;
    
    i = 1;
    
    while laminar && i < n
        i = i + 1;
        thwaites = thwaites + ueintbit(x(i-1),ue(i-1),x(i),ue(i));
        theta_t(i) = ( 0.45/Re * ue(i)^(-6) * thwaites)^0.5;
    
        Rethet = Re * ue(i) * theta_t(i);
    
        m = -Re * theta_t(i)^2 * duedx;
        H = thwaites_lookup(m);
        He(i) = laminar_He(H);
    
        if log(Rethet) >= 18.4*He - 21.74
            int = i;
            laminar = false;
        elseif m >= 0.09
            ils = i;
            laminar = false;
            He(i) = 1.51509; %set to exact value
        end
    end
    
    delta_e = He(i).*theta_t(i);
    while its == 0 && i<n
        i = i+1;
        thick0(1) = theta_t(i-1);
        thick0(2) = delta_e;
        ue0 = ue(i-1);
        [delx, thickhist] = ode45(@thickdash,[0,x(i)-x(i-1)],thick0);
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
    
    He(i:n) = He(i);
    for m =i:n-1
        theta_t(m+1) = theta_t(m)*(ue(m)/ue(m+1))^(2.803+2);
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
    
    if itr ~= 0
        disp(['Turbulent reattachment at ' num2str(x(itr))]);
    end
    if its ~= 0
        disp(['Turbulent separation at ' num2str(x(its))]);
    end
    

    % Combine into a full color list
    
    figure(1);
    plot(x,He);
    figure(2);
    plot(x,theta_t);
    legend_labels{j} = sprintf('Re = %.0e', Re);
end

line_color = [0.5 0.1 0.4];        % pure red
all_colors = [lines(3); line_color; line_color];  % 5 total

threshold_1 = ones(length(x))*1.46;
threshold_2 = ones(length(x))*1.58;


figure(1);
ax = gca;
ax.ColorOrder = all_colors;
ylabel('He')
xlabel('x/L')
plot(x,threshold_1)
plot(x,threshold_2)
legend(legend_labels, 'Location', 'northeast');

figure(2);
ax = gca;
ax.ColorOrder = all_colors;
ylabel('θ/L')
xlabel('x/L')
legend(legend_labels, 'Location', 'northeast');
