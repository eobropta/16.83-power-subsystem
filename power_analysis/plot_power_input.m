function plot_power_input( stk_filename, dt )
%plot_power_input 
%   dt - timestep in seconds

power_collected = extract_power_data(stk_filename, dt);
time = 0:dt:(length(power_collected)-1)*dt;

figure;
plot(time/(3600*24), power_collected, 'Color', [0 1 0]);
title('Power Collected', 'FontSize', 20)
xlabel('time [day]', 'FontSize', 16)
ylabel('power [W]', 'FontSize', 16)


end

