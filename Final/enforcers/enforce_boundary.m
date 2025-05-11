function correctedState = enforce_boundary(state, boundaries)
    correctedState = state;
    correctedState.x = min(max(state.x, boundaries.x_min), boundaries.x_max);
    correctedState.y = min(max(state.y, boundaries.y_min), boundaries.y_max);
    correctedState.z = min(max(state.z, boundaries.z_min), boundaries.z_max);
end
