---
title: "Smoke and Mirrors: The Primitives of High Availability"
date: 2015-05-21
header: 
  teaser: "https://speakerd.s3.amazonaws.com/presentations/a3c9bd9d5d8d4156a1e19919fd47b01d/preview_slide_0.jpg"
---

This was a talk I gave at a few different venues in 2015. It includes a whirlwind tour of how the internet works and a bunch of base level concepts in making services that are resilient to failure.

## Abstract

Many of the greatest achievements in the history of computers are based on lies, or rather, the strategic sets of lies we generally call "abstraction". Operating systems lie to programs about hardware, multitasking systems lie to users about parallelism, Ruby lies to us about how easy it is to tell a CPU what to do... the list goes on and on.

One of the primary "strategic lies" of the internet is the presentation of each service as though it were a discrete, cohesive entity. When we use GitHub, we think of it as just "GitHub", not a swarm of networked computers. This lie gives us the opportunity to build high availability applications: apps designed to never go down.

Let's take a tour through the amazing stack of tools that helps us construct high availability applications. We'll review some of the incredible technology underlying the internet: things like TCP, BGP, and DNS. Then we'll talk about some basic primitives and how they combine into useful patterns. I hope you'll leave with not only a renewed appreciation for some of the core technical innovations of the internet, but also some practical working knowledge of how to go about building and running a fault tolerant system.

## Slides

{% include slides id="a3c9bd9d5d8d4156a1e19919fd47b01d" %}

## Video

{% include video id="128553393" provider="vimeo" %}

