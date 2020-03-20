close all; clear all; clc 

%% Carrega o banco de dados IRIS
load fisheriris;
%1. sepal length in cm 
%2. sepal width in cm 
%3. petal length in cm 
%4. petal width in cm 


%% Cria a matriz iris
species_n = zeros(150,1);
for i=1:150
    if species(i)=="setosa" species_n(i) = 1;
    elseif species(i)=="versicolor" species_n(i) = 2;
    elseif species(i)=="virginica" species_n(i) = 3;
    end
end
c = [repmat([1 0 0],50, 1); repmat([0 1 0],50, 1); repmat([0 0 1],50, 1)]; %gerar cor para os graficos
iris = [meas, species_n];


%% Standardization
desvio=std(iris(:,1:4));
media=mean(iris(:,1:4));
iris_stand=(iris(:,1:4)-media)./desvio;


%% Plot - Sem PCA

subplot(1,2,1);
scatter3(iris_stand(:,1),iris_stand(:,2), iris_stand(:,3), 15, c, 'filled');

xlabel('Sepal Length (cm)');
ylabel('Sepal Width (cm)');
zlabel('Petal Length (cm)');

%% PCA
[coeff,score,latent,tsquared,explained] = pca(iris_stand,'NumComponents', 3);
%[coeff2,score2,latent2,tsquared2,explained2] = pca(iris_stand,'NumComponents', 4);
sum(latent);

%% Plot PCA
subplot(1,2,2);
%scatter3(score(:,1),score(:,2), score(:,3), 15, c, 'filled');
scatter(score(:,1),score(:,2), 20, c, 'filled');
%biplot(coeff, 'scores', score);
xlabel('PC1');
ylabel('PC2');
zlabel('PC3');

explained
latent;
sum(latent(1:2))