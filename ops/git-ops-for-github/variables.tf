##
# Defines the variables required by the git-ops-for-github project,
# which configures CMS programs' GitHub reposoitories, teams, etc..
##

variable "github_token" {
  type        = string
  description = "The GitHub 'Personal Access Token' to use to configure everything. Must have appropriate permissions in the CMSgov organization."
}
