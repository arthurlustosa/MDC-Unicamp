########################################
# Teste 2c - INF-0612          
# Nome(s): Arthur Lustosa de Souza e Rodolfo de Lima Viana
########################################


dia <- c(01, 01, 02, 02, 02, 02, 03, 03, 03, 04, 04, 04, 05, 05, 06, 06, 06, 06, 07, 07, 07, 07, 07, 08, 08, 08, 08, 09, 10, 10, 10, 10, 10, 11, 11, 11, 11, 11, 12, 12, 12, 13, 13, 13, 14, 14, 14, 15, 15, 15)

cidade <- c('Campinas', 'Vinhedo', 'Campinas', 'Limeira', 'Campinas', 'Vinhedo', 'Campinas', 'Vinhedo', 'Limeira', 'Campinas', 'Vinhedo', 'Limeira', 'Campinas', 'Vinhedo', 'Campinas', 'Vinhedo', 'Campinas', 'Vinhedo', 'Vinhedo', 'Campinas', 'Vinhedo', 'Vinhedo', 'Limeira', 'Limeira', 'Campinas', 'Vinhedo', 'Limeira', 'Campinas', 'Vinhedo', 'Campinas', 'Limeira', 'Vinhedo', 'Campinas', 'Vinhedo', 'Campinas', 'Limeira', 'Vinhedo', 'Limeira', 'Vinhedo', 'Campinas', 'Limeira', 'Vinhedo', 'Limeira', 'Campinas', 'Limeira', 'Limeira', 'Campinas', 'Campinas', 'Limeira', 'Limeira')

chuva <- c(0.15, 0.02, 0.01, 0.13, 0.12, 2.19, 1.11, 0.76, 2.98, 0.45, 2.63, 0.76, 0.38, 1.26, 2.57, 0.54, 9.87, 3.41, 2.96, 1.37, 6.78, 13.87, 0.11, 1.84, 12.19, 2.86, 11.99, 2.01, 2.32, 11.2, 0.48, 4.33, 13.32, 1.05, 0.56, 1.92, 1.81, 7.66, 2.93, 1.17, 0.7, 2.95, 0.37, 1.08, 1.31, 3.22, 0.49, 1.86, 2.3, 7.65)


## DICA:
## Dado um data frame df[], voce pode remover linhas repetidas considerando duas colunas "a" e "b" 
## usando o comando df[!duplicated(df[,c('a', 'b')]),] (mantendo apenas a primeira ocorrencia) ou o
## comando df[!duplicated(df[,c('a', 'b')], fromLast = TRUE),] (mantendo apenas a ultima ocorrencia)

# Parte 1 - Criando o DF
df_chuva <- data.frame(dia, cidade, chuva)

# Parte 2
df_chuva <- df_chuva[!duplicated(df_chuva[,c('dia', 'cidade')], fromLast = TRUE), ]

# Parte 3 - variaveis "acumCamp", "acumLim" e "acumVin"
acumCamp <- cumsum(df_chuva[df_chuva$cidade == 'Campinas',]$chuva)
acumLim <- cumsum(df_chuva[df_chuva$cidade == 'Limeira',]$chuva)
acumVin <- cumsum(df_chuva[df_chuva$cidade == 'Vinhedo',]$chuva)

# Parte 4 - "dmaxCamp", "dmaxLim" e "dmaxVin"
# Campinas
df_chuvas_Camp = df_chuva[df_chuva$cidade == 'Campinas',]
dmaxCamp <- df_chuvas_Camp[order(df_chuvas_Camp$chuva, decreasing = T), ][1,]$dia
dmaxCamp
# Limeira
df_chuvas_Lim = df_chuva[df_chuva$cidade == 'Limeira',]
dmaxLim <- df_chuvas_Lim[order(df_chuvas_Lim$chuva, decreasing = T), ][1,]$dia
dmaxLim
# Vinhedo
df_chuvas_Vin = df_chuva[df_chuva$cidade == 'Vinhedo',]
dmaxVin <- df_chuvas_Vin[order(df_chuvas_Vin$chuva, decreasing = T), ][1,]$dia 
dmaxVin




