clear all 
close all

load('../stk_power_data/case_y45_z45_year_315');

time = 0:360:(length(power)-1)*360;
time = time/24/3600; % days

power = power(1:end/2)
time = time(1:end/2)
plot(time,power,'-g')
xlabel('time [days]','FontSize',24)
ylabel('power [W]','FontSize',24)
title('Power Collection','FontSize',36)

h = get(gca)
set(gca,'FontSize',14)
