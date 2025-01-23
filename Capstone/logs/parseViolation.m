function [droneId, policyId] = parseViolation(violation)
    % PARSEVIOLATION: Extracts droneId and policyId from a violation string
    %
    % Inputs:
    %   - violation: A string in the format
    %     'Policy <policyId> violation for Drone <droneId> at time <time>'
    % Outputs:
    %   - droneId: The ID of the drone that violated the policy (integer)
    %   - policyId: The ID of the violated policy (integer)

    % Use regular expressions to extract numbers
    policyPattern = 'Policy (\d+)';
    dronePattern = 'Drone (\d+)';

    policyId = str2double(regexp(violation, policyPattern, 'tokens', 'once'));
    droneId = str2double(regexp(violation, dronePattern, 'tokens', 'once'));
end
