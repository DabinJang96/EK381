clear
clc

%readmatirx
M = readmatrix('bcdata.csv');

% create benign & malignant matrix
benign = M(1:200, 2:3);
malignant = M(201:400, 2:3);

% Mean of benign & malignant 
benign_E = mean(benign);
malignant_E = mean(malignant);

% Covariance of benign & malignant 
benign_Cov = cov(benign);
malignant_Cov = cov(malignant);

% benign texture
histfit(benign(:,1));
figure

% benign perimeter
histfit(benign(:,2));
figure

% malignant texture
histfit(malignant(:,1));
figure

% malignant perimeter
histfit(malignant(:,2));
figure

% benign data as a blue scatter plot
scatter(benign(:,1),benign(:,2),"b");
hold on;

% malignant data as a red scatter plot
scatter(malignant(:,1), malignant(:,2), "r");


% the benign Gaussian fit as a blue contour plot
gaussiancontour(benign(:,1),benign(:,2),"b")


% the malignant Gaussian fit as a red contour plot
gaussiancontour(malignant(:,1), malignant(:,2),"r")

% labeling the plot
xlabel("texture");
ylabel("perimeter");
legend({'benign','malignant'})
hold off;
figure


% the synthetic benign data as a blue scatter plot
benign_synthetic = mvnrnd(benign_E, benign_Cov, 200);
scatter(benign_synthetic(:,1),benign_synthetic(:,2),"b");
hold on;


% the synthetic malignant data as a red scatter plot
malignant_synthetic = mvnrnd(malignant_E, malignant_Cov, 200);
scatter(malignant_synthetic(:,1),malignant_synthetic(:,2),"r");

% the benign Gaussian fit as a blue contour plot
gaussiancontour(benign(:,1),benign(:,2),"b")

% the malignant Gaussian fit as a red contour plot
gaussiancontour(malignant(:,1), malignant(:,2),"r")

% labeling the plot
xlabel("texture");
ylabel("perimeter");
legend({'benign','malignant'})
hold off;




