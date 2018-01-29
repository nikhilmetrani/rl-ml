function optimal_policy = calculateOptimalPolicy(Q)
% Calculates the optimum policy for the given value of Q
    [~, optimal_policy] = max(Q, [], 2);
end
