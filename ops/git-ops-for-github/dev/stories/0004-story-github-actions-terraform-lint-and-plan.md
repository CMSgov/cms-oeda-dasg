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

## Acceptance Criteria

1. This needs to run via a GitHub bot account, not as a normal user.
   Reference: <https://stackoverflow.com/a/29177936>.
2. It'd be nice if the `terraform plan` output landed in a comment on the PR,
     when there's a PR.
