function [correctedData, violations] = monolithic_enforcement(data, boundaries, maxTimeout, maxVelocity)
    % MONOLITHIC_ENFORCEMENT: Enforce all policies in a monolithic manner
    
    % Initialize corrected dataset and violations log
    correctedData = data;
    violations = {};

    for i = 1:height(data)
        % Extract the current drone state as a struct
        droneState = table2struct(data(i, :));

        % Initialize a flag to track violations
        hasViolation = false;

        % Enforce Boundary Policy
        if droneState.x < boundaries.x_min || droneState.x > boundaries.x_max || ...
           droneState.y < boundaries.y_min || droneState.y > boundaries.y_max || ...
           droneState.z < boundaries.z_min || droneState.z > boundaries.z_max
            violations{end+1} = sprintf('Boundary violation for Drone %d at time %d', droneState.drone_id, droneState.time);
            droneState.x = min(max(droneState.x, boundaries.x_min), boundaries.x_max);
            droneState.y = min(max(droneState.y, boundaries.y_min), boundaries.y_max);
            droneState.z = min(max(droneState.z, boundaries.z_min), boundaries.z_max);
            hasViolation = true;
        end

        % Enforce Timeout Policy
        if droneState.timeout > maxTimeout
            violations{end+1} = sprintf('Timeout violation for Drone %d at time %d', droneState.drone_id, droneState.time);
            droneState.input_command = 'hover';
            hasViolation = true;
        end

        % Enforce Velocity Policy
        velocity = sqrt(droneState.velocity_x^2 + droneState.velocity_y^2 + droneState.velocity_z^2);
        if velocity > maxVelocity
            violations{end+1} = sprintf('Velocity violation for Drone %d at time %d', droneState.drone_id, droneState.time);
            scale = maxVelocity / velocity;
            droneState.velocity_x = droneState.velocity_x * scale;
            droneState.velocity_y = droneState.velocity_y * scale;
            droneState.velocity_z = droneState.velocity_z * scale;
            hasViolation = true;
        end

        % Enforce Battery Conservation Policy
        if droneState.battery_level <= 10
            violations{end+1} = sprintf('Battery violation for Drone %d at time %d', droneState.drone_id, droneState.time);
            droneState.input_command = 'hover';
            droneState.velocity_x = 0;
            droneState.velocity_y = 0;
            droneState.velocity_z = 0;
            hasViolation = true;
        end

        % Log the corrected state back into the correctedData table
        correctedData(i, :) = struct2table(droneState, 'AsArray', true); % FIX: Use 'AsArray' for struct-to-table conversion
    end
end
