# Design Decision: Where to Store Terraform State?

This project doesn't really have a natural "home" in AWS like many of the other DASG projects.
At the same time, it absolutely does need to be built in a way that allows for multiple developers to work on it at the same time.
Accordingly, it needs to use a remote backend for Terraform.

The simplest option was thus chosen:
  create a separate AWS S3 bucket and DynamoDB for this project's use in
  the [CMSgov/beneficiary-fhir-data](https://github.com/CMSgov/beneficiary-fhir-data) project's AWS account.

A Security Impact Assessment (SIA) for that approach was created and approved here:
  TODO.
