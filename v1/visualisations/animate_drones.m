function animate_drones(data, titleText)
    figure;
    hold on;

    numDrones = length(unique(data.drone_id));
    scatterHandles = gobjects(numDrones, 1);
    for i = 1:numDrones
        scatterHandles(i) = scatter3(NaN, NaN, NaN, 100, 'filled');
    end

    xlim([min(data.x), max(data.x)]);
    ylim([min(data.y), max(data.y)]);
    zlim([min(data.z), max(data.z)]);
    xlabel('X'); ylabel('Y'); zlabel('Z');
    title(titleText);

    uniqueTimes = unique(data.time);
    for t = uniqueTimes'
        currentData = data(data.time == t, :);
        for i = 1:numDrones
            droneData = currentData(currentData.drone_id == i, :);
            scatterHandles(i).XData = droneData.x;
            scatterHandles(i).YData = droneData.y;
            scatterHandles(i).ZData = droneData.z;
        end
        pause(0.2);
    end
end
