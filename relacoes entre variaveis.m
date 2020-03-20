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
iris = [meas, species_n];


%% Plota o grafico

c = [repmat([1 0 0],50, 1); repmat([0 1 0],50, 1); repmat([0 0 1],50, 1)];

k=0;
for i=1:4
    for j=1:4
        k=k+1;
        subplot(4, 4, k);
        
        if i==j
            hist(iris(:,i));
            if i==1 title("Sepal Length (cm)");
            elseif i==2 title("Sepal Width (cm)");
            elseif i==3 title("Petal Length (cm)");
            elseif i==4 title("Petal Width (cm)");
            end
        else           
            c = [repmat([1 0 0],50, 1); repmat([0 1 0],50, 1); repmat([0 0 1],50, 1)];
            scatter(iris(:,i),iris(:,j), 10, c, 'filled');
        end
        
    end
end

%{
scatter(iris(:,3),iris(:,4), 10, c, 'filled');
xlabel('Petal length (cm)');
ylabel('Petal width (cm)');
%}


%% Standardization
desvio=std(iris(:,1:4));
media=mean(iris(:,1:4));
iris_stand=(iris(:,1:4)-media)./desvio;

%% 

C = cov(iris)




%% Exclui variaveis desnecessarias
clearvars c i meas species species_n;