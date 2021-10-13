%Homework 8 MATLAB Solution
%Read data
data = readmatrix("bcdata.csv"); 
benign_indices = find(data(:,1) == 0); 
malignant_indices = find(data(:,1) == 1); 
benign = data(benign_indices,2:end); 
malignant = data(malignant_indices,2:end);
n_benign = length(benign);
n_malignant = length(malignant);

%Calculate mean vectors and covariance matrices.
meanvector_benign = mean(benign);
meanvector_malignant = mean(malignant);
covmatrix_benign = cov(benign);
covmatrix_malignant = cov(malignant);

%part(a)
%Your code for calculating n_fa, the number of benign data points that 
%are classified as malignant by the ML rule.
H0data = mvnrnd(meanvector_benign, covmatrix_benign, n_benign);
H1data = mvnrnd(meanvector_malignant, covmatrix_malignant, n_malignant);
H0decisions = (mvnpdf(H0data,meanvector_malignant,covmatrix_malignant) >= mvnpdf(H0data,meanvector_benign,covmatrix_benign));
n_fa = sum((H0decisions ~= 0));

p_fa = n_fa / n_benign %estimated probability of false alarm

%part(b)
%Your code for calculating n_md, the number of malignant data points that 
%are classified as benign by the ML rule.
H1decisions = (mvnpdf(H1data, meanvector_malignant, covmatrix_malignant) >= mvnpdf(H1data, meanvector_benign, covmatrix_benign));
n_md = sum((H1decisions ~= 1));

p_md = n_md / n_malignant %estimated probability of missed detection

%part(c)
%Your code for calculating p_error, the probability of error under
%the ML rule.

ph0 = 1/2;
ph1 = 1/2;
p_error_ml = p_fa * ph0 + p_md * ph1

%part(d)
%Your code for estimating p_error from 2000 benign and 2000 malignant 
%synthetic data points.

H0data_2000 = mvnrnd(meanvector_benign, covmatrix_benign, 2000);
H1data_2000 = mvnrnd(meanvector_malignant, covmatrix_malignant, 2000);
H0decisions_2000 = (mvnpdf(H0data_2000,meanvector_malignant,covmatrix_malignant) >= mvnpdf(H0data_2000, meanvector_benign,covmatrix_benign));
n_fa_2000 = sum((H0decisions_2000 ~= 0));

p_fa_2000 = n_fa_2000 / 2000

H1decisions_2000 = (mvnpdf(H1data_2000, meanvector_malignant, covmatrix_malignant) >= mvnpdf(H1data_2000, meanvector_benign, covmatrix_benign));
n_md_2000 = sum((H1decisions_2000 ~= 1));

p_md_2000 = n_md_2000 / 2000 

p_error_ml_2000 = (p_fa_2000 * ph0) + (p_md_2000 * ph1)












