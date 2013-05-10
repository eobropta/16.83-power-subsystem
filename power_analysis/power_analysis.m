clear all
close all

%% Orbital constants
orbit_duration = 94.62; %min

dl = 195;
dc = 250;
sms = 83;

reaction_wheel_power = 22;
rot = sms + reaction_wheel_power;

x_solar = 0.8;
x_batt = 0.6;
min_charge = 0.3;

inherent_degredation = 0.9;
degredation_rate = 0.0375;
lifetime = 2;
lifetime_degredation = ...
    inherent_degredation * (1 - degredation_rate)^lifetime;

%% Minimum orbit calcs for orientations
dt = 360;

[y0_z0_energy_mean, y0_z0_energy_std] = analyze_orbital_energy(...
    '../stk_power_data/organized/case_y0_z0_2-25m_360s_year', ...
    '../stk_power_data/organized/case_y0_z0_2-25m_360s_year', ...
    orbit_duration * 60, dt, 0, 0)

[y0_z135_energy_mean, y0_z135_energy_std] = analyze_orbital_energy(...
    '../stk_power_data/organized/case_y0_z135_2-25m_360s_year', ...
    '../stk_power_data/organized/case_y0_z315_2-25m_360s_year', ...
    orbit_duration * 60, dt, 0, 45)

[y45_z0_energy_mean, y45_z0_energy_std] = analyze_orbital_energy(...
    '../stk_power_data/organized/case_y45_z0_2-25m_360s_year', ...
    '../stk_power_data/organized/case_y45_z180_2-25m_360s_year', ...
    orbit_duration * 60, dt, 45, 0)

[y45_z135_energy_mean, y45_z135_energy_std] = analyze_orbital_energy(...
    '../stk_power_data/organized/case_y45_z135_2-25m_360s_year', ...
    '../stk_power_data/organized/case_y45_z315_2-25m_360s_year', ...
    orbit_duration * 60, dt, 45, 45)

%% Nominal orbit collection
dt = 60;

dc_time = 22;
dl_time = 10;
rot_time = 372 / 60;
sms_time = orbit_duration / 2 - dc_time - dl_time - 2 * rot_time;

mode_power = repmat([sms rot dl rot dc], 1, 2);
mode_duration = repmat([sms_time rot_time dl_time rot_time dc_time]*60, 1, 2);

stk_mat_file = '../stk_power_data/organized/case_y45_z135_2-35m_60s_nov';

analyze_power(...
    stk_mat_file, mode_power, mode_duration, x_solar, x_batt, ...
    min_charge, lifetime_degredation, dt);

%% Single orbit
% dt = 60; % sec
% 
% sms_time_1 = 2.31;
% dl_time = 10; %min
% rot_time = 6; %min
% dc_time_1 = 44; %min
% dc_time_2 = 22;
% remaining_time = orbit_duration - (dc_time_1 + dc_time_2 + sms_time_1 + ...
%     dl_time + rot_time * 2);
% 
% % mode_power = [dc sms dl sms dc sms dl sms];
% % dc_time = (orbit_duration - 2*dl_time - 4*rotation_time) / 2;
% % mode_duration = [dc_time rotation_time dl_time rotation_time ...
% %     dc_time rotation_time dl_time rotation_time]*60;
% 
% worst_mode_power = [sms dc rot dl rot dc sms];
% worst_mode_duration = [sms_time_1 dc_time_1 rot_time dl_time ...
%     rot_time dc_time_2 remaining_time]*60;
% 
% num_orbits = 1;
% worst_mode_power = repmat(worst_mode_power, 1, num_orbits);
% worst_mode_duration = repmat(worst_mode_duration, 1, num_orbits);
% 
% worst_stk_mat_file = '../stk_power_data/case_y45_z45_sept_315_2-8';
% 
% analyze_power(...
%     worst_stk_mat_file, worst_mode_power, worst_mode_duration, x_solar, x_batt, ...
%     min_charge, lifetime_degredation, dt);
