function swarm = updateSwarm(swarm, data, time)
    % Update drone positions and states based on the dataset
    for i = 1:length(swarm)
        droneID = swarm(i).id;
        droneData = data(data.drone_id == droneID & data.time == time, :);
        
        if ~isempty(droneData)
            swarm(i).position = [droneData.x, droneData.y, droneData.z];
            swarm(i).velocity = [droneData.velocity_x, droneData.velocity_y, droneData.velocity_z];
            swarm(i).battery = droneData.battery_level;
            swarm(i).rpm = droneData.rpm;
        end
    end
end