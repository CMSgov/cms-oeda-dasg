##
# Each instance of this module represents a separate CMS program in GitHub,
# including its teams, repositories, etc.
##

# Setup all of the repositories.
resource "github_repository" "repos" {
  for_each = toset(var.repositories)
  name     = each.value
}

# Setup the admin team.
resource "github_team" "admins" {
  name = "${var.team_prefix}-admins"
}
resource "github_team_membership" "admins_maintainers" {
  for_each  = toset(var.admins)
  team_id  = github_team.admins.id
  username = each.value
  role     = "maintainer"
}

# Setup the staff team.
resource "github_team" "staff" {
  name = "${var.team_prefix}-staff"
}
resource "github_team_membership" "staff_maintainers" {
  for_each = toset(var.admins)
  team_id  = github_team.staff.id
  username = each.value
  role     = "maintainer"
}
resource "github_team_membership" "staff_members" {
  for_each = toset(var.staff)
  team_id  = github_team.staff.id
  username = each.value
  role     = "member"
}

# Setup the partners team.
resource "github_team" "partners" {
  name = "${var.team_prefix}-partners"
}
resource "github_team_membership" "partners_maintainers" {
  for_each = toset(var.admins)
  team_id  = github_team.partners.id
  username = each.value
  role     = "maintainer"
}
resource "github_team_membership" "partners_members" {
  for_each = toset(var.partners)
  team_id  = github_team.partners.id
  username = each.value
  role     = "member"
}

# Setup the repository permissions for each team.
resource "github_team_repository" "repos_admins" {
  for_each   = toset(var.repositories)
  team_id    = github_team.admins.id
  repository = each.value
  permission = "admin"
}
resource "github_team_repository" "repos_staff" {
  for_each   = toset(var.repositories)
  team_id    = github_team.staff.id
  repository = each.value
  permission = "maintain"
}
resource "github_team_repository" "repos_partners" {
  for_each   = toset(var.repositories)
  team_id    = github_team.partners.id
  repository = each.value
  permission = "push" # Corresponds to "Write" in the GitHub UI.
}
