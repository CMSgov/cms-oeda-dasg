# User Story: Store Terraform State in a Remote Backend

As an engineer working on the `git-ops-for-github` project,
  I need the Terraform state to be securely stored remotely in a backend that supports locking,
  so that I can collaborate with others on this project.


## Details

See the <../design/0002-terraform-backend.md> design document.


## Acceptance Criteria

1. A Security Impact Assessment for this must be drafted and approved.
2. The state must be stored remotely in a backend that supports locking.
3. The state must only be accessible with appropriate AWS credentials.
