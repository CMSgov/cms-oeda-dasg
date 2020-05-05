# Epic: Improve Workflow for Management of DASG's GitHub Repositories

**For** DASG federal and contractor staff
  **who** need elevated permissions to DASG's GitHub repositories
  **the** `git-ops-for-github` project
  **is a** Terraform project that gets applied via GitHub Actions
  **that** is simple to manage and easy to audit.
**Unlike** the current "find and ask an admin" option,
  **our solution** is more self-service, faster, and more secure.
**Unlike** the other "file a Help Desk ticket" option,
  **our solution** is more self-service, faster, and more secure.
 

## Business Outcome Hypothesis

* This process will result in faster onboarding of staff to projects.
* This process will require less time from DASG federal staff.


## Leading Indicators

* Once fully deployed, there will be few instances where Terraform is either:
    * Overwriting manually applied state.
    * Throwing errors due to state being out of sync.


## Non-Functional Requirements

* This project must comply with all DASG security processes and Engineering Standards.
* Once approved, changes should be applied in less than 15 minutes.


## Possible Stories / Work Breakdown

* <./0001-proof-of-concept.md>
* <./0003-remote-state.md>
* <./0004-github-actions-terraform-lint-and-plan.md>
* <./0005-github-actions-terraform-apply.md>
