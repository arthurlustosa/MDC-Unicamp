# Definindo Funcoes

mysum <- function(a, b) {
  a + b
}

makePower <- function(n) {
  function(x) {
    x^n
  }
}

square <- makePower(2)
cube <- makePower(3)

subvector <- function(vector, begin = 1, end = length(vector)) {
  return(vector[begin:end])
}

mydist <- function(x = c(0, 0), y = c(0, 0)) {
  sqrt((x[1] - y[1])^2 + (x[2] - y[2])^2)
}

truncd <- function(n, d = 0) {
  trunc(n * 10^d) / 10^d
}

# Comandos Condicionais

odd <- function(x) {
  if (x %% 2 == 1) {
    TRUE
  } else {
    FALSE
  }
}

odd <- function(x) {
  ifelse(x %% 2 == 1, TRUE, FALSE)
}

odd <- function(x) {
  x %% 2 == 1
}

myabs <- function(a) {
  if (a < 0) {
    -a
  } else {
    a
  }
}

bhaskara <- function(a = 0, b = 0, c = 0) {
  if (a != 0) {
    delta <- as.complex(b^2 - 4*a*c)
    if (delta != 0) {
      c((-b + sqrt(delta)) / (2 * a), (-b - sqrt(delta)) / (2 * a))
    } else {
      -b / (2 * a)
    }
  } else {
    -c / b
  }
}

# Comandos de Repeticao

printVector <- function(v) {
  i <- 1
  while(i <= length(v)) {
    print(v[i])
    i <- i + 1
  }
}

printVector <- function(v) {
  for (i in v) {
    print(i)
  }
}

mysum <-function(...) {
  x <- 0
  for (i in c(...)) {
    x <- x + i
  }
  return(x)
}

mylength <- function(vector) {
  k <- 0
  for (i in vector) {
    k <- k + 1
  }
  return(k)
}

mylength <- function(...) {
  k <- 0
  for (i in c(...)) {
    k <- k + 1
  }
  return(k)
}

multlength <- function(...) {
  result <- NULL
  for (i in list(...)) {
    result <- c(result, length(i))
  }
  return(result)
}

multlength(25:30, matrix(1:12, 3, 4), rnorm(5), sample(10))

mymin <- function(...) {
  min <- Inf
  for (i in c(...)) {
    if (i < min) {
      min <- i
    }
  }
  return(min)
}

mymin <- function(...) {
  min <- Inf
  if (missing(...)) {
    warning("missing arguments; returning Inf")
  } else {
    for (i in c(...)) {
      if (i < min) {
        min <- i
      }
    }
  }
  return(min)
}

subset <- function(set1, set2) {
  all(is.element(set1, set2))
}

subset <- function(set1, set2) {
  for (elem in set1) {
    if (!is.element(elem, set2)) {
      return(FALSE)
    }
  }
  return(TRUE)
}

index <- function(vector, element) {
  n <- length(vector)
  result <- NULL
  for (i in 1:n) {
    if (vector[i] == element) {
      result <- c(result, i)
    }
  }
  result
}

# lapply

L <- list(a = 25:30, 
          b = matrix(1:6, 2, 3), 
          c = rnorm(5), 
          d = sample(10))
lapply(L, mean)

lapply(2:4, runif)

lapply(2:4, runif, min = 0, max = 10)

lapply(datasets::faithful, max)

lapply(faithful, min)

lapply(faithful, function(x) {max(x) - min(x)})

# sapply

sapply(L, mean)

sapply(L, range)

lapply(faithful, range)

lapply(faithful, quantile)

sapply(faithful, quantile)

# apply

m <- matrix(sample(12), nrow = 3, ncol = 4); m

apply(m, 1, min)

apply(m, 2, max)

m <- matrix(sample(8))
dim(m) <- c(2, 2, 2); m

apply(m, 1, mean)

apply(m[ , , 1], 1, mean)

apply(m, 2, mean)

apply(m[ , , 2], 2, mean)

total <- sum(datasets::HairEyeColor); total

apply(HairEyeColor, 1, sum) / total
apply(HairEyeColor, 2, sum) / total
apply(HairEyeColor, 3, sum) / total

# mapply

mapply(rep, 1:3, 5:3)
mapply("^", 1:6, 2:3)

tipo1 <- sample(10:99, 10); tipo1
tipo2 <- sample(10:99, 10); tipo2
tipo3 <- sample(10:99, 10); tipo3
tipo4 <- sample(10:99, 10); tipo4

mapply(min, tipo1, tipo2, tipo3, tipo4)
mapply(max, tipo1, tipo2, tipo3, tipo4)

# tapply

x <- c(rnorm(100), runif(100), sample(100))
f <- gl(n = 3, k = 100, 
        labels = c("norm", "unif", "sample"))
tapply(x, f, range)

s <- sample(length(x))
df <- data.frame(x[s], f[s])
tapply(df$x, df$f, range)

tapply(datasets::mtcars$mpg,
       datasets::mtcars$cyl, mean)
tapply(mtcars$qsec, mtcars$cyl, mean)
tapply(mtcars$hp, mtcars$vs, mean)

qfactor <- function(vector) {
  q <- quantile(vector)
  result <- NULL
  for (i in vector)
    if (i <= q["25%"])
      result <- c(result, "q1")
  else if (i <= q["50%"])
    result <- c(result, "q2")
  else if (i <= q["75%"])
    result <- c(result, "q3")
  else result <- c(result, "q4")
  return(as.factor(result))
}

tapply(mtcars$mpg, qfactor(mtcars$hp), mean)
tapply(mtcars$mpg, qfactor(mtcars$qsec), max)
tapply(mtcars$hp, qfactor(mtcars$mpg), mean)

tapply(datasets::Loblolly$height,
       datasets::Loblolly$age, min)
tapply(Loblolly$height, Loblolly$age, mean)
tapply(Loblolly$height, Loblolly$age, max)

tapply(datasets::airquality$Temp,
       datasets::airquality$Month, mean)
tapply(airquality$Solar.R, airquality$Month, mean, na.rm = TRUE)
tapply(airquality$Ozone, airquality$Month, mean, na.rm = TRUE)

tapply(datasets::iris$Petal.Length,
       datasets::iris$Species, mean)
tapply(iris$Petal.Width, iris$Species, mean)
tapply(iris$Petal.Length / iris$Petal.Width, iris$Species, mean)

tapply(iris$Petal.Length, iris$Species, summary)
simplify2array(tapply(iris$Petal.Length, iris$Species, summary))