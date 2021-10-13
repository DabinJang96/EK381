data = readmatrix("concretedata.csv");
X = data(:,9);
Y = data(:,1:8);
%Y = data(:,1);
n = length(X);

% Part A ~ C)
Xhat = zeros(n,8);
MSE = zeros(1,8);
R2 = zeros(1,8);

for i = 1:8
     [Xhat(:,i), MSE(i), R2(i)] = LLSE(X,Y(:,i));
     %[Xhat(:,i), MSE(i), R2(i)] = LLSE(X,Y);
end

% Part D & E)
%  [Xhat, MSE, R2] = LLSE(X,Y);
%  scatter(X,Xhat);
%  hold on
%  xlabel("X");
%  ylabel("Xhat");
%  hold off

% Part F)
[Xhat, MSE, R2] = LLSE(X,[Y,Y.^2]);
scatter(X,Xhat);
hold on
xlabel("X");
ylabel("Xhat");
hold off

 

