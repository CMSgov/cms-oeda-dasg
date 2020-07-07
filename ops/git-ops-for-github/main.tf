# Configure the GitHub Provider
provider "github" {
  token        = var.github_token
  organization = "CMSgov"
}

##
# Define the CMS programs (teams, repos, etc.) to be managed.
##

# The OEDA/DASG (govvie) teams and repos.
module "cms_program_oeda_dasg" {
  source       = "./modules/cms_program"

  team_prefix  = "oeda-dasg"
  repositories = [
    "cms-oeda-dasg"
  ]

  admins       = [
    "karlmdavis"
  ]
  staff        = [
    "RickHawesUSDS"
  ]
  partners     = []

  # TODO: This is commented out (and unimplemented) for now, until I'm more confident it's a good idea. It'd
  # likely require this Terraform plan to be applied on a scheduled basis, rather than only when it's
  # updated, which adds a decent chunk of complexity that I'm not thrilled about.
  #partner_teams = [
  #  module.cms_program_oeda_dasg.cms_program.bfd.team_staff
  #]
}
