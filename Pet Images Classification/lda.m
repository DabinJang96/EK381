%Linear discriminant analysis training error rate is [0.81%].
%Linear discriminant analysis test error rate is [24%].

%This function takes in a training data matrix Xtrain, training
%label vector ytrain and uses them to compute the cat
%and dog sample mean vectors as well as the sample covariance matrix 
%(which is assumed to be equal for cats and dogs). 
%It also takes in a data matrix Xrun and produces a vector of
%label guesses yguess, corresponding to the ML rule for
%jointly Gaussian vectors with different means and the same 
%covariance matrix.
function yguess = lda(Xtrain,ytrain,Xrun)

[row col] = size(ytrain);
cat = [];
dog = [];

[avgcat avgdog] = average_pet(Xtrain,ytrain);

for i = 1:row
   if (ytrain(i) == -1)
       cat = [cat;Xtrain(i,:)];
   else
       dog = [dog;Xtrain(i,:)];
   end
end

Cov_dog = cov(dog);
Cov_cat = cov(cat);

T_avgdog = avgdog';
T_avgcat = avgcat';

Complete = (((height(Cov_cat))-1) * Cov_cat) + (((height(Cov_dog))-1) * Cov_dog);
Complete = Complete / ((height(Xtrain))-2);

difference = pinv(Complete) * (T_avgdog-T_avgcat);
LDA2 = (avgdog * pinv(Complete) * T_avgdog) - (avgcat * pinv(Complete) * T_avgcat);

for i = 1: height(Xrun)
    LDA1 = 2 * Xrun(i,:) * difference;
    if (LDA1 < LDA2)
        yguess(i) = -1;
    else
        yguess(i) = 1;
    end
end

yguess = yguess';

%Your code should go above this line.
if (~iscolumn(yguess))
    error("yguess is not a column vector.")
elseif (length(yguess)~=size(Xrun,1))
    error("Length of yguess is not equal to the number of rows in Xrun.")
elseif (sum(unique(abs(ytrain))~=1))
    warning("Some elements in ytrain are not +1 or -1.")
elseif (sum(unique(abs(yguess))~=1))
    warning("Some elements in yguess are not +1 or -1.")
end