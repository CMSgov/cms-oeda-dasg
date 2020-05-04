# User Story: Dogfood First

As a DASG techie,
  I need a workflow and tooling for declaratively managing the permissions of the <https://github.com/CMSgov/cms-oeda-dasg> repository,
  so that we can turn around requests for GitHub access more quickly and safely.

## Details

This obviously applies to more than just this repository,
  but I'm starting here to keep things simple.
Hopefully, a solution can be created that scales well to a larger number of repositories, teams, etc.

Ideally, things will end up structured such that:

* The repository is publicly readable.
* DASG government employees have "Admin" permissions on the repository.
* DASG contractor staff have "Maintain" permissions on the repository.
* Other CMS employees/contractors (e.g. USDSers) can also be given "Write" permissions on the repository.

Best as I've been able to manage things so far,
  accomplishing this requires multiple teams:

* A `-admins` team for DASG government employees, with "Admin" permissions.
* A `-staff` team for DASG contractor staff, with "Maintain" permissions.
* A `-partners` team for other CMS employees/contractors, with "Write" permissions.

That's a bit complex to manage (particularly by hand),
  but seems to work.

## Acceptance Criteria

1. Accomplish all of the above "things will end up structured such that..." items via Terraform.
2. The Terraform project can be successfully run locally by Karl and one other DASGer.
3. Local Terraform state is used (just for now, for simplicity), but not stored in the GitHub repository.
    * When having another DASGer run it, the state file will have to be transferred out of band.
4. The `terraform plan` does not change any settings on the repository in undesired ways.
    * Two options: A) it ignores a bunch of settings and leaves them untouched, or B) the project allows those settings to be managed correctly.
