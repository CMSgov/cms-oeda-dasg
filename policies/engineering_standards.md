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
