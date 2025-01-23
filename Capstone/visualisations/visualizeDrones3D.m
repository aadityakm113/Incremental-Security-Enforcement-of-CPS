function visualizeDrones3D(data)
    % VISUALIZEDRONES3D: Animates drone movements in a 3D space.
    %
    % Inputs:
    %   - data: A table containing drone states with columns:
    %           time, drone_id, x, y, z
    %
    % Example Usage:
    %   visualizeDrones3D(droneData);

    % Ensure the data contains the necessary fields
    requiredFields = {'time', 'drone_id', 'x', 'y', 'z'};
    for field = requiredFields
        if ~ismember(field, data.Properties.VariableNames)
            error('Input data must contain the field: %s', field{1});
        end
    end

    % Get unique drone IDs and time steps
    droneIDs = unique(data.drone_id);
    numDrones = length(droneIDs);
    uniqueTimes = unique(data.time);

    % Initialize the 3D plot
    figure;
    hold on;
    grid on;
    xlim([min(data.x), max(data.x)]);
    ylim([min(data.y), max(data.y)]);
    zlim([min(data.z), max(data.z)]);
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
    title('Drone Movements in 3D Space');

    % Create scatter objects for each drone
    droneMarkers = gobjects(numDrones, 1);
    for i = 1:numDrones
        droneMarkers(i) = scatter3(NaN, NaN, NaN, 100, 'filled', 'DisplayName', ...
                                   sprintf('Drone %d', droneIDs(i)));
    end

    legend;

    % Animate drones over time
    for t = uniqueTimes'
        % Get data for the current time step
        currentData = data(data.time == t, :);

        for i = 1:numDrones
            % Get the position of the current drone
            droneData = currentData(currentData.drone_id == droneIDs(i), :);

            if ~isempty(droneData)
                droneMarkers(i).XData = droneData.x;
                droneMarkers(i).YData = droneData.y;
                droneMarkers(i).ZData = droneData.z;
            end
        end

        % Pause for animation
        pause(0.1);
    end

    hold off;
end
