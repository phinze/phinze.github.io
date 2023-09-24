---
title: "Terraform is Changing the World"
date: 2018-10-23
---

Delivered as HashiConf US 2018 Day 2 Keynote.

## Abstract

If you've never had an intuitive understanding of the core design philosophy of Terraform, this keynote will help you fully understand what Terraform is trying to accomplish.

In this keynote, Paul Hinze, the director of Terraform at HashiCorp, takes a step back and looks at Terraform from a couple angles to give you a more intuitive understanding of the Terraform design philosophy. Some of the key concepts discussed include:

 * Provisioning
 * Declarative to imperative mapping
 * Idempotent and convergent
 * Infrastructure as code
 * Workflows not technologies
 * Producer-consumer models

## Video

{% include video id="eeh7twkUhSg" provider="youtube" %}


## Transcript

Hey, everybody. So, yesterday was announcement mode; today is fun, because it’s ideas mode. I love ideas mode. I’m Paul Hinze. I’m the director of Terraform at HashiCorp.

I skipped past the title slide, can we go back to the title slide? The title’s very good. “Terraform Is Changing the World.” This is probably the best part of the talk, this title. Because, spend some time with it, and you’re like, “Oh, yeah, there’s some layers there.” Really, once I came up with the title I felt like I should be done. I was like, “This is good. We could just stand here for 20 minutes and just appreciate it.”

### What Terraform does

I was at a family reunion recently. And at family reunions, like at parties, you get to practice the varying levels of describing what it is that you do. In this industry it’s very difficult; you have to feel out your audience. The idea is, “How much do I wanna talk right now? And then how much do you actually want to know?” So you have to feel out the audience and decide how much you want to say. My first litmus test here is just to say, “Computers! I do computers.” I don’t know what your first one is. But this is my go-to, computers. And I gauge the reaction and say, “Do you wanna know any more?”

But I have another one. This next slide is a confessional. I’ve used this phrase in parties and stuff and I thought it was good, and that I’m sorry for. It’s not good or funny. But I have said this in real life, and that is, “Somebody has to cloud the cloud!” This is a phrase that I have used, in real life in social situations, as sort of a, “Yeah, you know, this is the stuff that I do.” I’m sorry about that, and I’m no longer saying it. I’m never doing that again.

So what I tend to do here is I sort of work down a level and try to figure out what people actually wanna know about what I do. So I can say, “Software.” I’ll put in the cloud, “Cloud software.” “Internet infrastructure software.” And then working my way up to what I would say in this crowd, which is, “Cloud infrastructure automation.”

So at this family reunion, I had a distant aunt who was totally coming with me on this journey. I was like, “Computers!” And she was like, “What kind?” And then, “Software.” It turns out she coordinates a construction crew for a living and so she got the infrastructure metaphor. She was like, “Oh, infrastructure, great.” So, by the end of our conversation she was like, “So, all these big tech companies have these pipes, like digital pipes, and then when they leak, they have to call you.” I was like, “I mean, pretty much. Yeah, that’s pretty close.”

But the exercise of trying to describe what I do in that context got me thinking about this overall idea of taking your complicated idea and needing to break it down and describe it in different ways to different audiences. This is something we have to do all the time, and especially with complicated ideas.

And that is the thing that we are doing all the time in Terraform. Terraform has a lot of complicated ideas behind it. It has a lot of angles by which you can approach it. We’re always trying to tell the Terraform story in ways that different people can understand it.

So that’s what I want to do with you today: Go through a little bit of an exercise and figure out just what we can say about what does Terraform do from a couple a different layers, from a couple of different angles.

And my goal here is essentially to give you a little bit more of an intuitive understanding of the ideas and concepts surrounding Terraform and underlying Terraform. And as a meta-goal, I hope you’ll see the benefit of this exercise in breaking down a complicated idea, because I think it’s a really useful practice.

So, let’s see what we can do.

### Terraform as a provisioning tool

Computers! There you go; this is where we start. Terraform and computers. That’s as good a place to start as any. There’s really not much information you get out of that. I guess, if you didn’t know at all what Terraform was, “computers” is a good place to start. But let’s talk about a more useful place to start: provisioning. Terraform is a provisioning tool. What does “provisioning” mean? Well, it means making stuff, right? Where there was once nothing, now there is something.

So this is a good start, as a concept. Terraform is provisioning tool. That is the thing it does. What’s nice about the high levels is that it can be very true but not tell you all of the information, right? So, in the context of provisioning, we tell the story about how computers have become clouds now. You know this story very well, right? Provisioning used to be opening a box and putting a server in a rack, and now provisioning is an API call.

