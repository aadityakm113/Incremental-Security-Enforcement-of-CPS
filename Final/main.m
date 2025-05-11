% Main Script for Drone Swarm Simulation
clear; clc; close all;

% Load dataset
data = loadDataset('Project/data/synthetic_drone_data.csv');

% Define parameters for policies
boundaries = struct('x_min', min(data.x_min), 'x_max', max(data.x_max), ...
                    'y_min', min(data.y_min), 'y_max', max(data.y_max), ...
                    'z_min', min(data.z_min), 'z_max', max(data.z_max));
maxTimeout = 5;      % Maximum allowable timeout
maxVelocity = 5;     % Maximum allowable velocity

% Run monolithic enforcement
[monolithicData, monolithicViolations] = monolithic_enforcement(data, boundaries, maxTimeout, maxVelocity);

% Run incremental enforcement
[incrementalData, incrementalViolations] = incremental_enforcement(data, boundaries, maxTimeout, maxVelocity);

% Log violations
log_violations(monolithicViolations, 'logs/monolithic_violations.txt');
log_violations(incrementalViolations, 'logs/incremental_violations.txt');

% Visualize and compare results
visualize_results(monolithicData, incrementalData);

% Animate drones for both approaches
animate_drones(monolithicData, 'Monolithic Enforcement');
animate_drones(incrementalData, 'Incremental Enforcement');

% Visualize state space explosion
visualize_state_space();

% Initialize the drone swarm
swarm = initializeSwarm(data);

% Simulation parameters
simTime = max(data.time); % Total simulation time
timeStep = 0.5; % Time step for simulation
pauseDuration = 0.05;
attackStartTime = 20; % Time when the attack starts

% Initialize visualization
figure;
ax = uiaxes;
hold(ax, 'on');
axis(ax, 'equal');
grid(ax, 'on');
view(ax, 3);
xlabel(ax, 'X (m)');
ylabel(ax, 'Y (m)');
zlabel(ax, 'Z (m)');
title(ax, 'Drone Swarm Simulation with Incremental Security Enforcement');

% Initialize attack and security framework
attack = initializeAttack(swarm);
securityFramework = initializeSecurityFramework(swarm);

% Simulation loop
for t = 0:timeStep:simTime
    % Update drone positions and states
    swarm = updateSwarm(swarm, data, t);
    
    % Simulate attack (if attack has started)
    if t >= attackStartTime
        swarm = simulateAttack(swarm, attack, t);
    end
    
    % Run incremental security enforcement
    swarm = securityFramework.detectAndMitigate(swarm);
    
    % Visualize the swarm
    visualizeSwarm(swarm, ax, t);
    
    % Pause for real-time visualization
    pause(0.01);
end