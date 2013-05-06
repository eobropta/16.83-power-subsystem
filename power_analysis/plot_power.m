function plot_power( power_collected, power_required, dt )
%plot_power Plots the power input and usage of the system
%   power_collected - Power collection at each timestep
%   power_required - Power requirement at each timestep
%   dt - time interval of timestep (in sec)

figure;
hold on;
title('Energy Collection and Usage', 'FontSize', 20)
xlabel('time [min]', 'FontSize', 16)
ylabel('power [W]', 'FontSize', 16)
set(gca, 'FontSize', 14)

n_steps = min(length(power_collected), length(power_required));
time = 0:dt:dt*n_steps-1;
h1 = area(time/60, power_collected(1:n_steps), 'FaceColor', [0 1 0]);
h2 = area(time/60, power_required(1:n_steps), 'FaceColor', [1 0 0]);

alpha_val = 0.5;
alpha(allchild(h1), alpha_val);
alpha(allchild(h2), alpha_val);

legend('Energy collected', 'Energy used')

end

