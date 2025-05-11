function log_violations(violations, logFilePath)
    % LOG_VIOLATIONS: Logs policy violations into a specified text file.
    %
    % Inputs:
    %   - violations: Cell array of strings containing violation messages
    %   - logFilePath: Path to the log file (string)
    %
    % Outputs:
    %   - None (writes violations to a log file)
    
    % Open the file for appending
    fid = fopen(logFilePath, 'a');
    if fid == -1
        error('Error opening the log file: %s', logFilePath);
    end

    % Log each violation
    for i = 1:length(violations)
        fprintf(fid, '%s\n', violations{i});
    end

    % Close the file
    fclose(fid);
end
