% RL - Task 1

% Load data file - task1.mat
load('task1.mat');

thresh = 0.5;
runs = 10;
goal_reached = zeros(4,2);
exec_times = zeros(4,2);
gammas = [0.5, 0.9];
for i=1:length(gammas)
    discount = gammas(i);
    for decay_type=[1 2 3 4] % epsilon and alpha decay are the same
        Qs = zeros(100, 4, runs);
        success_rates = zeros(runs, 1);
        optimal_policy = zeros(100, runs);
        totalReward = zeros(runs, 1);
        times = zeros(runs,1);
        parfor run = 1:runs % Run in parallel to save time
            [Qs(:,:,run), ~, times(run), success_rates(run)] = ...
                        QLearnTrials(reward, discount, decay_type, ...
                        decay_type, thresh, false);
            optimal_policy(:,run) = calculateOptimalPolicy(Qs(:,:,run));
            totalReward(run) = walkOptimalPolicy(optimal_policy(:,run), reward);
        end
        goalReachedRuns = find(totalReward > 0);
        goal_reached(decay_type,i) = length(goalReachedRuns);
        exec_times(decay_type,i) = mean(times(goalReachedRuns));
        % Plot the trajectory
        if ~isempty(goalReachedRuns)
            plot_grid(optimal_policy);
            title(['Optimal trajectory with gamma - ', num2str(discount) , ', total reward - ', ...
                        num2str(totalReward(1))])
        end
        disp(['DONE: ', num2str(discount), int2str(decay_type)]);
    end
end
result = [goal_reached, exec_times]
