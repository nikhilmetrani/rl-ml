function s_k1 = transition(s_k, a_k, shp)
% Transition from one state s_k to another s_k1, based on action a_k
% Assumed - actions 1, 2, 3, 4 correspond to up, right, down, left.

    if nargin < 3 % default to 100 states, 10x10 grid
        shp = [10 10];
    end
    action_movements = [
        -1, 0; % up
        0, 1; % right
        1, 0; % down
        0,-1;]; % left
    [s_k_i, s_k_j] = ind2sub(shp,s_k); % current state i,j
    s_k1_sub = [s_k_i, s_k_j] + action_movements(a_k,:); % next state i,j
    s_k1 = sub2ind(shp, s_k1_sub(1), s_k1_sub(2)); % next state
end