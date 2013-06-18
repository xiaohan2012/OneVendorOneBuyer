function T = valOfT(k, b1, b2, gamma, S, a1, a2, theta)
    if k < b1
        T = gamma / k;
    elseif k >= b1 && k <= b2
        T = sqrt(S / (a1 * k + a2));
    else
        T = theta / k;
    end
end