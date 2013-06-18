D = 1000; %annual demand of buyer 
A = 25; %ordering cost per order of buyer 
C_caret = 25; %the unit purchase cost of buyer 
r = 0.2; %the annual inventory holding cost per dollar invested in stocks of buyer 

r_caret = 0.2;
T0 = sqrt(2*A / (r_caret*C_caret*D)); %the optimal order interval for buyer 

S = 400; %the setup cost for the vendor 
P = 3200; %the production rate of the vendor 
C = 20; %vendor¡¯s unit production cost   

betas = [linspace(1, 1.5, 6)];

for i = 1:length(betas)
    beta = betas(i);
    
    disp(sprintf("beta = %f", beta));
	
    gamma = T0 * (beta - sqrt(beta^2 - 1));
    theta = T0 * (beta + sqrt(beta^2 - 1));
    
    a1 = r * C * D * ( 2*D / P - 1) / 2;
    a2 = r * C * D * ( 1 - D / P) / 2;
    
    b1 = gamma / (2*S) * (gamma * a1 + sqrt(gamma^2 * a1^2 + 4 * S * a2));
    b2 = theta / (2*S) * (theta * a1 + sqrt(theta^2 * a1^2 + 4 * S * a2));

    y = zeros(1,3);
    
    x1 = getX1(S, a2, gamma);
    x2 = getX2(S, a2, theta);
    
    y(1) = min(x1, 1 / ceil(1 / b1));
    y(2) = min(x2, 1 / floor(1 / b2));
    
    if a1 >= 0
      y(3) = min(1, 1 / floor(1 / b1));
    else
      y(3) = min(1, 1 / ceil(1 / b2));
    end
    
    k = 0;
    ACVal = inf;
    for i = 1:length(y)
      AC = valOfAC(y(i), b1, b2, gamma, S, a1, a2, theta);
      if AC < ACVal
        k = y(i);
	ACVal = AC;
      end    
    end
    T = valOfT(k, b1, b2, gamma, S, a1, a2, theta);
    Tk = k*T;

    disp(sprintf("k x T = %f, T = %f\n", Tk, T));
end

