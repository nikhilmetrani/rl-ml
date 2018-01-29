function totalReward = walkOptimalPolicy( optimal_policy, reward )
%walkOptimalPolicy follow the optimal policy to try
%to see what the total return is.

    state = 1;
    n = 0;
    totalReward = 0;
    while( state ~= 100 && n < 100)
        action = optimal_policy(state);
        totalReward = totalReward + reward(state, action);
        state = transition(state, action);
        n = n + 1;
    end
    if state ~= 100 % never reached the goal
        totalReward = -1;
    end
end

