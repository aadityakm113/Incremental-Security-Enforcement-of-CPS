function visualize_results(monolithicData, incrementalData)
    figure;

    subplot(1, 2, 1);
    scatter3(monolithicData.x, monolithicData.y, monolithicData.z, 10, monolithicData.drone_id, 'filled');
    title('Monolithic Enforcement');
    xlabel('X'); ylabel('Y'); zlabel('Z');
    grid on;

    subplot(1, 2, 2);
    scatter3(incrementalData.x, incrementalData.y, incrementalData.z, 10, incrementalData.drone_id, 'filled');
    title('Incremental Enforcement');
    xlabel('X'); ylabel('Y'); zlabel('Z');
    grid on;
end
