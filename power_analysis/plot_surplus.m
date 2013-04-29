function plot_surplus( surplus_power, dt )
%plot_surplus Plots the surplus power
%   power_collected - Power collection at each timestep
%   power_required - Power requirement at each timestep
%   dt - time interval of timestep (in sec)

figure;
hold on;
title('Power Surplus', 'FontSize', 16)
xlabel('time [min]', 'FontSize', 12)
ylabel('power [W]', 'FontSize', 12)

time = 0:dt:dt*length(surplus_power)-1;
area(time/60, surplus_power);
end

