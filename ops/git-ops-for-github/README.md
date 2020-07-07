# CMS/OEDA/DASG GitOps for GitHub

This project uses [Terraform](https://www.terraform.io/) and [GitHub Actions](https://help.github.com/en/actions)
  to manage the GitHub repositories, teams, etc. used by
  the Data and Analytics Strategy Group (DASG) at
  the [Centers for Medicare and Medicaid Services' (CMS)](https://cms.gov/)
  Office of Enterprise Data and Analytics (OEDA).

## Development Environment

### Tooling

You'll need the following to be installed and configured in order to work on this little project:

* [tfenv](https://github.com/tfutils/tfenv): Terraform version manager inspired by rbenv.
* [aws-mfa](https://github.com/broamski/aws-mfa): Makes it easy to manage your AWS SDK Security Credentials
    when Multi-Factor Authentication (MFA) is enforced on your AWS account

### How to Run Locally

This project is designed to be run via GitHub Actions, rather than by developers or by Jenkins or whatnot.
That said, developers are encouraged to run `terraform plan` when working on it,
  in order to evaluate any changes they're making.

In order to do that, developers will need two credentials:

* AWS Credentials: An AWS S3 bucket and DynamooDB are used as the [Terraform Backend](https://www.terraform.io/docs/backends/types/).
  Thus, AWS credentials with access to those resources will need to be configured in
    the local [`~/.aws/credentials`](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html) file.
  Developers may also need to set the `AWS_PROFILE` environment variable, if the credentials are not currently active.
  In addition, developers will need to use the `aws-mfa` utility listed above to generate and activate temporary credentials from STS.
* GitHub Credentials: A
    [GitHub personal access token](https://help.github.com/en/github/authenticating-to-github/creating-a-personal-access-token-for-the-command-line)
    will be needed in order to run the Terraform providers used here.

Once you have the pre-req software and credentials, run the following to compute a plan:

    $ cd ops/git-ops-for-github/
    $ terraform plan -var github_token=<GITHUB_PERSONAL_ACCESS_TOKEN>
