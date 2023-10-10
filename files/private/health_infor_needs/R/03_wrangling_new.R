################################################################################
#
#' Re-Evaluating Health Information Needs in Africa during COVID-19
#' 
###############################################################################
#
# DATA WRANGLING/CLEANING
#
################################################################################

twitter_data <- readRDS("Data/coTreat_tweets.rds")


# Nearest neighbours
# ReadMore ::
nearest_neighbors <- function(df, token) {
  df %>%
    widely(
      ~ {
        y <- .[rep(token, nrow(.)), ]
        res <- rowSums(. * y) / 
          (sqrt(rowSums(. ^ 2)) * sqrt(sum(.[token, ] ^ 2)))
        
        matrix(res, ncol = 1, dimnames = list(x = names(res)))
      },
      sort = TRUE
    )(item1, dimension, value) %>%
    select(-item2)
}

tidy_complaints <- twitter_data %>%
                    select(tweet_id, text) %>%
                    unnest_tokens(word, text) %>%
                    add_count(word) %>%
                    filter(n >= 50) %>%
                    select(-n)

nested_words <- tidy_complaints %>%
                nest(words = c(word))

nested_words

slide_windows <- function(tbl, window_size) {
  skipgrams <- slider::slide(
    tbl, 
    ~.x, 
    .after = window_size - 1, 
    .step = 1, 
    .complete = TRUE
  )
  
  safe_mutate <- safely(mutate)
  
  out <- map2(skipgrams,
              1:length(skipgrams),
              ~ safe_mutate(.x, window_id = .y))
  
  out %>%
    transpose() %>%
    pluck("result") %>%
    compact() %>%
    bind_rows()
}

tidy_pmi <- nested_words %>%
            mutate(words = future_map(words, slide_windows, 4L)) %>%
            unnest(words) %>%
            unite(window_id, tweet_id, window_id) %>%
            pairwise_pmi(word, window_id)
tidy_pmi

###
tidy_word_vectors <- tidy_pmi %>%
  widely_svd(
    item1, item2, pmi,
    nv = 100, maxit = 1000
  )

tidy_word_vectors
tweets_neigh <- tidy_word_vectors %>%
                nearest_neighbors("cure")

tweets_neigh

## We should read more about ML methods for text here:
## https://smltar.com/mlregression.html