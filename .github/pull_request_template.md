<!--
You've got a Pull Request you want to submit? Awesome!
This PR template is here to help ensure you're setup for success:
  please fill it out to help ensure that your PR is complete and ready for approval.
-->

**JIRA Ticket:**
[SOMEPROJECT-42](https://jira.cms.gov/browse/SOMEPROJECT-42)

**User Story or Bug Summary:**
<!-- Please copy-paste the brief user story or bug description that this PR is intended to address. -->


### What Does This PR Do?

<!--
Add detailed discussion of changes here
This is likely a summary, or the complete contents, of your commit messages.
-->


### What Should Reviewers Watch For?

If you're reviewing this PR, please check these things, in particular:

* TODO

<!--
Add some items to the list above, or remove the entire section if it doesn't apply for some reason.

Common items include:
* Is this likely to address the goals expressed in the user story?
* Are any additional documentation updates needed?
* Are there any unhandled and/or untested edge cases you can think of?
* Is user input properly sanitized & handled?
* Does this make any backwards-incompatible changes that might break end user clients?
* Can you find any bugs if you run the code locally and test it manually?
-->


### What Security Implications Does This PR Have?

Submitters should complete the following questionnaire:

* If the answer to any of the questions below is **Yes**, then here's a link to the associated Security Impact Assessment: N/A.
    * Does this PR add any new software dependencies? **Yes** or **No**.
    * Does this PR modify or invalidate any of our security controls? **Yes** or **No**.
    * Does this PR store or transmit data that was not stored or transmitted before? **Yes** or **No**.
* If the answer to any of the questions below is **Yes**, then please add @StewGoin as a reviewer, and note that this PR should not be merged unless/until he also approves it.
    * Do you think this PR requires additional review of its security implications for other reasons? **Yes** or **No**.


### What Needs to Be Merged and Deployed Before this PR?

This PR cannot be either merged or deployed until the following pre-requisite changes have been fully deployed:

* CMSgov/some_repo#42

<!--
Add some items to the list above, or remove the entire section if it doesn't apply.

Common items include:
* Database migrations (which should always go out in PRs by themselves, to reduce risk).
* New features in external dependencies (e.g. BFD).
-->


### Submitter Checklist

Before requesting final review, I've gone through and verified that this PR complies with the following requirements:

* [ ] I've verified that this PR is as small as it can reasonably be, in order to:
    1. Ensure that any problems it causes have a small "blast radius".
    2. Ensure that it'll be easier to rollback if that becomes necessary.
    3. Ease the burden on reviewers.
* [ ] I've verified that the individual commits in this PR all:
    1. Reasonably explain the "what" and "why" of the changes.
    2. Leverage JIRA's [smart commits](https://confluence.atlassian.com/jirasoftwarecloud/processing-issues-with-smart-commits-788960027.html) to reference the JIRA ticket that they're associated with. For example, aim for commit messages like this (note also [the 50/72 formatting](https://stackoverflow.com/q/2290016) used here):
        
        ```
        Added the whizbang to the doodad.

        The new whizbang should really simplify things for our whoosit users.
        It was a bit tricky to get it into the doodad, but we decided that the
        flipwhee pattern was the best approach for now. Might want to revisit
        that in the future if it ends up being too hard to maintain.

        SOMEPROJECT-42
        ```
        
* [ ] I've verified that this PR includes all required documentation changes, including `README` updates and changelog / release notes entries.
* [ ] I've verified that all new and modified code is appropriately commented, such that the what and why of its design would be reasonably clear to engineers, preferably ones unfamiliar with the project.
* [ ] I've verified that all tech debt and/or shortcomings introduced by this PR is detailed in `TODO` and/or `FIXME` comments, which include a JIRA ticket ID for any items that require urgent attention.
* [ ] I've requested review from at least two other engineers on this project (at least one of whom is a senior engineer or owns the relevant component(s) here).
* [ ] I've requested review from any relevant engineers on other projects (e.g. BFD, SLS, etc.).
* [ ] I've verified that this PR and its changes comply with all other policies in the [DASG Engineering Standards](../policies/engineering_standards.md) and have specifically called out any/all deviations in this PR.
