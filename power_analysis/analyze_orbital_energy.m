function [ energy_mean, energy_std ] = analyze_orbital_energy( ...
    stk_file_1, stk_file_2, orbit_duration, dt, pitch, yaw)
%analyze_orbital_energy Analyzes the energy collected per orbit over a 
%year long 
[ ~, ~, ~, orbit_energy ] = minimum_orbit( ...
    stk_file_1, stk_file_2, orbit_duration, dt );

energy_mean = nanmean(orbit_energy/3600);
energy_std = nanstd(orbit_energy/3600);
plot_orbital_energy_collection(orbit_energy, dt, pitch, yaw);

end

