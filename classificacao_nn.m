close all; clear all; clc 
%% Carrega o banco de dados IRIS
load fisheriris

%% Define as entradas de treinamento - 80% para treino
tmp1 = meas(1:40,:)'; % Setosa
tmp2 = meas(51:90,:)'; %Versicolor
tmp3 = meas(101:140,:)'; %Virginica
P = [tmp1 tmp2 tmp3];
%% Define targets
T=zeros(1,120);
for i=1:40
    T(i)=1; %Setosa
    T(i+40)=2; %Versicolor
    T(i+80)=3; %Virginica
end
%% Define as entradas para teste
tmp1= meas(41:50,:)';
tmp2 = meas(91:100,:)';
tmp3 = meas(141:150,:)';
teste = [tmp1 tmp2 tmp3];


%% Criar e Treinar a Rede

iris = newff(P, T, [10 2]);
view(iris);


iris = train(iris, P, T);


%net.trainParam.goal 
%net.trainParam.show 
%net.trainParam.lr
%net.trainParam.time 


%% Testar
a = sim(iris, teste);
plot(a)
