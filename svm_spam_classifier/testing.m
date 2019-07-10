function [error_train,error_cv] = ...
    testing(X, y, Xval, yval)


c_vec = [0 0.001 0.003 0.01 0.03 0.1 0.3 1 3 10]';
sigma_vec = [0 0.001 0.003 0.01 0.03 0.1 0.3 1 3 10]';

error_train = zeros(length(c_vec),length(sigma_vec));

error_cv = zeros(length(c_vec),length(sigma_vec));

for i=1:length(c_vec)
    c = c_vec(i);
    for j=1:length(sigma_vec)
        sigma = sigma_vec(j);
        model = svmTrain(X, y, c, @(x1, x2) gaussianKernel(x1, x2, sigma));
        pred_train = svmPredict(model,X);
        pred_cv = svmPredict(model,Xval);
        
        error_train(i,j) = mean(double(pred_train ~= y));
        
        error_cv(i,j) = mean(double(pred_cv ~= yval));
    end
end