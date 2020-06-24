# RFC Proposal: Git Ops for GitHub
[RFC Proposal]: #rfc-proposal

* RFC Proposal ID: `0000-git-ops-for-github` (fill me in with a unique ident)
* Start Date: 2020-05-18
* RFC PR: [CMSgov/cms-oeda-dasg#3](https://github.com/CMSgov/cms-oeda-dasg/pull/3)
* JIRA Ticket(s):
    * N/A: see the epic & stories in the PR

<!--
Write a brief summary here: a one paragraph explanation of the feature.
Try to structure it like an "elevator pitch":
  it should provide readers with a high-level understanding of the goals and proposed solution.

Please note: many of the other sections below will not be needed for some proposals;
  don't waste time writing responses that don't deliver real value.
For any such not-needed section, simply write in "N/A".
-->

Making changes to our GitHub configurations and permissions should be as simple and fast
  as pushing a couple lines of text through our normal Pull Request process.

This can be achieved by handling this resource similarly to how we handle all of our other managed infrastructure:
  with Terraform and a solid Continuous Deployment solution (GitHub Actions, in this case)..

## Table of Contents
[Table of Contents]: #table-of-contents

* [RFC Proposal](#rfc-proposal)
* [Table of Contents](#table-of-contents)
* [Motivation](#motivation)
* [Proposed Solution](#proposed-solution)
    * [Proposed Solution: Detailed Design](#proposed-solution-detailed-design)
    * [Proposed Solution: Unresolved Questions](#proposed-solution-unresolved-questions)
    * [Proposed Solution: Drawbacks](#proposed-solution-drawbacks)
    * [Proposed Solution: Notable Alternatives](#proposed-solution-notable-alternatives)
* [Prior Art](#prior-art)
* [Future Possibilities](#future-possibilities)
* [Addendums](#addendums)

## Motivation
[Motivation]: #motivation

<!--
Why are we doing this?
What use cases does it support?
What is the expected outcome?
Why is now the appropriate time to address this?
-->

Why are we doing this?
For all the same reasons that we manage our AWS infrastructure with code,
  we should be managing our GitHub infrastructure as code:

* It would make the configuration more stable & reliable;
    don't have to worry as much about manual changes causing problems.
* It would provide a simpler security audit trail:
    just look at the Git history.
* It's more self-service for engineering-minded staff;
    no need to file Help Desk tickets and wait around.

What use cases would it support?

* As a tech lead, I need to onbard a new engineer to our program's GitHub repository, so that they can start delivering code.
* As a security officer, I need to ensure that all of our GitHub repositories are properly secured, so that we can keep our infrastructure safe.
* As a DASG govvie, I need our GitHub management process to be more self-service, so that it doesn't require so much of my time.

What is the expected outcome?
If this initiative is successful, I would expect that:

* Staff will be onboarded to GitHub faster than before.
* Fewer instances of "configuration drift" will be found for our GitHub repositories.

Why do this now?
DASG's GitHub usage has grown to a point where the management of it is starting to become both a burden and a concern.


## Proposed Solution
[Proposed Solution]: #proposed-solution

<!--
Explain the proposal as if it was already implemented and shipped,
  and you were just explaining it to another developer or user.
That generally means:

* Introducing new named concepts.
* Identifying and address each of the various audiences who might (or should) care about this proposal.
  Explaining the solution using concepts and terms relevant to eaach of them.
  Explaining how they should _think_ about the solution; detailing the impact as concretely as possible.
  Possible audiences might include:
    * Internal team: engineers, operators, product management, business owners.
    * External users: engineers, operators, product management, business owners, end users.
* Explaining the feature largely in terms of examples.
    * Screencasts are often a good idea.
        * On Mac OS X, you can use the built-in Quicktime Player or the built-in Mac OS X Mojave (and up) feature.
    * Diagrams are often a good idea.
        * Keep it simple! Use something like <http://asciiflow.com/>.
* As part of implementing this proposal, will any documentation updates be needed, e.g. changelogs, Confluence pages, etc.?
  If so, draft them now! Include the draft as a subsection or addendum.
-->

"GitOps" is a term of art for a practice that's been around for a bit now:
  managing infrastructure in declarative code,
  with automation that no-touch deploys approved changes to those declarations.
For developers, this makes ops work more tractable:
  infrastructure all boils down to code managed in Git.
For security officers, this provides some peace of mind:
  there's much less opportunity for configuration drift and other manual mischief.
For everyone, it provides clarity:
  by "writing down" the infrastructure definitions where everyone can see them,
  everyone has a better chance to understand the infrastructure.

The solution is intended to cover the following use cases:

1. Onboarding/offboarding a GitHub user (with CMSgov membership) from/to one of our existing programs.
1. Auditing the history of changes made to our programs' GitHub settings and permissions.
1. Changing the settings for an existing GitHub repository, such as the branch protection.
1. Onboarding a new program/contract to GitHub, including the repository and teams.

For example, one might imagine a declaration for a Git repository that looks like this (in pseudo-code):

```
var awesome_team:
- Kendra Kool
- John Jammer
- Susan Super

github_repo "awesome_project":
  description: 'A really awesome project.'
  read_access: everyone
  write_access: awesome_team
```

If you wanted to add "Luke Lucky" to the project,
  it's pretty clear what you'd need to change.


### Proposed Solution: Detailed Design
[Proposed Solution: Detailed Design]: #proposed-solution-detailed-design

<!--
This is the technical portion of the RFC.
Explain the design in sufficient detail that:

* Its interaction with other features is clear.
* It is reasonably clear how the feature would be implemented.
* Corner cases are dissected by example.

The section should return to the examples given in the previous section,
  and explain more fully how the detailed proposal makes those examples work.
-->

The example above is vaguely YAML-ish,
  which is certainly an option,
  but perhaps more fancy than is needed.
Regular-old, boring Terraform definitions are also quite readable!

At the highest level possible, here's the design proposal:

* Add a project to this repository
    that uses [Terraform](https://www.terraform.io/)
    (specifically, the [Terraform GitHub Provider](https://www.terraform.io/docs/providers/github/index.html))
    and is run automatically via [GitHub Actions](https://github.com/actions).
* Build it out for the DASG GitHub repositories,
    with an eye towards how it might eventually also be used by and handed off
    to the wider [CMSgov organization in GitHub](https://github.com/CMSgov).

For a more detailed design proposal,
  please see the proof of concept accompanying this RFC
  in the [CMSgov/cms-oeda-dasg#3](https://github.com/CMSgov/cms-oeda-dasg/pull/3) pull request.


### Proposed Solution: Unresolved Questions
[Proposed Solution: Unresolved Questions]: #proposed-solution-unresolved-questions

<!--
Collect a list of action items to be resolved or officially deferred before this RFC is submitted for final comment, including:

* What parts of the design do you expect to resolve through the RFC process before this gets merged?
* What parts of the design do you expect to resolve through the implementation of this feature before stabilization?
* What related issues do you consider out of scope for this RFC that could be addressed in the future independently of the solution that comes out of this RFC?
-->

N/A


### Proposed Solution: Drawbacks
[Proposed Solution: Drawbacks]: #proposed-solution-drawbacks

<!--
Why should we *not* do this?
-->

N/A


### Proposed Solution: Notable Alternatives
[Proposed Solution: Notable Alternatives]: #proposed-solution-notable-alternatives

<!--
* Why is this design the best in the space of possible designs?
* What other designs have been considered and what is the rationale for not choosing them?
* What is the impact of not doing this?
-->

N/A


## Prior Art
[Prior Art]: #prior-art

<!--
Discuss prior art, both the good and the bad, in relation to this proposal.
A few examples of what this can include are:

* For feature proposals:
  Does this feature exist in other similar-ish APIs and what experience have their community had?
* For architecture proposals:
  Is this architecture used by other CMS or fedgov systems and what experience have they had?
* For process proposals:
  Is this process used by other CMS or fedgov programs and what experience have they had?
* For other teams:
  What lessons can we learn from what other communities have done here?
* Papers and other references:
  Are there any published papers or great posts that discuss this?
  If you have some relevant papers to refer to, this can serve as a more detailed theoretical background.

This section is intended to encourage you as an author to think about the lessons from other languages, provide readers of your RFC with a fuller picture.
If there is no prior art, that is fine - your ideas are interesting to us whether they are brand new or if it is an adaptation from other languages.

Note that while precedent set by other programs is some motivation, it does not on its own motivate an RFC.
Please also take into consideration that we (and the government in general) sometimes intentionally diverge from common "best practices".
-->

This isn't a particularly novel approach: many organizations are using GitOps.
In fact, _we're_ already using GitOps for most of our programs' AWS infrastructure.


## Future Possibilities
[Future Possibilities]: #future-possibilities

<!--
Think about what the natural extension and evolution of your proposal would be and how it would affect the language and project as a whole in a holistic way.
Try to use this section as a tool to more fully consider all possible interactions with the project and language in your proposal.
Also consider how the this all fits into the roadmap for the project and of the relevant sub-team.

This is also a good place to "dump ideas", if they are out of scope for the RFC you are writing but otherwise related.

If you have tried and cannot think of any future possibilities, you may simply state that you cannot think of anything.

Note that having something written down in the future-possibilities section is not a reason to accept the current or a future RFC;
  such notes should be in the section on motivation or rationale in this or subsequent RFCs.
The section merely provides additional information.
-->

There's lots of room to grow this beyond the initial planned implementation, including:

* Using it to manage membership in the [CMSgov GitHub organization](https://github.com/CMSgov/) for DASG staff.
* Using it tp manage other groups & programs in the wider [CMSgov GitHub organization](https://github.com/CMSgov/),
    if OC is interested in adopting it.


## Addendums
[Addendums]: #addendums

The following addendums are required reading before voting on this proposal:

* (none at this time)

Please note that some of these addendums may be encrypted. If you are unable to decrypt the files, you are not authorized to vote on this proposal.
