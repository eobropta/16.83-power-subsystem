function [ surplus_power ] = power_surplus(power_collected, power_required)
%power_difference Calculates the difference between power collected and
%power_requried
%   power_collected - power being collected at each timestep
%   power_required - power required at each timestep
%   dt - time interval of the timestep
%   power_surplus - power difference at each timestep
%   total_surplus_energy - the energy surplus

n_steps = min(length(power_collected), length(power_required));

surplus_power = power_collected(1:n_steps) - power_required(1:n_steps);

end

