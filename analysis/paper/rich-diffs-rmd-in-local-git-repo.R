# How to see rich diffs of two commits of a single R Markdown document in a local Git repo

# https://github.com/lorenzwalthert/gitsum
library("gitsum")
library("tidyverse")

# To browse the commits locally, open an RStudio
# project that is using Git version control, then ...

# Set the path within the project to the Rmd file
# in the project that we want to compare versions of
file_path <- "analysis/paper/paper.Rmd"

# Make a data frame that stores the git commit history,
# one row per commit
init_gitsum()
tbl_out <- parse_log_detailed() %>%
  select(date, author_name, message, hash)

# View this dataframe to pick the specific commits to compare
View(tbl_out)

# choose two commits to compare, here I've got the most recent
# one (the last row of the table), and the one immediately before that
i <- nrow(tbl_out) - 30
j <- nrow(tbl_out) - 31

# consrtruct the terminal commants using the SHA of the commits we want to
# compare, and the file path
git_show_str_1 <- str_glue('git show ', tbl_out[i, ]$hash, ":", file_path)
git_show_str_2 <- str_glue('git show ', tbl_out[j, ]$hash, ":", file_path)

# get the contents of the file at each commit and
# store in a vector
earlier_commit <- system(git_show_str_2, intern = TRUE)
later_commit <- system(git_show_str_1, intern = TRUE)

# compute differences and visualise
diffobj::diffChr(earlier_commit,
                 later_commit,
                 mode = "sidebyside")
