# Constantes

letters    # letras minusculas

LETTERS    # letras maiusculas

month.abb  # meses do ano (abreviados)

month.name # meses do ano

pi         # constante pi

# Funcoes matematicas basicas

sqrt(c(1024, 49, 225))

exp(c(2, 3, 4))

factorial(c(3, 5, 4, 6))

log(c(1, 1000, 1024))   # log na base e

log2(c(1, 1000, 1024))  # log na base 2

log10(c(1, 1000, 1024)) # log na base 10

log(1000, base = 10)

log(1024, 2)

ceiling(c(-2.2, -1.8, 2.1, 2.7))

floor(c(-2.2, -1.8, 2.1, 2.7))

trunc(c(-2.2, -1.8, 2.1, 2.7))

round(c(-2.2, -1.8, 2.1, 2.7))

round(0.5:9)

round(-2.5:3)

signif(x = pi, digits = 1:5)

signif(x = pi:10, digits = 3)

abs(-2.2:3)

x <- seq(1, 10, 0.25)

# Funcoes Trigonometricas

sin(c(0, pi/4, pi/2, pi))

cos(c(0, pi/4, pi/2, pi))

tan(c(0, pi/4, pi/2, pi))

acos(c(1, 0, -1))

# Funcoes para Sequencias, Vetores, Listas e Fatores

f <- gl(3, 10, length = 25, labels = c("bronze", "prata", "ouro"), ordered = TRUE)

x <- c(7, 2, 1, 6, 3, 4, 1, 5, 0, 8, 2); x

length(x) <- 10; x

length(x) <- 12; x

length(x) <- 10; x

outer(1:10, 1:10, "*")

log(1:4, 1:4, log)

length(x)

x <- runif(10)

sort(x)

order(x)

rank(x)

x[order(x)]

x <- c(7, 2, 1, 6, 3, 4, 1, 5, 0, 8); x

sum(x)

cummin(x)

cummax(x)

cumsum(x)

cumprod(x)

# Funcoes para Conjuntos

x <- c(1, 2, 3, 4, 5); x

y <- c(3, 4, 5, 6, 7); y

union(x, y)

intersect(x, y)

setequal(x, y)

setdiff(x, y)

setdiff(y, x)

is.element(x, y)

is.element(y, x)

setequal(c(1, 2, 3), c(2, 3, 1))

x <- 1:5; x

# Funcoes Estatisticas

mean(x)

sd(x)

cor((1:100)^2, log(1:100))

# Funcoes Probabilisticas

runif(4, min = 0, max = 10)

rnorm(4, mean = 0, sd = 10)

sample(5)

sample(1:60, 6)

# Funcoes para Strings

x <- "Mineracao de Dados Complexos"

y <- "Analise de Dados"

nchar(c(x, y))

strsplit(c(x, y), split = " ")

substr(x, start = 11, stop = 18)

substr(x, start = 11, stop = 18) <- y

chartr("zenitpolar", "polarzenit", y)

x <- "MDC"

y <- "Analise de Dados"

strtrim(c(x, y), 7)

paste(x, y, sep = " - ")

toupper(y)

x <- "Mineracao de Dados Complexos"

y <- "Analise de Dados"

sub("a", "*", y)

gsub("os", "_-_", x)

grep("Dados", c(x, "MDC", y))

# Funcoes Logicas

x <- c(F, T, F); x

any(x)

x <- c(F, F, F); x

any(x)

x <- c(T, T, F); x

all(x)

x <- c(T, T, T); x

all(x)

# Funcao do.call()

param <- as.list(letters)

param$sep <- ""

param

do.call(paste, param)