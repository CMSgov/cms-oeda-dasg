##
# Defines the variables required by the cms_program module,
# which represents a CMS program's GitHub reposoitories, teams, etc..
##

variable "team_prefix" {
  type        = string
  description = "The name prefix that will be used for all teams associated with this program. For example, given a prefix of 'foo', teams like 'foo-admins', 'foo-staff', etc. will be created."
}

variable "repositories" {
  type        = list(string)
  description = "The list of repository/project names to be associated with this CMS program."
}

variable "admins" {
  type        = list(string)
  description = "The list of GitHub users to be associated with this program's admin team."
}

variable "staff" {
  type        = list(string)
  description = "The list of GitHub users to be associated with this program's staff team."
}

variable "partners" {
  type        = list(string)
  description = "The list of GitHub users to be associated with this program's partners team."
}
