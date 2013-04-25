dl = 188.97;
dc = 228.97;

dt = 60; % sec

orbit_duration = 93.59; %min

dl_time = 10; %min
dc_time = (orbit_duration - 2*dl_time) / 2;
num_orbits = 1;

mode_duration = repmat([dl_time dc_time], 1, num_orbits*4) * 60;
mode_power = repmat([dl dc], 1, num_orbits * 4);

stk_file = '../stk_power_data/case_y45_z45_year.txt';

x_solar = 0.8;
x_batt = 0.6;
min_charge = 0.3;

analyze_power(...
    stk_file, mode_power, mode_duration, x_solar, x_batt, min_charge, dt);