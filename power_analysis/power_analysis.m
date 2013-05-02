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
max_dc_time = 10; %min

% mode_power = [dc sms dl sms dc];
% mode_duration = [max_dc_time rotation_time dl_time rotation_time ...
%     (orbit_duration - max_dc_time - 2*rotation_time - dl_time)]*60;

% dc_time1 = 35.31;
% dc_time2 = 0;
% sms_time2 = orbit_duration - (2*dl_time + 3*rotation_time + dc_time1 + dc_time2);
% 
% mode_power = [dl sms dc sms dl sms dc sms];
% mode_duration = [dl_time rotation_time dc_time1 rotation_time ...
%     dl_time rotation_time dc_time2 sms_time2]*60;

dc_time = 44;
sms_time = orbit_duration - (dl_time + rotation_time + dc_time);

mode_power = [dl sms dc sms];
mode_duration = [dl_time rotation_time dc_time sms_time]*60;


stk_mat_file = '../stk_power_data/case_y45_z45_low_june';


x_solar = 0.8;
x_batt = 0.6;
min_charge = 0.3;

analyze_power(...
    stk_mat_file, mode_power, mode_duration, x_solar, x_batt, min_charge, dt);

%% Many orbits

stk_file_year = '../stk_power_data/case_y45_z45_300km_year.txt';
dt_year = 360;
plot_power_input(stk_file_year, dt_year);
