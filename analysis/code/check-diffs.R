
# How to see rich diffs of two commits of a single R Markdown document in a local Git repo

# To browse the commits locally

# https://github.com/lorenzwalthert/gitsum
# devtools::install_github("lorenzwalthert/gitsum")
library("gitsum")
library("tidyverse")

# Set the path within the project to the Rmd file that we want to compare versions of
file_path <- "analysis/paper/paper.Rmd"

# We make a data frame that store the git commit history
init_gitsum()
tbl_out <- parse_log_detailed() %>%
  select(date, author_name, message, hash)

# View this dataframe to pick the specific commits to compare
# View(tbl_out)

# choose two commits to compare, here I've got the most recent
# one (the last row of the table), and the one 2-3 before that
i <- nrow(tbl_out) -1
j <- nrow(tbl_out) -4

# construct the terminal commands using the SHA of the commits we want to
# compare, and the file path
git_show_str_1 <- str_glue('git show ', tbl_out[i, ]$hash, ":", file_path)
git_show_str_2 <- str_glue('git show ', tbl_out[j, ]$hash, ":", file_path)

# get the contents of the file at each commit and
# store in a vector
earlier_commit <- system(git_show_str_2, intern = TRUE)
later_commit <- system(git_show_str_1, intern = TRUE)

# compute differences in visualise
diffobj::diffChr(earlier_commit,
                  later_commit,
                  mode = "sidebyside")

### --------------------------------------------------------------------
# How to see rich diffs of two commits of a single R Markdown document on a GitHub repo

# Edit this to use the repo that has the file you want to inspect
gh_account_and_repo <- "LiYingWang/kwl.pottery"

# Edit this to use the single file that you want to inspect
# start the path here from the top level of the github repo
gh_file_path <- "analysis/paper/paper.Rmd"

# open this web page to see the commit history so we can
# copy the SHA ids to use in the next step, look for the
# little clipboard icon to click on to copy the full SHA,
# and past them in the step below
browseURL(file.path(
  "https://github.com",
  gh_account_and_repo,
  "commits/master",
  gh_file_path
))

# Edit these to get the full SHA for the commits you want to compare, get
# the full SHA from the GitHub webpage that was opened in the previous step
commit_1_sha <- "69c2f88ce043bba0866d0cd482811ac03e294d25" # a recent commit
commit_2_sha <- "a2f75ee72be696d073431e54c1863c632b75d4d4" # an earlier commit

# Don't change this
gh_raw <- "https://raw.githubusercontent.com"

# run these lines...
later_commit <- file.path(gh_raw, gh_account_and_repo, commit_1_sha, gh_file_path)
earlier_commit <- file.path(gh_raw, gh_account_and_repo, commit_2_sha, gh_file_path)

# run these lines to view the rich diff:
diffobj::diffFile(earlier_commit,
         later_commit,
         mode = "sidebyside")
