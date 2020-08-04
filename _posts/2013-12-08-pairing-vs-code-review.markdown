---
title:  "Pairing vs. Code Review: Comparing Developer Cultures"
slug:   pairing-vs-code-review
date:   2013-12-08 15:00:00
---

Between `last_job` and `current_job` I transitioned from a dev culture of pair programming to one of peer code review. It's been an interesting experience adjusting to the differences, and I thought I'd write down some of what I've noticed.

You can find plenty of articles with titles of the format `/The (benefits|dangers) of (pair programming|code review)/` where the author has a clear persuasive agenda. I've found that both strategies can be effective, with some definite tradeoffs between the two. I'd like to try and provide some relatively balanced discussion of those tradeoffs.

## Definition of terms

First of all, let me set the stage properly, since the phrases "pair programming" and "code review" can each be interpreted in drastically different ways.

When I talk about a __pair programming culture__ I'm referring to a team that does nearly 100% pairing. This means two developers are assigned a single task, and work on a mirrored screen with two sets of input. One developer drives while the other navigates. Both developers are engaged in the process of code construction. The day-to-day experience of programming is that of a day-long conversation with your pair. Once a pair finishes a commit - that code goes straight to master without further review.

Now __code review culture__ may bring up thoughts of teams in conference rooms staring at code on projectors--I know it did for me at first. That's not at all what I'm talking about here, thank gawd. Here I'm referring to a heavily automated and tool-assisted peer code review process. Using mechanisms like Gerrit Patchsets or GitHub Pull Requests, developers generate code individually and push diffs for review by at least one other person on their team. Line-by-line comments are used for questions and comments around code style and functionality. Once a diff is approved by the appropriate people, it lands in master.

## Prerequisites for success

There are a few nonnegotiables that are common across both of these paradigms.

 * __Solid continuous integration__ - builds that run on every commit
 * __Talented core developers__ - these folks helps promote quality and drive the architecture of the codebase
 * __Agreement on the importance of code quality__ - the team and the overall company both recognize the value of maintaining a high-quality codebase
 * __Iterative self-organization__ - the team is willing to collectively evaluate their process and course-correct on a regular basis

In my experience these things are all necessary no matter what process you decide to use.

## The joys of pairing

Here's the thing about pair programming. It's an incredible experience. Everybody should do it at least sometimes. You can find other writing out there fully extolling the virtues of the practice, but let me see if I can summarize a bit here.

There's a __high bandwidth communication conduit__ that forms between pairs that can be utilized for all sorts of benefits. You can __train junior developers__ easily by giving them an experienced pair. Core developers can __spread best practices and knowledge silos across the team__ quickly. New tools and techniques are shared naturally across the team. __Everybody gets better together__.

Two people pairing can __balance the natural daily ebbs and flows of energy__ for each other. Sometimes these oscillations are complementary, where one pair picks up steam when the other wanes, helping them both maintain a more steady focus. Other times the curves coincide, which can make for a periods of incredible productivity, with breaks in between where each developer has a buddy to goof off with.

The constant presence of a peer __generates motivation for self-improvement__; everybody wants to perform well when being watched by someone they respect. __Tactical decisions are made more easily__ and with better results: two people are much less likely to take shortcuts lightly, and a conversation naturally happens about any trade-off that comes up.

The concept of __collective code ownership__ is easy to come by, since it's rare that a single person is responsible for a given line of code. This makes for a healthier view of failures as those of the team and not of individuals.

## Pairing is sensitive to team balance

While when it goes right, pairing is a beautiful thing, it can also be a delicate beast to maintain. The effectiveness of pair programming is extremely __sensitive to a team's balance__ across several axes. It's true that pairing is a great way to teach junior folk, but __over-diluting core talent__ across pairs can kill both productivity and morale. When a team takes on too many juniors at once, this can happen quickly, and pair assignments become a game of talent Tetris.

The same balance problem can happen with __knowledge silos__. It's actually a very similar pattern - pairing is great for breaking down silos, however once a silo or isolated expertise is present, it makes choosing proper pair assignments and rotating difficult.

A team needs to be constantly on the lookout for problems like this and correct for them early. Knowledge imbalance and talent imbalance can compound themselves and lead to a team that's underwater and unable to rotate effectively, further exacerbating the issues.

## Pairing culture can breed monoculture

Pair programming is a rather intensive practice that does not lend itself to every personality type. This means that by choosing this practice, a team is __limiting the hiring pool__ to other people willing to spend their days in constant collaboration. For teams that pair, this is a conscious tradeoff made to gain the benefits of pairing.

The evaluation criteria for hiring someone onto a team that pair programs are also cast differently. Each developer must ask themselves, "would I be willing to sit next to this person every day and work on code together?" These questions are important for maintaining a healthy team, but they also flirt dangerously with a each team member's unconscious fears and biases. It's very easy to decide not to hire someone with a drastically different personality or different background under the auspices of "bad culture fit".

Pairing promotes a monoculture in selective tactical categories (tools, practices, techniques) to the benefit of the team, but this same mentality make the team more susceptible to sliding into a general monoculture that excludes outliers. While it's already an uphill battle to promote diversity in the tech industry, inside a pair programming culture it's even easier to end up with a team of young white dudes wearing plaid without realizing it.

