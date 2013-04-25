function [ max_energy_req ] = max_energy_requirement( surplus_power, dt )
%max_energy_requirement Finds the largest energy requirement from the
%power surplus, whether that be amount of power that needs to be taken in
%from the solar panels at one time or the power that needs to be put into
%the batteries
%   Detailed explanation goes here

zero_indices = zero_crossings(surplus_power);

energy_reqs = zeros(size(zero_indices));
energy_reqs(1) = abs(sum(surplus_power(1:zero_indices(1))*dt));
for i=2:length(zero_indices)
    energy_reqs(i) = ...
        abs(sum(surplus_power(zero_indices(i-1):zero_indices(i))*dt));
end

max_energy_req = max(energy_reqs);
end

