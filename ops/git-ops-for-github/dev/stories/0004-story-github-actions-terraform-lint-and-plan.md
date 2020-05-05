# User Story: Run Terraform Lints and `terraform plan` via GitHub Actions

As a DASG federal employee,
  I need Terraform lints and `terraform plan` to be run
    for the `git-ops-for-github` project
    on every push and/or Pull Request (PR)
    via GitHub Actions,
  so that the quality of every change can be assured automagically.


## Details

Since this project lives in a repository with a bunch of other stuff,
  it'd be ideal if this was only run for changes in this project's subtree.
