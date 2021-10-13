%Nearest neighbor training error rate is [0%].
%Nearest neighbor test error rate is [17%].

%This function takes in a training data matrix Xtrain, training
%label vector ytrain and uses them to compute the average cat
%and dog vectors. It also takes in a data matrix Xrun and 
%produces a vector of label guesses yguess. Each guess is found
%by searching through Xtrain to find the closest row, and then 
%outputting its label.
function yguess = nearest_neighbor(Xtrain,ytrain,Xrun)

[row col] = size(Xrun);
[r c] = size(Xtrain);

for i = 1:row
    dist = (Xtrain - ones(r,1)*Xrun(i,:)).^2;
    min = sqrt(sum((Xtrain(1,:) - Xrun(i,:)).^2));
    for j = 1:height(dist)
        distance = sqrt(sum(dist(j,:)));
        if (distance <= min)
            min = distance;
            yguess(i) = ytrain(j);
        end
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