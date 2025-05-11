function isValid = policy_velocity(state, maxVelocity)
    % POLICY_VELOCITY: Checks if the drone's velocity exceeds the maximum allowable velocity.
    %
    % Inputs:
    %   - state: Struct representing the drone's state (must include velocity_x, velocity_y, velocity_z)
    %   - maxVelocity: Maximum allowable velocity (scalar)
    %
    % Outputs:
    %   - isValid: Boolean indicating whether the drone's velocity is within acceptable limits.
    
    % Calculate the drone's velocity magnitude
    velocity = sqrt(state.velocity_x^2 + state.velocity_y^2 + state.velocity_z^2);
    
    % Check if the velocity is within limits
    isValid = velocity <= maxVelocity;
end
