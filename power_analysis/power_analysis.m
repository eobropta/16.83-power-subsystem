clear all
close all


%% Single orbit
dl = 195;
dc = 250;
sms = 117;

dt = 60; % sec

orbit_duration = 94.62; %min

dl_time = 10; %min
rotation_time = 1; %min
max_dc_time = 40; %min

mode_power = [dc sms dl sms];
mode_duration = [max_dc_time rotation_time dl_time  ...
    (orbit_duration - max_dc_time - rotation_time - dl_time)]*60;

stk_mat_file = '../stk_power_data/case_y45_z45_sept_315.mat';

x_solar = 0.8;
x_batt = 0.6;
min_charge = 0.3;

analyze_power(...
    stk_mat_file, mode_power, mode_duration, x_solar, x_batt, min_charge, dt);

%% Many orbits

stk_file_year = '../stk_power_data/case_y45_z45_300km_year.txt';
dt_year = 360;
plot_power_input(stk_file_year, dt_year);
