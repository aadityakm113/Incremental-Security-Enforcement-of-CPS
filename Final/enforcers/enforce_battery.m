function correctedState = enforce_battery(state)
    correctedState = state;
    if state.battery_level <= 10
        correctedState.input_command = 'hover';
        correctedState.velocity_x = 0;
        correctedState.velocity_y = 0;
        correctedState.velocity_z = 0;
    end
end
