function [ output_args ] = energy_chart( power, duration, orbit_period, eclipse_duration)
%energy_chart Generates an chart of energy usage
%energy is a 1D array of the mode power requirements. The last mode will
%finish the orbital time
%duration is a 1D array of the mode durations, for all but the last mode
%orbit_period is the time for the orbit to complete
%eclipse time is 

figure;
hold on;
title('Energy Usage', 'FontSize',14)
xlabel('time [min]', 'FontSize',12)
ylabel('power [W]','FontSize',12)

widths = zeros(size(power));
widths(1:length(power)-1) = duration;
widths(length(power)) = orbit_period - sum(duration);

x = zeros(length(widths)+1, 1);
for i=2:length(x)
    x(i) = x(i-1) + widths(i-1);
end

for i=1:length(x)-1
    fill([x(i) x(i) x(i+1) x(i+1)], ...
         [0 power(i) power(i) 0], 'b');
end

eclipse_time = orbit_period-eclipse_duration;
y_lim = get(gca, 'YLim');
line(eclipse_time*[1 1], y_lim, 'Color', 'r', 'LineStyle', '--')
text(eclipse_time+5, y_lim(2)-10, 'Eclipse', 'FontSize',12,'Color','r')
text(eclipse_time-10, y_lim(2)-10, 'Day', 'FontSize',12,'Color','k')

