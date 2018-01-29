function [] = plot_grid(optimal_policy)
% Plot the navigation grid
    figure
    grid on
    axis([0 10 0 10])
    set(gca,'xticklabel',[], 'yticklabel',[]) 

    state = 1;
    n = 0;
    while( state ~= 100 && n < 100)
        [y,x] = ind2sub([10,10],state);
        if optimal_policy(state) == 1
            text(x - 0.5, 10 - y + 0.5, '^')
            state = state - 1;
        elseif optimal_policy(state) == 2
            text(x - 0.5, 10 - y + 0.5, '>')
            state = state + 10;
        elseif optimal_policy(state) == 3
            text(x - 0.5, 10 - y + 0.5, 'v')
            state = state + 1;
        else
            text(x - 0.5, 10 - y + 0.5, '<')
            state = state - 10;
        end

        n = n + 1;

    end

    text(0.35,9.25, '*', 'color', 'g', 'FontSize', 30);
    text(9.35,0.25, '*','color', 'r', 'FontSize', 30);

end