function analyze_power( ...
    stk_mat_file, mode_power, mode_duration, x_solar, x_batt, ...
    min_charge, lifetime_degredation, dt)
%analyze_power Looks at the power collected by the satellite and the power
%required and makes sure that the system is feasible

power_collected = load_power_data(stk_mat_file) * lifetime_degredation;
power_required = gen_baseline_power_requirements(mode_power, mode_duration, dt);
power_required = add_pathway_inefficiencies(power_required, power_collected, x_solar, x_batt);

% view the power
plot_power(power_collected, power_required, dt);

surplus_power = power_surplus(power_collected, power_required);

total_surplus_energy = sum(surplus_power * dt)

plot_surplus(surplus_power, dt);

max_energy_req = max_energy_requirement(surplus_power, dt);

battery_energy = max_energy_req / (1-min_charge)

end

