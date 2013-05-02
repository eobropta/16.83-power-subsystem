function [ min_orbit, start_idx, file_num ] = minimum_orbit( ...
    power_mat_file_1, power_mat_file_2, orbital_period, dt )
%minimum_orbit Calculates the orbit which collects the least energy from the
%power vector in the power_mat_file

orbit_steps = floor(orbital_period / dt);
power_1 = load_power_data(power_mat_file_1, dt);
power_2 = load_power_data(power_mat_file_2, dt);

if length(power_1) ~= length(power_2)
    error('Power vectors must be the same lenght!');
end

num_orbits = length(power_1) - orbit_steps;
orbit_energy_1 = zeros(1, num_orbits);
orbit_energy_2 = zeros(1, num_orbits);
for i = 1:num_orbits
    orbit_energy_1(i) = sum(power_1(i:i+orbit_steps))*dt;    
    orbit_energy_2(i) = sum(power_2(i:i+orbit_steps))*dt;
end

orbit_energy = max(orbit_energy_1, orbit_energy_2);
[~, start_idx] = min(orbit_energy);
if orbit_energy_1(start_idx) == orbit_energy
    min_orbit = power_1(start_idx:start_idx+orbit_steps);
    file_num = 1;
else
    min_orbit = power_2(start_idx:start_idx+orbit_steps);
    file_num = 2;
end

