function [ power_collected, time ] = extract_power_data( filename, dt )
%extract_power_data Extracts the power collected  from a STK solar panel
%analysis
%   filename - name of the flie
%   dt - time interval between data points

out = importdata(filename, ' ', 11);
power_collected = out.data(:,1)';
time = 0:dt:dt*length(power_collected)-1;

end

