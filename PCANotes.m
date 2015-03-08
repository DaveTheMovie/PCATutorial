%% Data
n = 1000;
randvec1 = rand(n,1);
x = [randvec1 randvec1 + rand(n,1)/10 rand(n,1)];

MyScatter3 = @(x)  scatter3(x(:,1),x(:,2),x(:,3));

MyScatter3(x)

%% PCA
[coeff,score,latent,tsquared,explained,mu] = pca(x);

figure()
pareto(explained)
xlabel('Principal Component')
ylabel('Variance Explained (%)')

figure 
surf(coeff)

%% Reverse Engineering

mumat = ones(length(x),1)  * mu;
x_centered = x - mumat;


score_ = x_centered * coeff;

MyScatter3(score_)


MyScatter = @(x)  scatter(x(:,1),x(:,2));

MyScatter(score_)

%% Create New Subspace Dataset

k = 2;
x_sub1 = x_centered * coeff(:,1:k);
MyScatter(x_sub)


