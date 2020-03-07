source("ranking_metrics.R")
#carrega biblioteca para calculo de distancias
#install.packages("ecodist")
library(ecodist)

#######################################
#    CONJUNTO DE DADOS                #
#######################################

#carrega conjunto de dados estruturado
data(iris)
#visualiza conjunto de dados iris
iris

#######################################
#    DISTANCIAS                       #
#######################################

#calcula distancia euclidiana e retorna matriz com distancias 
distance_values <- full(distance(iris[, 1:4], "euclidean"))

#######################################
#    CONSULTA                         #
#######################################

#determina posicoes da amostras que serao as consultas
consulta<- c(1,20,150)

#######################################
#    OBTEM POSICOES ORDENADAS         #
#######################################

#ordena valores (crescente) de distancias da consulta para todas as amostras
rankings <- list(order(distance_values[consulta[1],]),order(distance_values[consulta[2],]),order(distance_values[consulta[3],]))


#######################################
#    GROUND TRUTH                     #
#######################################

#transforma rotulos em factor
labels <- factor(iris[,5])
#transforma rotulos em numeros por classe
numeric_labels <- as.numeric(labels)
#mostra rotulos numericos
numeric_labels
#inicializa vetor de 0 com tamanho igual o numero de amostras
ground_truth<- replicate(length(rankings[[1]]), 0)
#se o rotulo numero da amostra for igual ao da consulta entao recebe 1 (relevante)
ground_truth[numeric_labels==1] <- 1
#exibe vetor ground truth
ground_truth


#######################################
#    RELEVANCIA DO TOPO               #
#######################################

topk<- replicate(3,replicate(length(rankings[[1]]), 0))

top<-100

topk[rankings[[1]][1:top],1]<-1
topk[rankings[[2]][1:top],2]<-1
topk[rankings[[3]][1:top],3]<-1

#######################################
#    CALCULO DE METRICAS              #
#######################################

precision(ground_truth,rankings[[3]],top)

average_precision(ground_truth,rankings[[1]],top)

mean_reciprocal_ranking(ground_truth,rankings)
  
jaccard_index(rankings[[1]],rankings[[2]],top)

jaccard_index(rankings[[1]],rankings[[3]],top) 

jaccard_index(rankings[[2]],rankings[[3]],top) 

#######################################
# GRAFICO PRECISAO/REVOCACAO X TOPOK  #
#######################################

tops = c(1,5,10,25,50,75,100)
precision_values<- mapply(precision,top=tops,MoreArgs = list(ground_truth=ground_truth,prediction=rankings[[1]]))
recall_values<- mapply(recall,top=tops,MoreArgs = list(ground_truth=ground_truth,prediction=rankings[[1]]))

plot(tops,precision_values, type="o", col="blue", xlab="topo K", ylab="Precisão", main="Precisão/Revocação x topo K")
points(tops,recall_values, col="red")
lines(tops,recall_values, col="red")
legend("topright",c("Precisão","Revocação"),fill=c("blue","red"))

#######################################
#    GRAFICO PRECISAO X REVOCACAO     #
#######################################

relevant<-sum(ground_truth)

recall_points<-floor(relevant*seq(0.1,1.0,0.1))

precision_values<- mapply(precision,top=recall_points,MoreArgs = list(ground_truth=ground_truth,prediction=rankings[[1]]))

plot(seq(0.1,1.0,0.1),precision_values, type="o", col="blue", xlab="Revocação", ylab="Precisão", main="Precisão x Revocação")
