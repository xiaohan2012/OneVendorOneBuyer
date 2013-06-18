function AC = valOfAC(k, b1, b2, gamma, S, a1, a2, theta)
    if k < b1
        AC = S * k / gamma + a2 * gamma / k + a1 * gamma;
    elseif k >= b1 && k <= b2
        AC = 2 * sqrt(S * (a1 * k + a2));
    else
        AC = S * k / theta + a2 * theta / k + a1 * theta;
    end
end