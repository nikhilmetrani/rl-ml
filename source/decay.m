function mult = decay(k, type)
%DECAY
% Gets the value of alpha / epsilon based on the number of transitions
% k: Transitions
% type: function type - in the range of 0 to 4
    if type == 0
        mult = 1;
    elseif type == 1
        mult = 1 / k;
    elseif type == 2
        mult = 100 / (100 + k);
    elseif type == 3
        mult = (1 + log(k)) / k;
    elseif type == 4
        mult = (1 + 5*log(k)) / k;
    end
    if mult > 1
        mult = 1;
    end
end
