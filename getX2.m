function x = getX2(S, a2, theta)
    counter = 1;
    while 1
        x = 1/counter;
        if S / (a2 * theta ^2 ) > (1 / x - 1) / x && ...
                S / (a2 * theta ^2 ) > (1 / x + 1) / x                                   
            break;
        end
        counter = counter + 1;
    end    
end