So, Terraform does provisioning. Does Terraform provision cloud resources? Yep, it does do that. But what does it mean that Terraform also can provision a GitHub team and a Google Calendar event? It can do both of these things. If you’re not aware about this, it can absolutely do both of these things. So, it’s a little bit more complicated than just simple cloud infrastructure provisioning, although it is that.

Let’s go another layer deeper and get to a layer that I like to talk about in Terraform. Terraform is a declarative-to-imperative mapping engine. There’s a mouthful! What does that mean? On the left-hand side, you can see we’ve got a Terraform declaration, and on the right-hand side we’ve got equivalent API commands. I think it’s important to have an intuitive understanding of this sort of declarative-to-imperative mapping, the paradigm shift, that Terraform does, because it helps click Terraform for individuals who really wanna explore it more and use it.

Let’s figure this out a little bit. Let’s try to make sense of this. So, APIs and GUIs: Generally speaking, when you are interacting with either a GUI or an API, you have an idea in your head about what you want to complete. You have a concept that you are attempting to map into a set of commands, clicks, or API calls to create something that you have in your head.

And so, if you look at the bottom here, the idea of, “Here’s a service in AWS.” You have a load balance service in AWS in your head, but you have to make imperative commands in order to tell AWS what to do. And Terraform, as a declarative-to-imperative mapping engine, allows you to describe the thing that is in your head directly into a configuration file, and it is the thing that takes care of the declarative-to-imperative mapping. This is just a really simple way of describing one of the key foundational concepts behind Terraform.

Let’s put that on a stack. Terraform is a provisioning tool. It’s a declarative-to-imperative mapping engine. What else?

Now that we have declarative-to-imperative, we can add on this concept of idempotent and convergent. Another mouthful, but once you put it into context, you can see how it makes sense. The concept of idempotent is you can take one operation and repeat it and get the same results, and from that you get convergence. You can repeat Terraform applies, given the same config, and you will get the same results. And this allows Terraform to manage drift and anything that might have changed in the resources under management. And so we get these fancy words that describe properties of what Terraform can do.

That goes in our stack, too. Terraform is a provisioning tool that is a declarative-to-imperative mapping engine giving idempotent and convergent properties of its operations. That’s a really complicated sentence, right? Now we’ve stacked up all of these ideas, so I hope they fit together a little bit better in your head.

### Mirroring app dev

So now, we have enough of the foundational concepts to say, “infrastructure as code” and understand a little bit better what it means. What is “infrastructure as code” referencing here? There’s plenty more to infrastructure as code. It borrows a ton of concepts, and I’m not gonna go into the details of infrastructure as code here. Suffice it to say, infrastructure as code is a strategy. My definition is, “It’s a strategy for managing complexity in which we borrow the practices, tools, tricks, and processes from application development as they capture complexity as code, and we borrow them in managing infrastructure, as infrastructure increasingly becomes software.” That’s all I’ll say about that.

But the idea here is that infrastructure as code fits on a stack. It’s a set of concepts that all relate to each other, all describing in increasing detail what goes into Terraform.

So there’s a stack of ideas that underlie Terraform. Let’s change angles now. Let’s go sideways. Let’s talk about sociotechnical systems. This is cool. I would go on and on about this, but I promise I won’t. But the sociotechnical system is a field of study in a body of knowledge that has existed since the World War II era, in the study of coal miners and their processes of mining coal.

The idea is very simple. It’s in the name. The idea is that it is important when optimizing a goal-oriented group, like a set of application developers trying to produce an application, a company trying to make revenue, any system that involves people and technology. If you are trying to optimize it, you can’t optimize one or the other. You have to think about them together. You have to think about the people and the ’puters.

In our context, this is really closely related to one of HashiCorp’s core tenets: Workflow is not technologies.

We invert the natural tendency of us as engineers. In our tenet, we’re automatically gonna think about the technologies. So in the tenet we say, “Make sure we’re thinking about workflows.” This is how we lean into making sure we’re considering sociotechnical systems and that we’re optimizing the whole story. From this, you get pragmatism. You get, “How do we build tools that people actually use?” You get user empathy. You get user experience.

So this is an important concept.

With that in mind, let’s talk about some workflows that have to do with Terraform. This isn’t Terraform. This is just a pretty basic application development cycle, about as basic as it gets, right? Code, test it, deploy it. Certainly you do more, right? More code, test more code, deploy it. Very familiar. Very familiar also to Terraform. Here’s Terraform’s: write, plan, apply. This is intentional. This is infrastructure as code in action. The core workflow that surrounds Terraform is very similar to an application development workflow.

This is the way that we’ve designed Terraform. We’re paralleling all of the ideas that exist in application management, because it helps us solve problems. This is the simplest expression of the Terraform workflow, and it quickly gets more complicated, just like provisioning is the simplest expression of Terraform’s concept as a tool, and it can get more complicated.

