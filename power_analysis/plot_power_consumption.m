clear all 
close all

load('../stk_power_data/organized/case_y45_z135_2-3m_60s_nov');


time = 0:60:(length(power)-1)*60;
time = time/24/3600; % days

power = power(1:end/2)
time = time(1:end/2)
plot(time,power,'-g')
xlabel('time [days]','FontSize',24)
ylabel('power [W]','FontSize',24)
title('Power Collection','FontSize',36)
set(gca,'FontSize',14)
