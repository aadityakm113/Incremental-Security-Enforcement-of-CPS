function [policies, enforcers] = policy_registry(boundaries, maxTimeout, maxVelocity)
    % POLICY_REGISTRY: Registers policies and their enforcers
    %
    % Inputs:
    %   - boundaries: Struct defining the boundaries (x_min, x_max, etc.)
    %   - maxTimeout: Maximum timeout value before a drone is considered idle
    %   - maxVelocity: Maximum allowable velocity
    %
    % Outputs:
    %   - policies: Cell array of policy validation functions
    %   - enforcers: Cell array of corresponding enforcement functions
    
    % Initialize policies and enforcers
    policies = {};
    enforcers = {};
    
    % 1. Boundary Policy
    policies{end + 1} = @(state) policy_boundary(state, boundaries);
    enforcers{end + 1} = @(state) enforce_boundary(state, boundaries);
    
    % 2. Command Conflict Policy
    policies{end + 1} = @(state) policy_command_conflict(state);
    enforcers{end + 1} = @(state) enforce_command_conflict(state);
    
    % 3. Battery Conservation Policy
    policies{end + 1} = @(state) policy_battery(state);
    enforcers{end + 1} = @(state) enforce_battery(state);
    
    % 4. Timeout Policy
    policies{end + 1} = @(state) policy_timeout(state, maxTimeout);
    enforcers{end + 1} = @(state) enforce_timeout(state);
    
    % 5. Velocity Policy
    policies{end + 1} = @(state) policy_velocity(state, maxVelocity);
    enforcers{end + 1} = @(state) enforce_velocity(state, maxVelocity);
end
