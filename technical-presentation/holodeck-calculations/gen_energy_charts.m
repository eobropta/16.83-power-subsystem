dl = 179;
sms = 89;
dc = 219;

orbit_period = 93.59;
eclipse = 35.92;

duration_1 = [30 10 13];
power_1 = [dc dl dc sms];

duration_2 = [17 10 (orbit_period - eclipse - 17 - 10) 30];
power_2 = [dc dl sms dc sms];


energy_chart(power_1, duration_1, orbit_period, eclipse)
energy_chart(power_2, duration_2, orbit_period, eclipse)