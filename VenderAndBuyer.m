D = 1000; %annual demand of buyer 
A = 25; %ordering cost per order of buyer 
C = 20; %the unit purchase cost of buyer 
r = 0.2; %the annual inventory holding cost per dollar invested in stocks of buyer 
T0 = sqrt(2*A / (r*C*D)); %the optimal order interval for buyer 
T = 1; %the vendor setup time interval 
kT = 1/2; %buyer purchasing time interval after negotiation    k∈(1,
S = 1; %the setup cost for the vendor 
P = 1; %the production rate of the vendor 
C = 1; %vendor’s unit production cost   

beta = 1; %文档中未出现定义 - -||

gamma = T0 * (beta - sqrt(beta^2 - 1));
theta = T0 * (beta + sqrt(beta^2 - 1));

a1 = r * C * D * ( 2*D / P - 1) / 2;
a2 = r * C * D * ( 1 - D / P) / 2;

b1 = gamma / (2*S) * (gamma * a1 + sqrt(gamma^2 * a1^2 + 4 * S * a2));
b2 = theta / (2*S) * (theta * a1 + sqrt(theta^2 * a1^2 + 4 * S * a2));

y = zeros(1,3);

x1 = getX1(S, a2, gamma);
x2 = getX1(S, a2, theta);

y(1) = min(x1, 1 / ceil(1 / b1));
y(2) = min(x2, 1 / floor(1 / b2));

if a1 >= 0
    y(3) = min(1, 1 / floor(1 / b1));
else
    y(3) = min(1, 1 / ceil(1 / b2));
end

k = inf;
for i = 1:size(y, 2)
    AC = valOfAC(y(i), b1, b2, gamma, S, a1, a2, theta);
    if AC < k
        k = AC;
    end    
end

k
T = valOfT(k, b1, b2, gamma, S, a1, a2, theta)


