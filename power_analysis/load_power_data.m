function [ power ] = load_power_data( power_mat_file, dt)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

data = load(power_mat_file);
power = data.power;
% deal with matlab double counting everything
power = power(1:end/2);

power = power';
end

