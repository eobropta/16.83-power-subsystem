function [ new_power_required ] = add_pathway_inefficiencies(...
    power_required, power_collected, x_solar, x_batt, n_iter)
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here

if nargin < 5
    n_iter = 10;
end

new_power_required = power_required;
for i=1:n_iter
    surplus_power = power_surplus(power_collected, new_power_required);
    new_power_required(surplus_power > 0) = ...
        power_required(surplus_power > 0) / x_solar;
    new_power_required(surplus_power < 0) = ...
        power_required(surplus_power < 0) / x_batt;
end

end
