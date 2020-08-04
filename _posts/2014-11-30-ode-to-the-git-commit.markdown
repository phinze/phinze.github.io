---
title: "An Ode to the Git Commit"
slug:   ode-to-the-git-commmit
date:   2014-11-30 00:00:00
---

Trivial to perform. Instantaneous to complete. Immensely powerful. Deeply
meaningful.

## A perfect identifier

Every time you commit, a SHA1 hash is generated. A single character change in
your commit generates an entirely different SHA1. Moreso than any other kind of
reference, your commit's hash deeply represents your changes. It's so much more
than just a unique reference - it represents your change because it was
generated _by_ your change.

The contents of your changes are only one part of the input to the hash
function; a reference to the parent commit is also included. This means that
the same diff applied to any other point in the repository's history generates
a different commit hash. In other words, your commit's hash is not only
representative of the contents of your changes, but also of precisely the point
in history that they were made.

Cherish those 40 character hexidecimal numbers, for they are the perfect
embodiment of your accomplishments.

## An indelible mark

Because each commit is inextricably linked to its ancestors, a chain of commits
forms a durable tapestry that is passed down unaltered to everyone who
interacts with it. In all but the most exceptional of circumstances, you can
rest assured that every commit you push to `master` will live on for the
lifetime of the repository.

And each commit is preserved perfectly, in its entirety, ready to be called up
at any time. There's no deterioration, no loss of fidelity over time. Your
entry into history is permanent.

What a joy to be able to make such immense historical impact with such
quotidian ease! We are creating works that remember themselves and everyone who
ever touched them.

## A message to the future

As if the above were not enough, we're given an amazing opportunity with every
commit: an invitation to include a message.

The ritual of making a commit includes a moment when the committer is presented
with a blank space and asked simply to write. It is customary to describe the
changes being made and explain the motivation for making them, but no
constraints are imposed on this endeavor.

When this is done thoughtfully, it imbues every commit with a snapshot of the
state of mind of the author at the time of authorship.

So honor this incredible opportunity by approaching it with an appreciation of
the power of the pen you hold.

## Put it together

Imagine a skyscraper where every brick and beam has written on it the name of
the person who laid it, and under every name is a message - a window into that
mind at that time.  Imagine that we could instantly call up this information
for any piece of the building with no effort at all.

Picture a city built this way - what a treasure trove of anthropological
knowledge! What an incredible asset to our culture!

## So here's the thing

_We have this and we use it every day to build our software._
