# Design Record: How to Structure the Directory Layout for this Project?

This is my first TF greenfield project, so I didn't have a lot of experience with this.
However, I've heard enough chatter and read enough articles about it to know that it's a matter of some debate.
TF's docs have a page detailing some of the common options:
  [Terraform Docs: Repository Structure](https://www.terraform.io/docs/cloud/workspaces/repo-structure.html).

Apparently, Terraform provides a "workspaces" mechanism for managing multiple environments.
However, best as I can tell from some brief research, almost no one uses that mechanism.

Best as I can tell, most folks instead opt for the one-directory-per-environment approach:
  [Terraform Docs: Repository Structure: Directories](https://www.terraform.io/docs/cloud/workspaces/repo-structure.html#directories).

After thinking about that for a bit I realized that, in this case, it doesn't really matter:
  this project doesn't _have_ multiple environments.
There aren't "development" or "production: repositories or teams; there are just repositories and teams.

Problem solved!
