---
title: "Terraform: Stronger at Every Scale"
date: 2019-07-09
---

Delivered as HashiConf EU 2019 Day 2 Keynote.

## Abstract

The #1 question HashiCorp gets about Terraform is: How do we scale? Terraform makes infrastructure easy to scale, but Terraform itself can be difficult to scale without the right features.

Learn how Terraform 0.12, Terraform Cloud, and Terraform Enterprise are bringing features that make scaling Terraform easier at each stage, from individuals to teams, and finally in large enterprises.

## Video

{% include video id="sOjmRyPkE4E" provider="youtube" %}

## Transcript

Good morning.

This building is so amazing. I cannot stop obsessing over the details. I was talking with the stage manager about the rigging. The way that the rigging clamps on to this very non-standard roof is fascinating to me.

I think there’s something about the folks who are attracted to infrastructure engineering; we really dig work that happens behind the scenes to make things happen. And I think it creates this special connection between the folks running an event like this and the folks attending it because we tend to look at that kind of detail and to say, “Some thought went into that. Somebody had to hang that.”

I’d encourage you to lean into that instinct and really appreciate all of the thought that went into this event because there’s a lot to discover, and there’s a lot to appreciate.

### Scaling Terraform

I’m here today to talk to you about [Terraform](https://www.hashicorp.com/products/terraform "HashiCorp Terraform"). My name is Paul Hinze. I have the privilege to talk with you today about all of the work that’s been happening on Terraform over the past year by our teams and all of the work that is ongoing in the coming year. So let’s dive in.

Today’s talk is structured around the idea of scale. I’m going to use the concept of scale to arrange the snapshot of all of our progress on Terraform, and also I would like to play around with the idea of scale.

### The growth of HashiCorp

I started thinking about scale in putting this talk together because the first thing that really struck me is how big we’ve gotten as a team. There are over 60 human beings just in engineering working on Terraform at [HashiCorp](https://www.hashicorp.com/%20%E2%80%9CHashiCorp%E2%80%9D) right now. And that is a huge difference from when I got there. In early 2015, it was just me and Mitchell Hashimoto basically. There were a couple of other full-time employees who were working part-time on Terraform.

But it’s incredible to take stock of the difference in scale, and trying to talk through the output of 60 engineers is a task in and of itself. What we have today is a snapshot and some highlights of all of the work. Because if I were to go through the list of everything that’s happened in the last year from 60 engineers, it would never fit in the time slot, and it would be pretty boring because I would just be reading commit messages and I wouldn’t be able to tell you any stories.

Here’s how we’re going to structure things today. On screen is the model that we think about the way that we improve Terraform for the users and the community. Essentially, the activities of an individual using Terraform are different than the activities of a team, are different than a large enterprise. And this is how we structure the various tools and the various teams that are working on those tools. That’s the structure I’ll use to update you today.

### Terraform with an individual user

Let’s take a look at an individual using Terraform. What does life look like for this kind of an individual? Pretty simple. You’re writing Terraform configuration, you’re running `terraform plan`, you’re verifying the result, and then you’re running `terraform apply`.

This is in a nutshell what activity using Terraform looks like. And what are you trying to do? Generally speaking, what you have is, you have an intention in your head about some infrastructure you’re trying to provision, and what you’re trying to do is capture that intention into the configuration to get Terraform to provision it for you.

And verifying the result, of course: Either it’s going to be what you expected, you’re going to go through to the `terraform apply`. If it’s not, you’ll go back up to the beginning. So this is like the core loop of writing configuration of using Terraform as an individual.

And with Terraform 0.12 we’ve taken the whole experience of using Terraform as an individual and upgraded essentially every portion of it.

### Terraform 0.12 for the individual user

Let’s take a look at some of the highlights of 0.12 in this context. When you’re writing configuration, when you’re trying to capture that intention into config, you have a much stronger language undergirding that activity in 0.12, and that allows you to express yourself more efficiently and more effectively. That’s powered by the richer types system in 0.12 and better collection support.

These are richer concepts to express the ideas of the infrastructure you’re trying to create and share them with your co-workers.

And then on the second half, verifying the result. One of Terraform’s most critical features is its ability to predict what it’s about to do and reading plans. That means that reading plans is one of the core activities of using Terraform. For 0.12, we took a look at that activity and took all the feedback from people reading plans and seeing that there was a lot we could do to improve that activity to get the core of what Terraform is going to do communicated effectively to the user.

In 0.12, the plan output is [structured much closer to config](https://learn.hashicorp.com/terraform/getting-started/build), the configuration that you’re writing, and it’s annotated in a way that allows you to see what’s happening a lot better.

### 0.12’s really valuable error messages

And of course, the star of the show is the [context-rich error messages](https://www.terraform.io/docs/internals/debugging.html), which are incredibly transformative, if you are a user who has not tried Terraform 0.12 and you know life 0.11 and prior. This was probably the most striking thing to me. I realized that I wasn’t reading the error messages.

When I saw an error message while writing Terraform configuration, I would scan the error message and then I would hop right to the config and just start searching. Like, ”OK, I’m not going to get anything useful from this error message.”

It took me a while using 0.12 to learn, “Wait a second, this error message is telling me what to fix, and I need to unlearn this little hop that I do back over to the configuration.” I can let the error messages guide me to the corrections I need to make, and that just really transforms the way that you use Terraform day-to-day.

This is the work that we’ve been doing and that we are continuing to do to make using Terraform as an individual stronger. And 0.12 was a massive step in the right direction, and it set us up for a consistent set of improvements that we’ll continue to make in minor releases, past 0.12 and beyond.

### Terraform and teams

Terraform is a powerful tool when used as an individual, but [infrastructure as code](https://www.hashicorp.com/resources/what-is-infrastructure-as-code "Infrastructure as code: What is it? Why is it important?") as a practice really hits its stride when you’re [working in a team](https://www.hashicorp.com/resources/getting-started-with-terraform-enterprise "Getting Started with Terraform Enterprise for Teams").

That’s because a lot of the benefit that infrastructure as code gives you is this ability to collaborate over the concept you’re trying to capture, the infrastructure you’re trying to provision.

### Terraform Cloud

This is a huge year for teams using Terraform because this is the year we’re rolling out [Terraform Cloud](https://learn.hashicorp.com/terraform/cloud/tf_cloud_overview%20%E2%80%9CTerraform%20Cloud%E2%80%9D). …What we’re doing is capturing all of the collaboration experiences that we have been developing in Terraform Enterprise and we’re making them available to the broader community.

I’m excited about this work, and today I have a snapshot of the progress and where we’re headed later this year.

### Terraform remote state management

Remote state management was launched a few months ago, and is [available today for free](https://app.terraform.io/signup). This is essentially the state file that Terraform needs to store to do its work. Remote state management removes that problem from you as a user. It provides state versioning, state locking, and encrypted storage, and it’s available as a service.

Of course, all of the open-source plugins, all of the backends for storing state in all of the existing places will continue to work. But if you don’t want to deal with that problem, we can solve that for you. We can take that problem away for you.

Since we launched it in May, we already have over 50,000 state versions stored, and we’re getting great feedback from users of the service.

I love this compliment from a beta user—“The perfect complement to open-source Terraform”—for 2 things. One, it’s a compliment that uses the word _complement_, and I just like that kind of recursion. But 2, the first thing I asked when this quote was passed along to me was, “Is this user in the beta of the full experience that we have later this year, or is this user using the remote state management?” And this user is just using the remote state management. And I said, “Oh, I cannot wait to see what this user thinks of the full story that we’re rolling out later this year.”

### VCS for collaboration

[Version Control System](https://www.hashicorp.com/resources/effectively-utilizing-a-vcs-with-tfe "Effectively Utilizing a VCS with Terraform Enterprise")\-backed to collaboration—we have beta users using this right now. This is the workflow that Terraform Enterprise users have been helping us strengthen and work into their workflows. I’m incredibly excited to launch this stuff later this year.

If you find me today, you may be able to convince me to let you into the beta of this functionality.

Terraform Cloud and the free remote state management are available today. You can sign up at app.terraform.io/signup. And there’s so much more to come. I’m really excited about it.

### Terraform Enterprise

It’s time for Enterprise. I got to this section of the talk and I asked myself, “What does _enterprise_ mean?” And I realized, I don’t know. I don’t have a good answer to this.

This is one of those words that we as an industry use so often that it just loses its meaning. And that really kind of threw me for a loop because I’m sitting here thinking, “I don’t really know what _enterprise_ means. I guess it’s big companies and stuff.” I had to stop and think through the concepts behind this thing. So I was like, “We’re talking about scale. What is scale? Scale’s a measurement. What are we measuring?”

Let’s start to put some concepts together here. We’re talking about organizational scale. A team is bigger than an individual, and an enterprise is bigger than a team. And I was like, “This makes sense. Enterprises are sort of high-scale organizations.”

But I did some googling on the word _enterprise_. I looked up some definitions, and the definitions don’t mention scale. The best aggregate definition is this idea of a group of people centered around a set of common goals. I like that definition. It makes sense. It’s a little generic, but it means something relatively large.

And so trying to get back to a working definition of _enterprise_, I started thinking about what _enterprise_ means to Terraform and what enterprises have been doing. Our customers and us have been working in concert to answer one central question around Terraform, and that is, “How do we scale?” This is the most common question that we get at events like this. How do we scale? And when Terraform users are asking us “How do we scale?” what does that mean?

That’s not organizational scale per se, although it’s related to organizational scale. Of course, there is a simple version of scaling that Terraform is very good at, and that’s infrastructure scaling. So one simple answer to that question …“How do you scale with Terraform?” is you just use the count meta parameter, you set it to whatever you want, bam, you have scale.

And that’s true. Terraform is very good at that. It’s good at the infrastructure scale that can be represented in this way. But that’s not really what these users are asking when they ask that question. Terraform does make it easy to scale, but scaling Terraform isn’t easy. That’s been the struggle of users trying to figure out how to use Terraform in increasingly large and complicated organizations.

So in building Terraform Enterprise, and working with our customers who are trying to deploy Terraform as an infrastructure provisioning strategy for larger and larger organizations, we’ve had to break this problem down, and we’ve had to take a ton of lessons learned, a ton of feedback, and that’s the feedback that goes back into Terraform Enterprise.

One of the things you have to do at the outset is figure out how you measure Terraform scale. Is it lines of configuration? Is it the number of Terraform workspaces that you have? Maybe it’s the number of people that you have editing Terraform configuration. Maybe it’s the number of teams those people are arranged into. Maybe it’s the number of changes you make to Terraform workspaces per day.

It turns out all of these metrics play a part in measuring an organization’s Terraform usage, and all of them play a part in the kinds of solutions that an organization might need to help them arrange Terraform at scale.

The thing that we’re always trying to get at with these concrete measurements is the increasing complexity, and it’s the increasing complexity that comes from scale.

And that’s where I got back to my talk and I was like, ”OK, this is what we’re doing here. We’re really living in this truism, this correlation, that scale yields complexity.”

And if you link that back to the definition of _enterprise_ and you combine the definitions to, say, a group of humans with a set of common goals, working at scale implies working with boatloads of complexity. And I think any of you who are working in an enterprise context would agree that boatloads of complexity is a pretty good job-environment description.

There’s one thing that complexity tends to do that I want to touch on. We give ourselves this story about the past when we deal in complexity, this a nostalgia for simpler times that I think is so interesting. It’s so common and really natural.

This is true in a scaling organization. Any of you who have been in a scaling organization will know this feeling of, “Can you remember when we didn’t have to have cross-team syncs?”

And this is true of the growing Terraform team at HashiCorp as well. When it was just me and Mitchell, the concept of a cross-team sync was not a thing because we all knew what was happening.

It’s more complicated for larger and larger groups to coordinate. And this is true of the exploding complexity of our technology as well. The natural feeling of, “Can you remember when I could open up a text file and notepad.exe, put some HTML in there, and then I’d have a website? Man, everything’s so complicated today.”

I think this feeling is natural, and there are aspects of this feeling that are worth capturing and putting into our problem space. There are also aspects worth de-emphasizing and saying, “These aren’t worth paying attention to.”

Because the real story of scale and complexity is that there’s a light that can be shown on it. If you think about the fact that we all have not chosen to work in machine code, we all have not turned back the clock and said, “I’m going to work at a 5-person organization.” Why haven’t we done that, if the simpler times were all that good or all that better? There’s something else here.

There’s something else that we’re getting for all this complexity, and that’s the other side of this. Scale yields immense capability. Organizations that scale can get more done than those that don’t. And granted, small organizations, those are the myths of our industry. Small teams getting immense things done is definitely a story.

But if you’re talking about the massive problems of the world, the higher-scale organizations are just better suited to attacking those problems. Similarly with technology, the technology that we’re stacking on top of itself gives us more capability. And so this I think is where we’re living.

In enterprise software, in infrastructure software, in today’s technology environment, we have scaled our complexity, and we need to manage it. And that’s where I think the core of HashiCorp’s approach to problem solving is shown in this concept of “manage versus hide.” We don’t want to hide the complexity that we’re living in. We want to manage it.

This brings us back to the work that we’re doing in Terraform Enterprise. Terraform Enterprise is the result of us working with scaling organizations to manage the complexity of scale. We bake the knowledge and the wisdom that we get from that learning process with our customers back into this product.

I have 2 updates for you on that front.

### Sentinel and policy as code

The first has to do with [policy as code](https://docs.hashicorp.com/sentinel/concepts/policy-as-code "Policy as code: Definition and benefits") with [Sentinel](https://www.hashicorp.com/sentinel%20%E2%80%9CHashiCorp%20Sentinel%E2%80%9D). If you managed to catch [Chris Marchesi’s excellent talk yesterday](https://www.hashicorp.com/resources/policy-as-code-it-governance-with-hashicorp-sentinel), you got a great deep dive into the concepts behind policy as code. I’m going to give you a brief overview. For details, you can take a time machine and you can go back and [watch Chris’ talk](https://www.hashicorp.com/resources/policy-as-code-it-governance-with-hashicorp-sentinel).

Policy as code: How does this come about? It’s a simple story, probably a very familiar story. You have a group of users. You introduce them to this wonderful cloud technology. They start to use it, and they’re happy, and you’re getting so much business benefit out of this wonderful cloud technology. The users are happy and the clouds are happy and you’re happy.

And then the users start to use it more, and it starts to become a little bit of a mess and—maybe it’s costs, maybe it’s security—something is starting to get slower, something is starting to get more problematic.

All of your clouds become variously sad, and your users become variously sad, and now you have a problem. This is of course Terraform’s wheelhouse. This is the environment that you can introduce Terraform into and get a lot of benefit right away. Terraform shows up, everybody says, “What’s this new thing?” And we say, “Terraform, and especially Terraform Enterprise, can provide a consistent layer of coordination and of consistency for managing cloud environments.”

People start to use Terraform and the clouds become happy.

This is great. This is a step in the right direction. You have all of these users using Terraform workspaces to arrange their work. But then you start to realize there’s nothing stopping these users from creating that same complexity inside of Terraform, that same mess.

It’s a mess that’s captured in infrastructure as code, which is a step in the right direction. There’s definitely a benefit from that, but it’s a mess nonetheless. This is the environment that Sentinel comes into play. How can we take the concepts of infrastructure as code and control the chaos of a large organization using Terraform?

We do that by implementing the same concepts of infrastructure as code in policy as code, the ability to capture policies—things you want to be true about all of your infrastructure—into automatable chunks of configuration. And those automatable chunks, the policies, are checked against every Terraform operation or subsets of Terraform operations. And that’s where Sentinel lives, and that’s the problem Sentinel solves.

To give you a little snapshot on what we’re working on for Sentinel, I want to draw a maturity model for infrastructure as code against policy as code. On the infrastructure-as-code side, we have code to express infrastructure, the core Terraform tool. We have VCS-backed collaboration. That’s the functionality I’ve just been talking about rolling out to all users later this year in Terraform Cloud.

And then you have tools for sharing code. These are [Terraform modules](https://www.hashicorp.com/resources/build-reusable-composable-terraform-modules "Building Terraform Modules"), the [Terraform registry](https://registry.terraform.io/ "Terraform Module Registry").

Over on the policy as code side, we have the code to express policy. That core engine of Sentinel has been solving problems for organizations since it was introduced, and today I’m excited to announce that we have the [VCS-backed collaboration story ready to go](https://www.hashicorp.com/blog/announcing-vcs-enabled-versioned-policy-sets-in-hashicorp-terraform-enterprise).

This is the way that we’ve always envisioned using Sentinel with Terraform Cloud and Terraform Enterprise. It’s available today in Terraform Cloud, and it will be in the next release of Terraform Enterprise. For those of you who are familiar with working with Terraform, it’s very similar.

Wiring up VCS connections, getting versioned policies sourced from VCS, is now a straightforward operation, and we’re really excited about this, and we’re really excited to continue to strengthen the story of [multicloud](https://www.hashicorp.com/cloud-operating-model "The Multi-Cloud Operating Model") compliance and governance for our users, because this is a key problem that all of our users are facing when they scale.

### ServiceNow integration with Terraform Enterprise

My second update for Terraform Enterprise has to do with self-serve infrastructure. This is the concept that has to do with the decoupling of the provisioning process from the mechanisms by which it is provisioned.

The tool I want to talk to you about today is ServiceNow. ServiceNow is really more than a tool. For those of you who are in organizations that have adopted ServiceNow, it really becomes the operating system of IT. It’s a central platform to manage every activity, every kind of workflow that happens in IT, and it provides opportunities to automate a lot of it.

Organizations that use ServiceNow have been asking for a while for a story to be able to bring the power of Terraform into a ServiceNow environment. And I’m excited to announce today that we’re ready to go with a first-class integration with ServiceNow and Terraform Enterprise.

This is huge for organizations that have adopted ServiceNow, and it provides some bones of integration potential for the future.

Let me show you how it works. The way that the ServiceNow service catalog works is it decouples the concept of a service provider from a service consumer. What service providers now have is the full power of Terraform Enterprise to be able to drive from the ticketing workflows and the request workflows that their users are used to.

This combines the familiar workflows that their stakeholders need and unlocks the massive power that infrastructure as code as a practice and Terraform specifically could give to their organization. And that includes all the power that Sentinel brings to the table.

And on the flip side, what we have is the ability to track provenance details from externally managed workspaces inside of Terraform Enterprise and Terraform Cloud. This allows you to get a story of where your infrastructure is coming from, and the first-class ServiceNow integration is an expression of new API endpoints that are going to unlock new kinds of integrations in the future.

Terraform and ServiceNow—this first-class integration is [available today](https://www.hashicorp.com/blog/announcing-servicenow-integration-for-terraform-enterprise) on Terraform Cloud. It’ll show up in the next release of Terraform Enterprise. We have a really slick demo. Hop over to the Terraform booth if you’re interested to learn more.

### Making life better for Terraform users

We have been working as a growing team in Terraform engineering to make progress across all of these fronts, to make the lives of individual Terraform users better with Terraform 0.12, to provide stronger collaboration stories for teams in Terraform Cloud, and to help solve the problems of scaling Terraform at large organizations in Terraform Enterprise with policy as code and self-serve infrastructure.

It’s been a joy to work on these massive and complicated problems with you, the community. The process of doing so continues to be the main part of what makes my job great.

And along those lines, I’d like to ask you to continue to participate in the community. We recently introduced the [HashiCorp Community Portal](https://community.hashicorp.com/%20%E2%80%9CHashiCorp%20Community%20Portal%E2%80%9D) as this new centralized platform for discussions of the community, of users with each other, of cross-product questions.

Events like this, participating online, all of this stuff is how you help us make these products stronger. And that’s how we make Terraform stronger at every scale.

Thank you for your time.

(Duplicated from [here](https://www.hashicorp.com/resources/hashiconf-eu-2019-day-2-keynote-stronger-scale-terraform).)
