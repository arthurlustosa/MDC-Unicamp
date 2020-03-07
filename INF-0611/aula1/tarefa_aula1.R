source("ranking_metrics.R")

# Carrega biblioteca para calculo de distancias
# install.packages("ecodist") # Instalar pacote, se necessário
library(ecodist)

# Carrega a biblioteca para gerar gráficos
# install.packages("ggplot2") # Instalar pacote, se necessário
library(ggplot2)

#######################################
# CONJUNTO DE DADOS                   #
#######################################

# Carrega o conjunto de dados iris
data(iris)

# Visualiza o conjunto de dados iris
iris

# Número de amostras do conjunto de dados
n <- nrow(iris)

#######################################
#  DISTANCIAS                         #
#######################################

# Calcula distancia euclidiana  
distance_values <- full(distance(iris[, 1:4], "euclidean"))

#######################################
# GROUND TRUTH                        #
#######################################

# Consideraremos versicolor como ground truth
species = "versicolor"
ground_truth <- as.numeric(iris[,5] == species)

# Exibe o vetor ground truth
ground_truth

#######################################
# CONSULTA                            #
#######################################

# Posicoes da amostras que serão as consultas
consultas <- c(50, 100, 150)

# Número de consultas
nc <- length(consultas)

#######################################
# POSICOES ORDENADAS POR DISTANCIA    #
#######################################

# Ordena valores das distancias das consultas para todas as amostras
rankings <- list()
for (i in 1:nc) {
  rankings[[i]] <- order(distance_values[consultas[i],])
}

#######################################
# RELEVANCIA DO TOPO                  #
#######################################

top <- 75

topk <- matrix(data = 0, nrow = n, ncol = nc)

for (i in 1:nc) {
  topk[rankings[[i]][1:top], i] <- 1
}

#######################################
# CALCULO DE METRICAS                 #
#######################################

for (i in 1:nc) {
  print(paste("Ranking", i))
  print(paste("P:", precision(ground_truth, rankings[[i]], top)))
  print(paste("R:", recall(ground_truth, rankings[[i]], top)))
  print(paste("AP:", average_precision(ground_truth, rankings[[i]], top)))
}

mean_reciprocal_ranking(ground_truth, rankings)

jaccard_index(rankings[[1]], rankings[[2]], top)
jaccard_index(rankings[[1]], rankings[[3]], top) 
jaccard_index(rankings[[2]], rankings[[3]], top) 

#######################################
# GRAFICO PRECISAO + REVOCACAO        #
#######################################

ranking <- 2
k <- 100

p <- mapply(precision, 1:k, 
            MoreArgs = list(ground_truth = ground_truth, 
                            prediction = rankings[[ranking]]))
r <- mapply(recall, 1:k, 
            MoreArgs = list(ground_truth = ground_truth, 
                            prediction = rankings[[ranking]]))
pr <- data.frame(precision = p, recall = r)

# Precisão + Revocação
ggplot(pr, aes(x = 1:k)) + 
  geom_point(aes(y = precision, colour = "Precisão")) + 
  geom_line(aes(y = precision, colour = "Precisão")) +
  geom_point(aes(y = recall, colour = "Revocação")) + 
  geom_line(aes(y = recall, colour = "Revocação")) +
  theme_light() +
  labs(colour = element_blank(), 
       title = "Precisão + Revocação") +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(legend.position = c(0.5, 0.15)) +
  theme(legend.box.background = element_rect(colour = "black")) +
  scale_x_continuous(name = "Valor", limits = c(1, k), 
                     breaks = 5 * 1:(k/5),
                     minor_breaks = NULL) +
  scale_y_continuous(name = "Valor", limits = c(0, 1), 
                     breaks = 0.1 * 0:10,
                     minor_breaks = NULL)

#######################################
#    GRAFICO PRECISAO X REVOCACAO     #
#######################################

ggplot(pr, aes(x = recall)) + 
  geom_point(aes(y = precision)) + 
  geom_line(aes(y = precision)) +
  theme_light() +
  labs(colour = element_blank(), 
       title = "Precisão x Revocação") +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_y_continuous(name = "Precisão", limits = c(0, 1), 
                     breaks = 0.1 * 0:10,
                     minor_breaks = NULL) +
  scale_x_continuous(name = "Revocação", limits = c(0, 1), 
                     breaks = 0.1 * 0:10,
                     minor_breaks = NULL)

#######################################
# PROJECAO DAS AMOSTRAS DA BASE IRIS  #
#######################################

# Distribuição das amostras considerando apenas as sépalas
ggplot(iris, aes(x = Sepal.Length, Sepal.Width, colour = Species)) + 
  geom_point() +
  theme_light()

# Distribuição das amostras considerando apenas as pétalas
ggplot(iris, aes(x = Petal.Length, Petal.Width, colour = Species)) + 
  geom_point() +
  theme_light()
