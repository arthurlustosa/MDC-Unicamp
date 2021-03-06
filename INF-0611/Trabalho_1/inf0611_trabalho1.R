#------------------------------------------------#
# INF-0611 Recuperacao de Informacao             #
#                                                #
# Trabalho Avaliativo 1                          #
#------------------------------------------------#
# Nome COMPLETO Aluna (o) 1:                     #
#                                                #
# Nome COMPLETO Aluna (o) 2:                     #
#                                                #
#------------------------------------------------#

#------------------------------------------------#
# Configuracao dos arquivos auxiliares           #
#------------------------------------------------#
# setwd("") # configure o caminho antes de descomentar essa linha
source("./ranking_metrics.R")
source("../INF-0611/Trabalho_1/trabalho1_base.R")


#------------------------------------------------#
# Exemplo de uso da funcao de processamento      #
# dos dados, (o segundo parâmetro nao deve ser   #
# modificado)                                    #
#------------------------------------------------#
data    <- process_data("../INF-0611/Trabalho_1/time.txt", "XX-Text [[:alnum:]]",  "Article ", convertcase = FALSE, remove_stopwords = FALSE)
queries <- process_data("../INF-0611/Trabalho_1/queries.txt", "XX-Find [[:alnum:]]", "Query ", convertcase = FALSE, remove_stopwords = FALSE)

a <- read.csv("../INF-0611/Trabalho_1/relevance.csv", header = TRUE)
names(a)[a[1,]==1] # artigos relevantes da primeira consulta

# Criando a matriz de termo-documento com frequencias
time_words <- document_term_frequencies(time_words, term = "word"); time_words

#------------------------------------------------#
# Questao 1                                      #
#------------------------------------------------#



# Conjunto 1 de valores k e b
k1 <- 1.2
b1 <- 0.75
# Computando as estatisticas: tf, idf, tf-dif, tf_bm25 e bm25
time_words_stats1 <- as.data.frame(document_term_frequencies_statistics(time_words, k1, b1)) 
# Visualizando as estatisticas
head(time_words_stats1)

# Conjunto 2 de valores k e b
k2 <- 1.4
b2 <- 0.80
# Computando as estatisticas: tf, idf, tf-dif, tf_bm25 e bm25
time_words_stats2 <- as.data.frame(document_term_frequencies_statistics(time_words, k2, b2)) 
# Visualizando as estatisticas
time_words_stats2


#------------------------------------------------#
# Questao 2                                      #
#------------------------------------------------#
# Precisao do Conjunto 1 (TF-idf e BM25)

# Precisao do Conjunto 2 (BM25)

# Revocacao do Conjunto 1 (TF-idf e BM25)

# Revocacao do Conjunto 2 (BM25)


#------------------------------------------------#
# Questao 2 - RESPONDA:                          #
# Qual dos modelos teve o melhor resultado para  #
# as consultas escolhidas?                       #
#                                                #
#                                                #
#                                                #
#------------------------------------------------#


#------------------------------------------------#
# Questao 3                                      #
#------------------------------------------------#

#------------------------------------------------#
# Questao 3 - RESPONDA:                          #
# Qual o impacto dessas alteracoes na precisao?  #
# E na Revocacao?                                #
#                                                #
#                                                #
#                                                #
#------------------------------------------------#


#------------------------------------------------#
# Questao 4                                      #
#------------------------------------------------#

#------------------------------------------------#
# Questao 4 - RESPONDA:                          #
# Qual dos modelos teve o melhor resultado?      #
#                                                #
#                                                #
#                                                #
#------------------------------------------------#





