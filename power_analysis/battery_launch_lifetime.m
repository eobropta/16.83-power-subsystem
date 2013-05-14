clear all
close all

batt_energy_0 = 540*3600; %J initial battery energy

av_power = 20; %W minimum Avionics power
comm_power = 11.5; %W minimum Comm power with only RX

power = av_power + comm_power; %total power

dt = 1;
batt_energy = batt_energy_0;

i = 0;
time_seconds = 0;
while batt_energy > 0
    
    %energy usage during dt
    energy_usage = power*dt;
    
    %new battery energy =  old battery energy - energy usage - degredation per dt
    
    batt_energy = batt_energy - energy_usage - batt_energy*(.3/100)/(24*60*60);
    
    time_seconds = time_seconds+dt;
    
    
end

time = time_seconds/3600

%% Calculate Power consumption with folds

sa_area = 2.35; %m^2

sa_area_folded = (2.35 / 2 / .5 / 3) * .5 * 2; %total exposed area if 3 folds

power_output_density = 383; % from SMAD pg. 644 Table 21-12 for multi-junction solar cells, power output in W/m^2
inherent_degredation = 0.72; %SMAD pg. 645 Table 21-14

power_density_bol = power_output_density * inherent_degredation;

power_gen = sa_area_folded * power_density_bol * cos(70*(pi/180))
