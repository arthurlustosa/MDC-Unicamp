
###################################
# Preparando ambiente - workspace
#
setwd("~/Desktop/MDC/MDC-project")

# instalando bibliotecas
install.packages("ecodist")
install.packages("proxy")
install.packages("Metrics")
install.packages("janeaustenr")

###################################
# Exemplo - distancia Euclidiana
# preparando os dados
x1 <- c(0, 2, 3, 5)
x2 <- c(2, 0, 1, 1)

pontos <- data.frame(x1 = x1, x2 = x2)
rownames(pontos) <- c("p", "q", "r", "s"); pontos

# incluindo a biblioteca
library(ecodist)

# calculando a distancia dos pontos p e q
distance(pontos[c(1, 2),], "euclidean")

# calculando a matriz de distancias 
full(distance(pontos, "euclidean"))


###################################
# Exemplo - distancia Manhattan
# calculando a distancia dos pontos p e q
distance(pontos[c(1,2),], "manhattan")

# calculando a matriz de distancias 
full(distance(pontos, "manhattan"))

###################################
# Exemplo - distancia Minkowski
# carregando uma base de dados
data(iris)

# calculando a matriz de distancias 
matriz_distancia <- full(dist(iris[,1:4], p = 2,  method = "minkowski", diag = FALSE))

# distancia minkowski (p=2 => euclidiana) entre amostras 1 e 2
matriz_distancia[1,2]

###################################
# Exemplo - Simple Matching Coefficient
# preparando os dados
a <- c(1, 0, 0, 0, 1, 0, 0, 1, 1)
b <- c(0, 0, 0, 1, 1, 1, 0, 0, 1)

# calculando o SMC
SMC <- function (a, b) {
  return (sum(a == b) / length(a))
}

SMC(a,b)

###################################
# Exemplo - Coeficiente de Jaccard
# preparando os dados
a <- c(1, 0, 0, 0, 1, 0, 0, 1, 1)
b <- c(0, 0, 0, 1, 1, 1, 0, 0, 1)

# calculando o coeficiente de Jaccard
J <- function(a, b) {
  num <- sum(a == b & a == 1)
  den <- length(a[a != b | a == 1])
  return (num / den)
}

J(a, b)


###################################
# Exemplo - Similaridade Cosseno
# carregando a biblioteca
library(proxy)
# preparando os dados
a <- c(2, 4); b <- c(3, 1); c <- c(2, 2)

# calculando a similaridade entre os pontos a e b
simil(list(a, b), "cosine")

# calculando a similaridade entre os pontos a e c
simil(list(a, c), "cosine")

# carregando a biblioteca
data(iris)
# amostras 1 e 2
iris[c(1, 2), c(1:4)]

# calculando a similaridade entre todos os pontos
valores_similaridade <- full(simil(iris[, 1:4], "cosine"))
# similaridade do cosseno entre amostras 1 e 2
valores_similaridade[1, 2]

# # carregando a biblioteca e os dados
# library(proxy)
# data(iris)

# # calculando a similaridade entre todos os pontos
# valores_similaridade <- full(simil(iris[, 1:4], "cosine"))

# # similaridade do cosseno entre amostras 1 e 2
# valores_similaridade[1, 2]

###################################
# Exemplo - Revocacao e Precisao
# incluindo o arquivo com as funções implementadas
source("ranking_metrics.R")
# preparando os dados: 1 indica que o documento é relevante
ground_truth <- c(1,0,1,1,1,0,1,1,1,0)
# posições dos documentos recuperados
ranking <- c(1,3,2,6,10)

# calculando a precisao
precision(ground_truth, ranking, 5)

# calculando a revocacao
recall(ground_truth, ranking, 5)

###################################
# Exemplo - Precisao Media e Media das Precisoes Medias
# preparando os dados
ground_truth <- c(1,0,1,1,1,0,1,1,1,0)
names(ground_truth) <- c(1:10); ground_truth

a <- c(1,3,2,4,6,5,7,10,9)
b <- c(1,2,6,3,4,5,7,10,9)

# calculando a precisao media
average_precision(ground_truth, a, 5)

# calculando a media das precisoes medias
map(ground_truth, list(a, b), 5)

###################################
# Exemplo - Ganho Cumulativo, Ganho Cumulativo Descontado e Ganho Cumulativo Descontado Normalizado
# preparando os dados
# ganho em cada posicao
ganho <- c(3,2,1,0,2,3,1,0,3,2)
# posicoes dos objetos recuperados
a <- c(1,4,2,3,8,5,7,9,6,10)

# calculando o ganho cumulativo
cumulative_gain(a, ganho, 5)

# calculando o ganho cumulativo descontado
discounted_cumulative_gain(a, ganho, 5)

# calculando o ganho cumulativo normalizado
normalized_discounted_cumulative_gain(a, ganho, 5)

###################################
# Exemplo - Media de Ranking Reciproco
# preparando os dados
ground_truth <- c(1,0,1,1,1,0,1,1,1,0)
a <- c(2,1,6,3,10,4,9,7,8,5)
b <- c(2,6,10,1,3,4,9,7,8,5)

# calculando a media de ranking reciproco
mean_reciprocal_ranking(ground_truth, list(a, b))

###################################
# Exemplo - Indice de Jaccard
# preparando os dados, uma predição é um vetor de posições no ranking
a <- c(4,3,2,1,7,5,6,10,8,9)
b <- c(2,8,9,4,3,1,5,10,6,7)

# calculando o indice de Jaccard
jaccard_index(a, b, 5)

###################################
# Exemplo - Distancia Kendall Tau
# preparando os dados
a <- c(4,3,2,1,5)
b <- c(2,1,5,4,3)

# calculando a distancia de Kendall Tau
kendall_tau(a, b)

###################################
# Exemplo - Dados Estruturados
data(cars)
cars

data(women)
women

###################################
# Exemplo - Dados Nao Estruturados
library(janeaustenr)

# amostra de um dos livros de Jane Austen
austen_books()[c(10:14),]$text
