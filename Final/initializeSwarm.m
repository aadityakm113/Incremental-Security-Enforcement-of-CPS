function swarm = initializeSwarm(data)
    % Initialize the swarm structure
    swarm = struct();
    
    % Extract unique drone IDs
    droneIDs = unique(data.drone_id);
    
    % Initialize each drone
    for i = 1:length(droneIDs)
        droneID = droneIDs(i);
        droneData = data(data.drone_id == droneID, :);
        
        swarm(i).id = droneID;
        swarm(i).position = [droneData.x(1), droneData.y(1), droneData.z(1)];
        swarm(i).velocity = [droneData.velocity_x(1), droneData.velocity_y(1), droneData.velocity_z(1)];
        swarm(i).target = [droneData.target_x(1), droneData.target_y(1), droneData.target_z(1)];
        swarm(i).battery = droneData.battery_level(1);
        swarm(i).rpm = droneData.rpm(1);
        swarm(i).bounds = [droneData.x_min(1), droneData.x_max(1), ...
                           droneData.y_min(1), droneData.y_max(1), ...
                           droneData.z_min(1), droneData.z_max(1)];
        swarm(i).timeout = droneData.timeout(1);
        swarm(i).state = 'normal'; % Initial state
    end
end