# Engineering Standards

This document details the standards for code process and quality that are mandated for all DASG projects.

This document uses the conventions recommended in [IETF's RFC 2119](https://tools.ietf.org/html/rfc2119).
Items marked "SHALL" are mandatory; these items are absolute requirements.
Items marked "SHOULD" indicate that there may exist valid reasons in particular circumstances to ignore a particular item,
  but the full implications must be understood and carefully weighed before choosing a different course.


## Table of Contents
[Table of Contents]: #table-of-contents

* [Table of Contents](#table-of-contents)
* [Goals of These Standards](#goals-of-these-standards)
    * [Goal: Reduce Duplicate Work](#goal-reduce-duplicate-work)
    * [Goal: Increase Collaboration](#goal-increase-collaboration)
    * [Goal: Improve Quality](#goal-improve-quality)
* [Deviations From These Standards](#deviation-from-these-standards)
* [Standards](#standards)
    * [Human-Centered APIs](#human-centered-apis)
        * [User Stories](#user-stories)
        * [Epics](#epics)
        * [FHIR Compliance](#fhir-compliance)
    * [Change Control](#change-control)
        * [Pull Request Templates](#pull-request-templates)
        * [Database Migrations](#database-migrations)


## Goals of These Standards
[Goals of These Standards]: #goals-of-these-standards

DASG is currently experiencing an incredible/terrifying amount of growth.
Depending on how you count, 2019 saw our number of programs double.
2020 and 2021 may very well see similar amounts of growth,
  and in order to responsibly handle that growth,
  DASG needs to start being more intentional about its engineering and delivery processes.


### Goal: Reduce Duplicate Work
[Goal: Reduce Duplicate Work]: #goal-reduce-duplicate-work

2019's growth came with some costs,
  primarily a large amount of duplicated effort across our programs —
  technology that _could_ have been built once and then re-used,
  but was instead separately implemented multiple times.
_One_ of the reasons for that duplication was how different each DASG program's engineering processes, stacks, etc. are,
  which makes it somewhat prohibitively difficult for our teams to share technology with one another.
Many of the items in these standards are intended to remove barriers to such technology sharing/reuse.


### Goal: Increase Collaboration
[Goal: Increase Collaboration]: #goal-increase-collaboration

Our engineering staff and time will always be limited.
We need to invest heavily in ensuring that, whenever appropriate,
  engineers can easily collaborate across programs.
This will help:

* Reduce future duplicate work and help remediate the existing duplication we have.
* Ensure that DASG is using its limited engineering resources as effectively as possible.

Many barriers to such collaboration across programs are due to the friction of learning and employing
  the different processes' and tooling currently used by each of our programs.
Many of the items in these standards are intended to reduce the friction for such collaboration.


### Goal: Improve Quality
[Goal: Improve Quality]: #goal-improve-quality

Another lesson from 2019 — and in particular some of the incidents we had —
  is that delivering/achieving high quality engineering is _hard_.
In particular, it's most often hard in somewhat boring ways:

* Simple, easily understood code is much better than "fancy" code.
* Code reviews are important, but only effective if they're structured and budgeted for appropriately.
* Try to prevent defects (definitely!),
  but invest heavily in ensuring that, once a defect is identified,
  it's as painless as possible to triage and resolve it.

Many of the items in these standards are intended to nudge our engineering process in ways that will improve quality.


## Deviations From These Standards
[Deviations From These Standards]: #deviation-from-these-standards

The expectation is that all DASG programs will _eventually_ comply with the letter and spirit of these standards.
Any new programs SHOULD comply with these standards from "Day One".
However, it's expected that existing DASG programs may need a significant amount of time to come into compliance.

That said, if you're reading through these items and find yourself thinking,
  "there's no way this makes sense for our program,"
  then perhaps you're right!
If that happens, please reach out and start a conversation.


## Standards
[Standards]: #standards


### Human-Centered APIs
[Human-Centered APIs]: #human-centered-apis

It's very easy to fall into the trap of technology for technology's sake.
These items attempt to nudge DASG's engineers away from that
  to instead focus on the business outcomes that need to be achieved
  and the end users who will be impacted by their work.


#### User Stories
[User Stories]: #user-stories

All pull requests SHALL be associated with a user story that explains the _what_, _who_, and _why_ for the change.

* Motivations
    * This sets our engineering teams up for success: without this foundational connection to their end users,
      it's difficult/impossible for them to ensure that they're delivering the right thing.
* Evaluation
    * This requirement SHALL be included in the PR templates used by each program.
      See TODO, below.


#### Epics
[Epics]: #epics

All user stories SHALL be associated with an epic that has been formally approved by the CMS/DASG Product Owner.

* Motivations
    * Epics detail the outcomes that CMS is attempting to deliver for the business and end users.
      As described in [User Stories](#user-stories), understanding this context will enable engineers to
        help ensure that they're delivering "outcomes", rather than just "output".
* Evaluation
    * After each sprint, program staff SHALL run Jira queries to find all stories with and without an associated epic.
      The counts for each sprint should be reported in the program's public Slack channel, tagging the Product Owner for their attention.
    * The Jira queries would look something like these:
        * `project = BLUEBUTTON AND Sprint = 11635 AND issuetype = Story AND "Epic Link" != EMPTY`
        * `project = BLUEBUTTON AND Sprint = 11635 AND issuetype = Story AND "Epic Link" = EMPTY`


#### FHIR Compliance
[FHIR Compliance]: #fhir-compliance

All APIs SHALL use FHIR to represent and present their healthcare-related data.

* Motivations
    * CMS is interested in supporting and helping lead the development of the FHIR standards,
        as a means to improve healthcare industry interoperability.
    * One user community/persona for our APIs is the community of developers who we need to build applications against them.
      We can make their lives much simpler by ensuring that they can use standard FHIR tooling to consume our APIs.
* Evaluation
    * All APIs SHALL verify their compliance with the FHIR specification in an automated way.
      There are many possible options for this:
        * Validating outgoing responses are compliant as part of the response code.
        * Use of external server testing products, such as <https://projectcrucible.org/>, <http://touchstone.com/>, etc.


### Change Control
[Change Control]: #change-control

GitHub pull requests (PRs) are our primary unit of engineering change.
Accordingly, they are also our means for ensuring quality, standards compliance, and engineering knowledge transfer.


#### Pull Request Templates
[Pull Request Templates]: #pull-request-templates

All GitHub repositories SHALL use a Pull Request template that is the same as, or derived from,
  the one used by this repository:
  [.github/PULL_REQUEST_TEMPLATE/pull_request_template.md](../.github/PULL_REQUEST_TEMPLATE/pull_request_template.md).

* Motivations
    * This PR template attempts to accomplish several things:
        * Ensure that all PRs properly reference a Jira ticket and user story.
        * Ensure that any changes impacting security follow all required processes.
        * Ensure that all PRs receive appropriate review and approval.
        * Ensure that new technical debt and other known shortcomings are properly acknowledged and addressed.
        * Ensure that the PRs' individual commits are properly structured.
* Evaluation
    * DASG technical staff will work with program staff to roll out this template to all existing repositories.
    * Future changes to repositories' PR template SHALL treat the DASG technical staff as required reviewers.


#### Database Migrations
[Database Migrations]: #database-migrations

All database migrations SHALL:

1. Be backwards-compatible with their applications previously deployed version.
2. Be forwards-compatible with at least the next-to-be-deployed version of their applications.
3. Be deployed by themselves, without any application changes.

Note: In concert, these requirements mean that database migrations may
  need to be spread out across three separate pull requests and deployments.
The first PR might prepare the application to be compatible with the current DB schema and the next one.
The second PR might deploy the new DB schema.
The final PR might remove the application's code for supporting the earlier DB schema.

All applications and/or deployment tooling SHALL not contain code that might automatically roll back
  database migrations in production environments.

* Motivations
    * Database migrations are inherently risky operations.
    * Any problems with a database migration can greatly _magnify_ the difficulties in resolving bugs, incidents, etc.
    * Automatic rollback of database migrations is too dangerous of a practice; it will eventually result in loss of production data.
    * Incidentally, these requirements also point towards other best practices that programs would be wise to adopt:
        1. Database schema changes should be heavily supported by automation, e.g. [Flyway](https://flywaydb.org/).
        2. Database schema changes should usually be additive and incremental, rarely destructive.
        3. Applications should be tolerant of unexpected database schemas.
* Evaluation
    * This evaluation will be self-evaluated and -reported by each program's engineering lead,
      to DASG's technical support staff.
