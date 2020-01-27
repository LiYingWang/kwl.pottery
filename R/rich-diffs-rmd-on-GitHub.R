# How to see rich diffs of two commits of a single R Markdown document on a GitHub repo (on the master branch only)

# Edit this to use the repo that has the file you want to inspect
gh_account_and_repo <- "LiYingWang/kwl.pottery"

# Edit this to use the single file that you want to inspect
# start the path here from the top level of the github repo
gh_file_path <- "analysis/paper/paper.Rmd"

# The next line opens a web page to see the commit history
# of this file so we can
# copy the SHA ids to use in the next step. Look for the
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
commit_1_sha <- "8249ffc832acfb4839dfb9e5f838d45b82ca0063" # a recent commit
commit_2_sha <- "a05cad1b678a31c9def1860cbceeba4cbfb98577" # an earlier commit

# Don't change this
gh_raw <- "https://raw.githubusercontent.com"

# run these lines...
later_commit <- file.path(gh_raw, gh_account_and_repo, commit_1_sha, gh_file_path)
earlier_commit <- file.path(gh_raw, gh_account_and_repo, commit_2_sha, gh_file_path)

# run these lines to view the rich diff:
diffobj::diffFile(earlier_commit,
                  later_commit,
                  mode = "sidebyside")
@benmarwick
