function correctedState = enforce_timeout(state)
    % ENFORCE_TIMEOUT: Enforces the timeout policy by resetting the drone's state to a safe mode.
    %
    % Inputs:
    %   - state: Struct representing the drone's state
    %
    % Outputs:
    %   - correctedState: Struct with enforced corrections (e.g., 'hover' command, stop motion)
    
    correctedState = state;
    if state.timeout > 0
        correctedState.input_command = 'hover'; % Force the drone to hover
        correctedState.velocity_x = 0; % Stop motion
        correctedState.velocity_y = 0;
        correctedState.velocity_z = 0;
    end
end