### The core Terraform workflow

Let’s see how that gets more complicated. We call this the core Terraform workflow. I’ll use that in our stack as we go down.

So here’s a wrinkle: It’s really common to write and plan in a cycle, before you apply. As you’re writing to Terraform configuration, you’re running Plan over and over again. Before you decide to say, “OK, this looks good. This is what I want to do.” So write, plan, write, plan.

This is one of the things that Remote Plan, as a new feature, gets back. You’ll see this gets more complicated as we add in layers. We really like this write-plan cycle because it’s tight; it’s a tight feedback loop. And it’s one that we got back in Terraform Enterprise with Remote Plan that we’re really excited about.

But in real life, unless you’re writing throwaway configuration, you’re interacting with some sort of VCS system. You’re gonna save your code somewhere, so you have some extra steps here, right? Between the plan and apply, you’re gonna commit. Between the apply and the next time you write code, you’re probably gonna pull to get changes.

VCS store config—let’s put that in as a layer. The idea here is only as simple as this if you’re working by yourself. If you’re working in a team, you’re probably using branches, which adds a couple more steps to this workflow. You’re probably committing to a feature branch. You’re probably making a pull request. Why are you doing that? Well, it’s so that the team can review the changes so you can evolve your configuration together. You can catch mistakes.

So team code review adds another wrinkle to this core Terraform workflow in real life, when we practice it for our daily jobs. What’s interesting about the teamwork flow, too, is it’s not just the team. Now we have 2 different kinds of actors. This two-thirds is what the individual does. By the way, the individual is still doing these tight loops as they are working on their configuration before they push it, and the team is doing the review part.

It’s a hand-off between the individual and the team. Note that we’re still right alongside of the application development cycle. This is the same workflow that you use for application code.

Let’s talk about what gets specific to Terraform. One thing that the team is gonna want as they review that pull request is they’re probably gonna wanna see the plan. This is a common thing. You’re reviewing configuration, you wanna see the output of the plan. What does Terraform say it wants to do that’s gonna help me make sure that your change is gonna do what it says it does?

### CI and automation

One practice teams will add here—it’s a lightweight practice—is to have the author copy and paste. They’ll run Terraform Plan from their laptop, and they’ll copy and paste the output into the pull request so the team can review it. That works. Maybe it’s something you wanna automate, though. So you’ll pull in a CI system and you’ll say, “Actually, we’re gonna have the CI system on every pull request run Plan, and give that feedback to the team so that they can appropriately review the pull request.”

Once you have the plan in CI, why not put Apply in CI? So at this stage, putting Plan and Apply in CI, this is a really nice milestone. This is what we see teams using Terraform doing all over the place, and it works pretty well. In fact, that’s kind of what Atlantis does. This is roughly the workflow that Atlantis provides: pull request feedback and centralized Apply. Actually, though, Atlantis switches the apply and merge steps in its current iteration. We’re talking about that. I wanna switch them back, so we’re gonna try to figure that out and get to a consistent workflow.

But it is absolutely the Terraform-in-a-team workflow. And we’re working on centralizing things, remember that? Go sign up if you’re interested in learning how we do that.

Obviously, Terraform Enterprise nails this workflow, as well. This is part of the core Terraform workflow as expressed in Terraform Enterprise. Terraform Enterprise adds on some things that supplement this workflow for Terraform at scale. We’ll get to that in a second.

Here is a set of ideas underlying the core Terraform workflow as you get increasingly robust in a team.

### Scaling Terraform

Now let’s talk about scaling Terraform. We’ve got some concepts that we’ve stacked up. We’ve got some workflows that we’ve stacked up. What about when you start really investing in this, you start using Terraform more? What increases? Maybe you have more teams. Maybe you’re gonna have more configuration, probably have more infrastructure, more chaos. Everybody loves chaos.

How do we attack this generalized problem of chaos? I don’t know; that’s our jobs, I guess. This is what we’re here for. Generally speaking, we’re looking for more maturity. How do we mature the processes around these workflows in order to control for the problems of scale?

A couple of ideas to throw around here: You have to evolve your sociotechnical systems. So we have to remember that there are people involved and there is technology involved. We can supplement the problems of scale with technology, but we have to remember the people, as well. Which is really just another way of saying, “Evolve your workflows.”

