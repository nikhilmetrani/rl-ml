function alphak = epsilonGreedy(Q, moveValidity, s_k, epsilon)
% Determines the likelyhood of exploring non-exploitative
% actions
    validity_for_actions = moveValidity(s_k,:);
    worth_for_actions = Q(s_k,:);
    valid_actions = find(validity_for_actions >= 0);
    max_worth = max(worth_for_actions(valid_actions));
    alphak_exploit = valid_actions(worth_for_actions(valid_actions) == max_worth);
    if length(alphak_exploit) > 1
        alphak_exploit = randsample(alphak_exploit, 1); % choose a random exploit option
    end

    if rand() < epsilon % exploration
        while true
            alphak = randsample(valid_actions, 1);
            if alphak ~= alphak_exploit
                break
            end
        end
    else % exploitation
        alphak = alphak_exploit;
    end
end