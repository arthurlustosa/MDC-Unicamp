library(corpus)
library(dplyr)
library(udpipe)
library(tidytext)


process_data <- function(path,regex_sep, name, convertcase = FALSE, remove_stopwords = FALSE) {
    # Carregando o texto dos documentos
    lines <- readLines(path, encoding = "UTF-8")
    # Obtendo o nome dos documento
    doc <- grep(regex_sep, lines)
    start <- c(1, doc+1) # + 1 para pular o titulo
    end <- c(doc - 1, length(lines))
    text <- mapply(function(s, e) paste(lines[s:e], collapse = "\n"), start, end)

    # Removendo espacos brancos em sequencia
    text <- trimws(text)
    # Obtendo os titulos dos documento e 
    title <- sub(regex_sep, name, lines[doc])
    # Removendo espacos brancos em sequencia
    title <- trimws(title)
    print(title)
    # Descartando a linha inicial
    text <- text[-1]
    # Vinculando titulo do documento com texto do documento
    data <- corpus_frame(title, text)

    # Obtendo tokens por documento
    doc_tokens <- unnest_tokens(data, word, text, to_lower=convertcase)

    # Removendo stop_words
    if (remove_stopwords) {
        doc_tokens <- doc_tokens %>% filter(!word %in% stop_words$word)
    }
    return(doc_tokens)
}

