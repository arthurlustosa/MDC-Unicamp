library(corpus)
library(dplyr)
library(udpipe)
library(tidytext)
source("./ranking_metrics.R")

source("../INF-0611/aula2/aula2-atividade_pratica-auxiliar.R")
############################################
#             PROCESSANDO O TEXTO          #
############################################
data <- processamento_do_texto("oz.txt")
# Visualizando o primeiro capitulo (cada capitulo e um documentos)
data[1,]
# Obtendo tokens por documentocapitulo
chapter_words <- unnest_tokens(data, word, text) 
# Criando a matriz de termo-documento com frequencias
chapter_words <- document_term_frequencies(chapter_words, term = "word"); chapter_words
# Computando as estatisticas: tf, idf, tf-dif, tf_bm25 e bm25
chapter_words_stats <- as.data.frame(document_term_frequencies_statistics(chapter_words, k = 1.2, b=0.75)) 
# Visualizando as estatisticas
head(chapter_words_stats)


############################################
#         DEFININDO CONSULTA E TOP         #
############################################
query <- "good witch"
tokens_query <- text_tokens(query)
top <- 10

############################################
#              APLICANDO TF-IDF            #
############################################
stats <- get_query_statistics("tf_idf", chapter_words_stats, tokens_query)
stats

# Multiplica os tf_idfs dos termos 'good' e 'witch'
aux<-stats[,c(2:(length(tokens_query))+1)] %>% 
  mutate(SUM = Reduce(`+`, .))
stats$SUM <- aux$SUM
stats

# Ordena pela multiplicacao
tfidf_good_witch<-stats[order(stats$SUM, decreasing = TRUE),];tfidf_good_witch

# Obtem o topo com os maiores tf_idfs multiplicados
top_tf_idf <-  tfidf_good_witch[1:top, 1];top_tf_idf

############################################
#               APLICANDO BM25             #
############################################
stats <- get_query_statistics("bm25", chapter_words_stats, tokens_query)
stats

# Multiplica os tf_idfs dos termos 'good' e 'witch'
aux<-stats[,c(2:(length(tokens_query))+1)] %>% 
  mutate(SUM = Reduce(`+`, .))
stats$SUM <- aux$SUM
stats

# Ordena pela soma
bm25_good_witch<-stats[order(stats$SUM, decreasing = TRUE),];bm25_good_witch

# Obtem o topo com os maiores bm25s somados
top_bm25 <-  bm25_good_witch[1:top, 1];top_bm25

############################################
#            COMPARANDO RANKINGS           #
############################################
top_bm25
top_tf_idf
index <- jaccard_index(top_tf_idf, top_bm25, top); index
index <- kendall_tau(top_tf_idf, top_bm25); index

