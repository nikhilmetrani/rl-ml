% RL_main - perform Qlearning with the best parameters, on an unknown
% reweard function
% 'qevalreward' variable will already exist, loaded from qeval.mat

thresh = 1;
discount = 0.9;
alpha_type = 0;
epsilon_type = 2;
[Q, N, time, success_rate] = QLearnTrials(qevalreward, discount, ...
    alpha_type, epsilon_type, thresh, false);
qevalstates = calculateOptimalPolicy(Q);
totalReward = walkOptimalPolicy(qevalstates, qevalreward);
plot_grid(qevalstates);
title(['Optimal trajectory with gamma - 0.9, total reward - ', ...
            num2str(totalReward)])