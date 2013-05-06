function plot_orbital_energy_collection( ...
    orbit_energy_collection, dt, pitch, yaw )
%plot_orbital_energy_collection Plots the energy collected over the couse
%of an orbit
%   orbit_energy_collection - energy collected during orbit started at each
%   timestep. In Joules
%   dt - timestep. In seconds

figure;
hold on;
title(strcat('Orbital Energy Collection: ', num2str(pitch), ...
    '^\circ pitch, ', num2str(yaw), '^\circ yaw'), 'FontSize', 20)
xlabel('time [day]', 'FontSize', 16)
ylabel('energy [W-hr]', 'FontSize', 16)
set(gca, 'FontSize', 14)

time = 0:dt:dt*length(orbit_energy_collection)-1;
energy = orbit_energy_collection / 3600;

plot(time/24/3600, energy)
end

