function animateDrones(data)
    if isempty(data)
        error('Input dataset is empty. Ensure that the dataset contains valid drone data.');
    end

    figure;
    hold on;
    numDrones = length(unique(data.drone_id));
    scatterHandles = gobjects(numDrones, 1);

    % Initialize scatter points for each drone
    for i = 1:numDrones
        scatterHandles(i) = scatter3(NaN, NaN, NaN, 100, 'filled');
    end

    % Set up axes limits
    xlim([min(data.x), max(data.x)]);
    ylim([min(data.y), max(data.y)]);
    zlim([min(data.z), max(data.z)]);
    xlabel('X'); ylabel('Y'); zlabel('Z');
    title('Drone Movement Animation');

    % Animate over time
    uniqueTimes = unique(data.time);
    for t = uniqueTimes'
        currentData = data(data.time == t, :);
        for i = 1:numDrones
            droneData = currentData(currentData.drone_id == i, :);
            if ~isempty(droneData)
                scatterHandles(i).XData = droneData.x;
                scatterHandles(i).YData = droneData.y;
                scatterHandles(i).ZData = droneData.z;
            end
        end
        pause(0.1);
    end
end
