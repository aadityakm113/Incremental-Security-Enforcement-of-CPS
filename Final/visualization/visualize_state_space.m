function visualize_state_space()
    numPolicies = 1:10;
    monolithicStates = 2.^numPolicies; % Exponential growth
    incrementalStates = numPolicies;  % Linear growth

    figure;
    plot(numPolicies, monolithicStates, '-o', 'DisplayName', 'Monolithic');
    hold on;
    plot(numPolicies, incrementalStates, '-o', 'DisplayName', 'Incremental');
    xlabel('Number of Policies');
    ylabel('Number of States');
    title('State Space Explosion: Monolithic vs Incremental');
    legend;
    grid on;
end

