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
source("./trabalho1_base.R")


#------------------------------------------------#
# Exemplo de uso da funcao de processamento      #
# dos dados, (o segundo parâmetro nao deve ser   #
# modificado)                                    #
#------------------------------------------------#
data    <- process_data("time.txt", "XX-Text [[:alnum:]]",  "Article ", convertcase = FALSE, remove_stopwords = FALSE)
queries <- process_data("queries.txt", "XX-Find [[:alnum:]]", "Query ", convertcase = FALSE, remove_stopwords = FALSE)

a <- read.csv("relevance.csv", header = TRUE)
names(a)[a[1,]==1] # artigos relevantes da primeira consulta

#------------------------------------------------#
# Questao 1                                      #
#------------------------------------------------#
# Conjunto 1 de valores k e b

# Conjunto 2 de valores k e b


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





