# User Story: Run `terraform apply` via GitHub Actions

As a DASG federal employee,
  I need `terraform apply` to be run
    for the `git-ops-for-github` project
    on every push to `master`
    via GitHub Actions,
  so that we can be assured that those changes are applied and are applied consistently.


## Details

The plan is to use GitHub Actions for this:
  running `terraform apply` when changes to this branch of the repo
  are merged to the repository's `master` branch.

Since this project lives in a repository with a bunch of other stuff,
  it'd be ideal if this was only run for changes in this project's subtree.
