function isValid = policy_timeout(state, maxTimeout)
    % POLICY_TIMEOUT: Checks if the drone has exceeded the maximum allowable timeout.
    %
    % Inputs:
    %   - state: Struct representing the drone's state (must include 'timeout')
    %   - maxTimeout: Maximum allowable timeout (scalar)
    %
    % Outputs:
    %   - isValid: Boolean indicating whether the timeout is within acceptable limits.
    
    isValid = state.timeout <= maxTimeout;
end
