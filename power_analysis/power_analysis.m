clear all
close all


%% Single orbit
dl = 195;
dc = 250;
sms = 83;

reaction_wheel_power = 22;
rot = sms + reaction_wheel_power;

dt = 60; % sec

orbit_duration = 94.62; %min

dl_time = 10; %min
rotation_time = 1; %min
dc_time = 35; %min
dc_time_2 = 0;

% mode_power = [dc sms dl sms dc sms dl sms];
% dc_time = (orbit_duration - 2*dl_time - 4*rotation_time) / 2;
% mode_duration = [dc_time rotation_time dl_time rotation_time ...
%     dc_time rotation_time dl_time rotation_time]*60;
mode_power = [dc rot dl rot dc sms];
mode_duration = [dc_time rotation_time dl_time rotation_time dc_time_2 ...
    (orbit_duration - dc_time - rotation_time - dl_time - dc_time_2)]*60;

num_orbits = 1;
mode_power = repmat(mode_power, 1, num_orbits);
mode_duration = repmat(mode_duration, 1, num_orbits);

stk_mat_file = '../stk_power_data/case_y45_z45_sept_315';

x_solar = 0.8;
x_batt = 0.6;
min_charge = 0.3;

inherent_degredation = 0.9;
degredation_rate = 0.0375;
lifetime = 2;
lifetime_degredation = ...
    inherent_degredation * (1 - degredation_rate)^lifetime;

analyze_power(...
    stk_mat_file, mode_power, mode_duration, x_solar, x_batt, ...
    min_charge, lifetime_degredation, dt);
