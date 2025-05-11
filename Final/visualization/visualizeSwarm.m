function visualizeSwarm(swarm, ax, time)
    cla(ax); % Clear the axes
    for i = 1:length(swarm)
        pos = swarm(i).position;
        if strcmp(swarm(i).state, 'normal')
            scatter3(ax, pos(1), pos(2), pos(3), 'filled', 'b'); % Blue for normal drones
        elseif strcmp(swarm(i).state, 'underAttack')
            scatter3(ax, pos(1), pos(2), pos(3), 'filled', 'r'); % Red for attacked drones
        elseif strcmp(swarm(i).state, 'mitigated')
            scatter3(ax, pos(1), pos(2), pos(3), 'filled', 'g'); % Green for mitigated drones
        end
    end
    title(ax, sprintf('Drone Swarm Simulation (Time = %.1f s)', time));
    drawnow;
end