Before we dive into the workflows, if you’re looking for the mechanics of evolving a repo full of Terraform code, this is a great talk to watch: Nicki Watt gave this last year at HashiDays London. It’s called “[Evolving Your Infrastructure with Terraform](https://www.youtube.com/watch?v=wgzgVm7Sqlk).” And it goes through a single repository, through a single file of Terraform, through splitting it up into directories, splitting it up into modules, splitting those modules up into separate repositories. It’s a great talk if you’re looking for the concrete specifics of the kinds of ideas we’re talking about here.

### Back to workflows

Let’s talk workflows, though. Go back to our core Terraform workflow. How is this gonna scale? If you’re gonna have more teams writing more configuration, you’re gonna scale the write step. You’ve got more writing happening. And here’s where I get to pull in a concept I’ve been obsessed with lately, and that’s conceptual compression. This is something that anybody who has been hanging around me for the last 6 months is annoyed by now, because I don’t stop talking about it.

It’s been popularized by DHH [David Heinemeier Hansson], the founder of Rails. It’s essentially just another way of talking about abstraction as a core utility of the things we do. What I love about it is, it’s user-oriented. It’s the idea that, generally speaking, as we make progress in managing complexity, we can compress down the ideas necessary to get work done.

In DevOps, this is a huge problem. You have to know so many tools; you need to know so many ideas in order to get your job done. And the idea of “How do we find the seams where the useful-enough abstractions”—abstractions will always be leaky—“but useful-enough abstractions exist such that people above that layer of abstraction can get more done without having to learn everything that we know?”

To me, one of the core tenets of the DevOps movement is to find these seams. So you have to do this if you’re scaling Terraform. Why? Terraform expertise is not universally distributed, just like anything. It’s distributed as a bell curve. We sit up here, generally speaking—the folks who are in this room are probably sitting up here, the people who are experts in Terraform. As in scale, we start to call these people producers. These are the people writing Terraform configuration and slinging around in their application.

We class the majority of Terraform users into consumers, and I’ll show you how these fit together. But you’ll notice I didn’t put the low tail there. To me, the idea is that eventually we should get to a point where there are people who have very little Terraform expertise that can still get the benefits out of Terraform. A lot of you are doing this in your organizations by being a service team, by launching a path. So the consumers here are still people who are going to be slinging around Terraform.

The relationship between producers and consumers lives in the Terraform module. The [Terraform module] is our tool for establishing seams by which we can share ideas in Terraform with other people without them having to know the underlying details.

Easy example: Maybe you’ve got somebody who knows the basics of Terraform, and they can launch a company blog on a sub-domain of your company website. All they have to do is copy and paste those 3 lines. They know how to check it in, and the producers know all of the details that go into the infrastructure that launches a company blog.

This is a simple example, but it’s a really powerful tool, the ability to draw a seam. And you choose these seams for your company. I think it’s really important to understand that that exercise is a sociotechnical system question. You have to think about the people involved, you have to think about the technology involved and figure out where those seams are.

### The Terraform producer workflow

So here’s the core Terraform workflow, producer edition, where you’re doing write, plan, apply, but generally speaking, what you’re applying is throwaway infrastructure such that you can destroy it and then publish a module. This is something that producers do, and they upload it to a registry—it could be our registry, it could be the public registry, it could be the Terraform Enterprise registry, could be a set of repositories in your VCS system. The registry here is more of just an idea than it is a specific technology—a place for modules.

Then the consumer side of this is the idea that somebody can go and look at those modules, browse.—“What do I want? I want a PHP application in a test environment”—and be able to launch that into using Terraform without needing to know the details of, for instance, networking and security groups.

This is how we scale writing. The concept generally is what we talk about as producer/consumer workflows. For us, we think of it as centralizing around the Terraform registry.

Last thing I’ll talk about is scaling Plan. What happens when you have a lot of people reviewing plans? Manual review fails at scale. Humans are not great at reviewing tons of changes manually. So you have to start looking at automated review, and for us, that means policy as code.

This is what the core Terraform workflow looks like when you’re starting to implement automated review of plans. It’s inserting some sort of policy check in here.

What’s cool about this is the idea that you can separate duties. You can have folks who are writing policies and publish them such that the infrastructure folks just need to meet the policies. They don’t necessarily care what they are. They just know that as their plans come out, they will get the feedback about what they need to meet as they scale. It allows your infrastructure folks to have more flexibility within the needs of the organization.

So collectively we call these workflows “governance workflows.” All together, the core Terraform workflow, producer and consumer workflows, and governance workflows are concepts that we throw around in the Terraform team as we think about scaling Terraform.

I hope what I’ve been able to do here today is give you just a little bit of an ideas tour of the world of Terraform. We went deep, we went sideways, we went up, we went all sorts of directions. And again, I hope that you’ve gotten a little bit more of an intuitive understanding of some of the underlying ideas of Terraform, because, after all, somebody has to cloud the cloud.

(Duplicated from [here](https://www.hashicorp.com/resources/hashiconf-day-two-keynote-terraform-way).)
