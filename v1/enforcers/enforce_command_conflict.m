function correctedState = enforce_command_conflict(state)
    correctedState = state;
    if ~policy_command_conflict(state)
        correctedState.input_command = 'hover'; % Default to hover
    end
end
