function [ power_required ] = gen_baseline_power_requirements(...
    mode_power, mode_duration, dt)
%gen_power_required Generated power required at specified interval
%   mode_power - list of power requirements for different modes
%   mode_duration - list of durations for each of those modes
%   dt - time interval between each power_required point

if length(mode_power) ~= length(mode_duration)
    error(strcat('Each entry in mode_power must be associated with an ',...
                 'entry in mode_duration, i.e., mode_power and ',...
                 'mode_duration must be the same length.'))
end

mode_duration = round(mode_duration./dt);
power_required = zeros(1, sum(mode_duration));
step=1;
for i = 1:length(mode_duration)
    new_step = step + mode_duration(i);
    power_required(step:new_step-1) = ...
        mode_power(i) * ones(1, mode_duration(i));
    step = new_step;
end

