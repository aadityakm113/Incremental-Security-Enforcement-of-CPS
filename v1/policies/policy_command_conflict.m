function isValid = policy_command_conflict(state)
    validCommands = {'hover', 'ascend', 'descend', 'move_forward', 'move_backward'};
    isValid = ismember(state.input_command, validCommands);
end
