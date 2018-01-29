function [Q, N, reached_goal] = QLearnTrial(reward, Q, N, discount, a_decay_type, e_decay_type)
iterations = 300; % some big number, almost like a while loop
s = ones(iterations,1);
a = ones(iterations,1);
reached_goal = false;

for k=1:iterations
    alpha = decay(k, a_decay_type);
    epsilon = decay(k, e_decay_type);
    a(k) = epsilonGreedy(Q, reward, s(k), epsilon); % reward matrix is serving as moveValidity
    s(k+1) = transition(s(k), a(k));
    N(s(k),a(k)) = N(s(k),a(k)) + 1;
    Q(s(k),a(k)) = Q(s(k),a(k)) + alpha*(reward(s(k),a(k)) + discount*max(Q(s(k+1),:)) - Q(s(k),a(k)));
    if s(k+1) == 100
        reached_goal = true;
        break
    elseif alpha < 0.005
        break
    end
end
end