## Pairing does not lend itself to [hammock problems]

Pairing is great for consistent forward progress and the sharing of certain kinds of knowledge, but it can be detrimental to the process of making decisions that require more deep thought or creativity. These sorts of decisions often come up when tackling the larger problems of system design and architecture.

Especially when paired with a more junior developer, a core developer attempting to work out a code design issue will __naturally be biased towards action__ and not "wasting the time" of their pair. This can result in a design that's inferior to one encountered by a developer without the pressure of a waiting pair.

[hammock problems]: https://www.youtube.com/watch?v=f84n5oFoZBc

## Sometimes you end up needing code review anyways

When a team starts to experience some of the problems outlined above, it's not uncommon to also start to realize that the core developers don't fully trust every pair's code. Maybe there's a relatively junior developer pairing with an incredibly junior developer. The trust-by-default paradigm can break down, which means that __core developers end up feeling the need to review code before it goes out into production anyways__, thereby eliminating some of the benefits gained about collective code ownership and trust that pairing is supposed to provide.

## The joys of code review

At first, I thought moving to a code review culture might be totally devastating for me, given all the wonderful experiences I had gained through pairing. But it turned out that the initial experience was incredibly freeing.

With code reviews, __nobody sees your code until you're ready__ for them to see it. Since every developer knows there will inevitably be peer eyeballs on their code, the positive __motivating pressure to perform well__ is still there.

In contrast to pairing, there are no barriers to taking on __deep thought problems__. Theres nothing stopping a developer from taking an hour to hole up in a room with a whiteboard, take a walk, Google for background information, print and read an academic paper, or do any number of tasks that would be difficult to pull off with a pair. This makes for a __larger toolbox of problem solving techniques__ that can benefit the overall process of code construction.

On a team that does code reviews, __you are defined by your code__, since the primary point of professional contact with your peers is now over the code you've written. This lends itself to a __wider pool of personality types__ that can be effective in an environment like this. You can easily imagine a person you'd rather not hang out with, but whose code is rock solid and you're glad to have on your team.

__Code reviews are asynchronous__, which provides a host of benefits. First of all it means it's much easier for a team to adopt a __flexible schedule__ for its members. If a certain person is more productive from 5<sup>am</sup> to noon, that's perfectly fine. If there's another developer that is going to night school and prefers to work late, no problem. You can also __strategically distribute code reviews__, ensuring that more experienced developers always touch certain kinds of code reviews, which provides an extra measure of quality control and protection against bugs landing in production.

I've also found that performing code reviews __forces you to think about your values__ more-so than pairing does. There are plenty of details you can get away with in a pairing situation by citing personal preference or "just being OCD about this", but you really have to decide if your point is defensible when considering whether or not to recommend someone change something in a code review. I've managed to solidify (and let go of) a couple of my own beliefs thanks to this feature. I hope to write more about this in the future.

## Code reviews don't keep you company

The most striking difference between a pairing culture and a code review culture is the fact that in the day-to-day process of code construction you are __ultimately alone__. For some personality types this might be regarded as a clear benefit, but for me it was a pretty jarring shift.

Of course there are plenty of ways to mitigate this, like by hanging out with your coworkers in other capacities. Having experienced these two very different flavors of social interaction I'm curious to read the 37signals remote work argument and perhaps respond to it here.

## Privacy vs self-control

While there's still motivation to perform well for your peers, on an hour-by-hour basis __you are the only one who knows what you're doing__.  Yes you can go for a walk that may lead you to a Perfect Design for your current problem, but it's also __so easy to fuck around__ and zone out and flip back and forth between windows and check your email and check the chat room and basically do anything other than make progress.

This is almost precisely the opposite of pairing's bias towards forward progress; solo development provides __absolutely no requirement to make progress__ in a given minute, hour, or day. __It's all up to you__. And that can be terrifying.

## Code reviews can stack up

While there's definitely a more flexible schedule granted by the asynchronous nature of code reviews, it's also possible for __bottlenecks__ to form, where work cannot be completed for lack of review, or where a core developer can't get any actual coding done because she has a ton of code reviews to complete.

It's also a fact that the __bandwidth of communication is lower__ in a code review - it's orders of magnitude faster to tell someone something as they're typing a line of code rather than to leave a comment explaining what's wrong after the code has been completed and pushed for review. This can be mitigated slightly by encouraging a practice of "work in progress" commits for intermediate review. But it's inevitable that inexperienced developers will spend more time going in the wrong direction with only code reviews as a course correction mechanism.

## "Eh, seems fine to me"

Whereas pairing encourages conversation as the point of construction, code reviews almost always take place __after something has been built__ which makes for a natural __momentum towards merging__ regardless of quality. The activation energy required for a comment followed by a revision and re-push and re-review is quite high, so this makes reviewers likely to be more lenient on code quality issues.

## So who wins?

So I hope I've shown that there's plenty that's good and plenty that's not so good about both pair programming and code review as code quality practices. Ultimately it's most important to have a team that is pragmatic about their particular choice of practices, because that will allow them to be honest about what's not working. And once you admit the weaknesses in your approach, you can start taking action to improve.

So if you don't have one already, __find a team that cares about code and about process__ and you can try to solve some of these problems together.

(I plan to write more about strategies for mitigating some of the specific problems I raised above in future posts.)
