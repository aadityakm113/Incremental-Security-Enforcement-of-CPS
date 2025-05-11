function isValid = policy_battery(state)
    isValid = state.battery_level > 10; % Critical battery level
end
