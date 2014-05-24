---
layout: post
title:  "Useful tech terms: Yak Shaving, Technical Debt, Bikeshedding"
date:   2014-05-24 14:08:00
---

I love good jargon. Let's define _jargon_ as "specialized terms and
phrases used for efficient communication between colleagues".

(To be clear, when jargon is used as exclusionary weaponry, that's not good
jargon. That's shitty behavior, and it's stupid. Let's shove that aside for
today with a simple "don't do that".)

One of my favorite things to do is learn jargon from other fields. Outside of
the simple joy of exploring specialized knowledge, the lingustic shortcuts of
a community can reveal a lot about its values.

In the past year I've had the pleasure and honor of mentoring a few novice
software developers. It's been cool to talk with folks who are starting with a
blank slate, because it has forced me to rebuild from scratch the terms and
idioms that are useful in communicating about software development.

The barrier of having to re-explain each one serves as a nice filter and has
left me with a relatively short list of tech jargon that I've found regularly
makes the cut.

Here's the first batch!

----

## Yak Shaving

__Definition__: The process of performing a series of nested tasks to
accomplish a goal, each of which seems necessary in context but becomes less
and less linked to the original goal.

__Examples__: Sometimes Yak Shaving happens in day-to-day work:

 > _Manager_: "I thought you were working on the login feature! What are you
 > doing fiddling with that database config for a DB we don't even use?!"
 >
 > ---
 >
 > _Dev_: "Well, I was working on the user login feature, so I started evaluating
 > libraries. This library is the best, but it only supports
 > Postgres. So now I'm trying to setup Postgres to see if its worth it, but
 > switching over broke indexing. So now I'm trying to learn how Postgres
 > indexes work so... that... a user can log into our system...?"

Sometimes Yak Shaving is thinly disguised procrastination:

 > _Co-worker_: "I thought you were writing a post on tech terms, what are
 > you doing reading the unicode handbook?"
 >
 > ---
 >
 > _Author_: "I _started_ the post, but then I realized I was going to use a
 > lot of quotes and I wanted the typography on the quotes to be correct, and
 > so I started trying to learn about the proper names for the characters
 > involved and how they are represented on the web. That system is derived
 > from Unicode - the larger standard, and I wanted to understand...

__Why it's a useful phrase__: It happens _all the freaking time_ when
working on software! It's important to be on the lookout for yak shaving,
because oftentimes there is a "dependent subtask" jump in the chain that wasn't
necessary.

Keeping an eye out for this natural tendency to drift away from the original
task at hand is a valuable skill for the effective software developer.

__For more:__ [The Java
Glossary's](http://mindprod.com/jgloss/yakshaving.html) entry has detailed
definitions and etymology, and [Scott Hanselman's
post](http://www.hanselman.com/blog/YakShavingDefinedIllGetThatDoneAsSoonAsIShaveThisYak.aspx)
on the phrase includes a great accompanying visual.

----

## Technical Debt

__Definition__: The accumulated negative technical results of shortcuts and
trade-offs taken in the past on a project, which place a drag on the cost of
current and future development on the project.

__Examples__: Technical Debt can be subtle:

 > _Shortcut_: We needed a quick tweak to this library, so we vendored the source and
 > made the change inline.
 >
 > ---
 >
 > _Debt_: Until we make a pull request upstream, we cannot upgrade the library
 > to get bugfixes or features we need.

It can also be obvious:

 > _Shortcut_: Our VP wanted this feature out the door like yesterday, so we
 > didn't have time to add tests around it.
 >
 > ---
 >
 > _Debt_: The next change we need to make to this feature, we won't have tests
 > telling us whether or not we've broken things.

__Why it's a useful phrase__: The financial metaphor is good at communicating
the "get something today by giving up something tomorrow" nature of decisions
like these. And the metaphor holds in many different contexts. Technical Debt
needs to be "paid down" by a team lest it grow out of control and put the
project underwater.

It's worth noting that the introduction Technical Debt is not always the Wrong
Decision. There are times when the trade offs are known and worth taking at the
time. It's all about awareness - the worst Technical Debt is the stuff you
don't know about until it bites you in the ass. So teams should do their best
to identify it early, and schedule the work necessary to pay it down.

__For more__: [Wikipedia's Technical Debt article](
http://en.wikipedia.org/wiki/Technical_debt) provides a good jumping off point.

----

## Bikeshedding

__Definition__: Spending disproportionate time and energy spent over an
insignificant or unimportant detail of a larger concern.

The term comes from an illustrative anecdote of a committee discussing a plan
to build a nuclear power plant. In their meeting they spend the majority of
their time arging over the color to paint the bikeshed in the back, because
that was the part of the plan that everybody could understand.

__Examples__: The phrase is normally used in a derogatory fashion:

> "Did you hear the VPs spending like 10 minutes arguing whether or not the app
> would use responsive design or adaptive design? It was clear that they were
> both just trying to prove to the group that they understood those terms.
> Total bikeshedding!"

It's best when used in a constructive manner:

> "Alright folks, I think we might be bikeshedding here. We can't agree
> on the right font until we put together examples, so let's wait for that."

__Why it's a useful phrase__: Precisely because it's not uncommon for this to
happen to groups of people. It's natural for everybody to want to participate
in decisionmaking, which means it's also natural for the decisions that are
understandable to more people have a tendency to be discussed more.

It's so very difficult to do meetings well - so every tool we have to help us
is incredibly valuable. This is one of them.

__For more__: Start with [Parkinson's law of
triviality](http://en.wikipedia.org/wiki/Parkinson's_law_of_triviality),
the formalized name for the concept.

----

That's all for today. On deck for next time: Cargo Culting, Code Smell, Rubber
Ducking, and maybe more! Feel free to suggest some for me to add. I'm hoping
over time to build up a relatively small list of unique phrases with high
utility.
