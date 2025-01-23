% main.m

% Load dataset
data = readtable('Capstone/data/synthetic_drone_data.csv');

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
