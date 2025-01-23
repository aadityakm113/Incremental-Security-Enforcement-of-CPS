function [correctedData, violations] = incremental_enforcement(data, boundaries, maxTimeout, maxVelocity)
    % INCREMENTAL_ENFORCEMENT: Enforce policies incrementally
    %
    % Inputs:
    %   - data: Original dataset (table)
    %   - boundaries: Struct defining the boundaries (x_min, x_max, etc.)
    %   - maxTimeout: Maximum timeout value before a drone is considered idle
    %   - maxVelocity: Maximum allowable velocity
    %
    % Outputs:
    %   - correctedData: Dataset after applying policies (table)
    %   - violations: Cell array logging violations for each drone

    % Initialize corrected dataset and violations log
    correctedData = data; % Start with the original data
    violations = {};      % Initialize an empty cell array for logging violations

    % Load policies and enforcers from the registry
    [policies, enforcers] = policy_registry(boundaries, maxTimeout, maxVelocity);

    for i = 1:height(data)
        % Extract the current drone state as a struct
        droneState = table2struct(data(i, :));

        % Apply policies incrementally
        for j = 1:length(policies)
            if ~policies{j}(droneState)
                % Log the violation
                violations{end+1} = sprintf('Policy %d violation for Drone %d at time %d', ...
                                            j, droneState.drone_id, droneState.time);
                % Enforce the policy
                droneState = enforcers{j}(droneState);
            end
        end

        % Convert the corrected state back to a table row
        correctedData(i, :) = struct2table(droneState, 'AsArray', true); % FIXED
    end
end
