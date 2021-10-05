# packages needed for this script
pkgs <- c("readr", "cowsay", "here", "tidyverse", "glue")
purrr::walk(pkgs, require, character.only = TRUE)

# silently source all functions using the purrr::walk function
fns <- fs::dir_ls(here("scripts/functions"))
walk(fns, ~source(.x))

# define the url where quotes are located
# get pieces to make link
repo <- "JakubPetriska/060958fd744ca34f099e947cd080b540"
csv <- "raw/963b5a9355f04741239407320ac973a6096cd7b6/quotes.csv"
url <- glue("https://gist.githubusercontent.com/{repo}/{csv}")  

# use all of our functions
f_read_data(url) %>% 
  f_preprocess_data() %>% 
  f_inspire_me()
