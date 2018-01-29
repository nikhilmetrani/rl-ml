function [Q, N, time, success_rate] = QLearnTrials(reward, discount, a_decay_type, e_decay_type, convergence_thresh, plotting)
tic % start timing
Q = zeros(100,4);
N = zeros(100,4);
diffQ = ones(3000,1);
num_goal_reached = 0;
for trial=1:3000
    [Qnew, N, goal_reached] = QLearnTrial(reward, Q, N, discount, a_decay_type, e_decay_type);
    num_goal_reached = num_goal_reached + goal_reached;
    diffQ(trial) = mean((Qnew(:) - Q(:)) .^ 2);
    if trial > 1
        diffQ(trial) = 0.05*diffQ(trial) + 0.95*diffQ(trial-1);
        if diffQ(trial) < convergence_thresh
            break
        end
        if plotting && mod(trial, 5) == 0
            plot(diffQ(1:trial)); ylabel('||Qnew - Q||'); xlabel('Trials');
            pause(0.1);
        end
    end
    Q = Qnew;
end
success_rate = num_goal_reached / trial;
time = toc;
end
