function correctedState = enforce_velocity(state, maxVelocity)
    % ENFORCE_VELOCITY: Enforces the velocity policy by scaling down the drone's velocity.
    %
    % Inputs:
    %   - state: Struct representing the drone's state (must include velocity_x, velocity_y, velocity_z)
    %   - maxVelocity: Maximum allowable velocity (scalar)
    %
    % Outputs:
    %   - correctedState: Struct with enforced corrections (velocity scaled down if necessary)
    
    % Copy the original state
    correctedState = state;

    % Calculate the current velocity magnitude
    velocity = sqrt(state.velocity_x^2 + state.velocity_y^2 + state.velocity_z^2);

    % If velocity exceeds the limit, scale it down
    if velocity > maxVelocity
        scale = maxVelocity / velocity; % Scaling factor to reduce velocity
        correctedState.velocity_x = state.velocity_x * scale;
        correctedState.velocity_y = state.velocity_y * scale;
        correctedState.velocity_z = state.velocity_z * scale;
    end
end
