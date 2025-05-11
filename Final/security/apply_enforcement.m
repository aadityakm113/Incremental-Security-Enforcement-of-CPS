function apply_enforcement()
    global uavList;

    for i = 1:length(uavList)
        drone = uavList(i).uav;
        [position, orientation, isValid] = uavList(i).trajectory();

        if ~isValid
            continue;
        end

        state = struct('x', position(1), 'y', position(2), 'z', position(3), 'drone_id', i);

        if detect_gps_spoofing(state)
            enforce_gps_recovery(state);
        elseif detect_command_injection(state)
            enforce_command_safety(state);
        elseif detect_battery_attack(state)
            enforce_battery_conservation(state);
        end
    end
end
