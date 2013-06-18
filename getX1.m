function x = getX1(S, a2, gamma)
    counter = 1;
    while 1
        x = 1/counter;
        if S / (a2 * gamma ^2 ) > (1 / x - 1) / x && ...
                S / (a2 * gamma ^2 ) > (1 / x + 1) / x                                   
            break;
        end
        counter = counter + 1;
    end    
end