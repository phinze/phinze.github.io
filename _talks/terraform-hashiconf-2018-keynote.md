---
title: Terraform Keynote - HashiConf 2018
date: 2018-10-22
---

Delivered as HashiConf US 2018 Day 1 Keynote.

## Abstract

Paul Hinze, the director of Terraform at HashiCorp, gives a rundown of the highly-anticipated new features coming to Terraform 0.12 in this section of the opening day keynote.

## Video

{% include video id="XF8TGbDxxzQ" provider="youtube" %}


## Transcript

Hello, HashiConf. Hello, over 1,000 people in this room. This is pretty incredible. Hello, live-stream people. Hello, future video watchers; I am speaking to you from the past. My name is Paul Hinze. I am so ridiculously honored to be here to represent to you all of the hard work that has gone into Terraform over the last year and to talk with you a little bit about what the next year of Terraform is going to look like. So much to share with you.

I want to start with a couple of progress updates. So here are some numbers. Some of these numbers are absurd. More than 1,200 contributors to Terraform. That's more than fit in this room. So if we had brought all of the Terraform contributors here, they would not fit. We would be a fire-code violation. I'm curious: Are there any Terraform contributors in the room? Anybody have a PR acceptance or a provider or a docs update? Awesome. Look at all of them. Thank you. That's great.

The other number here that is exciting is that providers number. So providers are the plug-ins to Terraform that allow it to address different APIs and add more resources: 160-plus. That number has skyrocketed in the last year. Mitchell's going to talk a little later about how we pulled that off. But these numbers just show you the adoption of Terraform has been just incredible to continue to watch.

The other 2 numbers I'd like to share with you have to do with our announcements from last year. Last year we introduced the Terraform Registry to share modules, and we introduced Sentinel, our policy-as-code framework, which is integrated with all of our projects but my favorite integration is the Terraform integration. I'm really pleased to report that both of these new pieces of the Terraform story have become key pieces of the Terraform story.

That 900+ modules number is just public modules. That means there's a vast increase in people using Terraform and Enterprise to share modules amongst their organizations. And 35,000 policies checked with Sentinel already, and that number just keeps going up. So it's been exciting to see the adoption of these 2 new features.

So let's get down to business. I have 2 conclusions for you today that drive 4 announcements. If I do my job, you'll see how they all fit together into the way that we're approaching Terraform generally.

Looking generally at all the things I have to show you, it comes down to a theme of listening and reacting to the Terraform community. We spend all of our time talking to users, talking to customers. I think you're going to see that the announcements that we have for you today are driven from community feedback, every single one of them. A lot of them from conversations that have happened at HashiConfs past. So I hope you feel that you're participating with us in the development of our projects and our products, because that's how it feels to us.

One of my favorite things about working at HashiCorp is how principles-oriented we are. So I mapped my theme to 2 our company principles. You can read about our principles on our website, or you could just hang out near me and I will blab on about the Tao of HashiCorp. But, yes, I think if you're interested in learning how we approach problems and solutions, that's great material for you to read.
Deep language improvements in HCL

OK, getting into it now. Conclusion No. 1 is that Terraform needed deep language improvements. Now, we're proud of HCL, and we think that has been key to Terraform's success. We've been improving it incrementally over the years, but the user feedback about points of friction started to stack up against limitations of the language.

The list of things that we wanted to improve that were being hindered by the core engine of the language got so long that we needed to draw this deeper conclusion so that we could take bold action. So you'll notice that this is in past tense, because this is the conclusion that has been driving our work for the better part of this year. This, of course, is Terraform 0.12.

Terraform 0.12 is so huge. There are so many features. I could spend the rest of the day just talking to you about Terraform 0.12 features. If you're looking to learn about 0.12, you're in the right place. I wasn't going to put anything in and then people were like, "Oh, you can put in a couple." So I'm very excited, I get to show you just a couple of the features. The whole thing about Terraform 0.12 is a richer type system and a richer language engine underlying the whole of Terraform.

Here's one of my favorite features. The new for keyword allows you to iterate over lists and generate lists and maps. This gives you a whole bunch of new flexibility. It's a new primitive, but I think it's going to feel like a lot more elbow room in manipulating data as you pass it between modules. You can see here I'm just generating a map of instance ID to private IP, iterating over the set of AWS instances in my vicinity. This is going to help the flexibility of the language.

Speaking of flexibility, this one's great: You can pass a whole resource as a module input or an output. This is massive, because it takes away a lot of the boilerplate of having to explicitly choose attributes that you have to pass in and out of each module. I can pass the whole VPC in here, and the module can just use what it needs. Here's the other side of that. Now we're inside of that module. Here's a typed declaration using this new rich type system.

You can see I've named an object here. I said, "I just need an ID that is a string." So the VPC resource matches this type signature, but I can also have this passed in as a literal. My favorite thing is if you mess it up-here's an example. I went back out of the app module, and you can see I'm passing in a literal here that doesn't have an ID. You get the best part, which is these rich error messages.

I was just flipping out about these error messages. The core engineers who have been in the engine of 0.12 were like, "Really? It's error messages that you're most excited about?" and I'm like, "Yes, absolutely." So, yes, the language engine gives us so much more context at the site of the error that enables us to present all of this information to you. You've got context here. You've got cross references to other module definitions.

A lot of times you'll get a suggestion about a misspelling of an attribute. So, yeah, the error messages in 0.12, I think, are just a total game-changer for day-to-day writing of Terraform configuration. Those are only just a couple of the features in Terraform 0.12. I don't have any time to continue, even though I really want to. Here's how you can learn more.

Three ways you can learn more: We've been posting a blog-post series where we spend a little bit more time with 1 or 2 features in each post. That gives a great way to scroll through and read about the new features. Tomorrow on this stage, Kristin Laemmert, our core engineer, is giving a live tour of 0.12. Check out that if you're interested in learning more. And-I'm so ridiculously excited to announce-we have a build for you. Terraform 0.12 is here.

The alpha build is released. It is out there. It is an alpha, so there are things we're still finishing. You have to read the release notes before you give it a try, but the language ergonomics are there. The language engine is there. HashiConf's a great time to download this, try it out, let us know what you think. It's been a long road for us, believe me, but it's gotten us so many improvements and it's gotten us a foundation for the future as we began the march to Terraform 1.0, this is the undergirding of the overall Terraform engine that is going to get us there. So I'm excited about that.
Free tier for Terraform remote state management

Now my second conclusion. My second conclusion's a really big one because this one drives all of our work for the next year. This one is that collaboration is a universal problem. OK, what do I mean by that? We've always known that as organizational complexity grows so does the need for collaboration in Terraform. This is the work and the attention that we've been paying in Terraform Enterprise.

We've been building out Terraform Enterprise as this world-class collaboration platform to solve the problem of Terraform collaboration. But what we've come to understand in conversation with our community is that collaboration starts as a problem from the first time that you want to use Terraform with somebody else.

Our original instinct was the idea that, because we're infrastructure as code, generalized CI and VCS systems would be enough for collaboration, but what we've come to understand is that there's a tooling gap in terms of managing some of the specifics of Terraform workflows as you try to collaborate in smaller teams. If you're looking for evidence of this conclusion of this tooling gap, I think the community trying to solve this problem is great evidence.

There are several projects out there that try to help close this gap by providing a solution for Terraform teams to collaborate. So we looked at the field. We listened to our customers. We realized that we're sitting here on a world-class collaboration platform and watching the community having to solve this problem for itself.

So here's the active version of this conclusion. It's that we want to be able to solve Terraform collaboration for everyone. So this is going to drive my next 3 announcements, and it's going to drive our focus of our attention for the next year. Here's the framework that we're going to be working in. Terraform Enterprise is going to remain the world-class collaboration platform that it is, but you're going to see us working in this framework of introducing solutions for small teams on a free tier.

We're then introducing progressive affordable tiers for businesses. The goal here being that teams need scale, and their problems change slightly. So we're going to be basically designing solutions to fit the need of every size of team and teams using Terraform.

So if that's our framework, what's our first step? What would be a good first step? What is a problem that is always there in Terraform collaboration? Everybody's laughing because they know: This is the first hurdle, the pesky Terraform state file. The Terraform state model is where it derives a lot of its power, but it is the first problem that you have to solve when you're collaborating with somebody else: I have this file.

I know I need to store it somewhere central and somewhere secure, and I need to make sure that as I'm sharing access to the state file with everybody else that we're serializing and we're not collaborating each other's changes. So we said to ourselves, "OK, well, that's a problem. I think that's a problem we can solve." So, that's what we're going to do. I'm pleased to announce that we're going to offer free remote state management for all Terraform users.

This is the core technology that is inside of Terraform Enterprise that we are going to make available to everybody as the first step in our free collaboration tier. This is designed for collaboration, which means we're not putting limits on users, we're not putting limits on the number of workspaces, and it's designed for security and stability.

Which means you get per-operation locking, obviously it's HashiCorp Vault-encrypted, and each workspace has version storage for easy rollback. Our mission here is collaboration on Terraform for everyone. And this is a strong first step and we hope you think so too. I'd like to invite you all to join us on this journey of collaboration for everyone. https://app.terraform.io/signup will get you on the wait list, and the beta begins later this year. We're really excited about this.
Atlantis team joins Terraform

I said that's the first step. So what's next? If we have this big resolution about Terraform collaboration, where are we going from here? I'd like to introduce you to Mishra and Luke. Mishra and Luke, when they worked at Hootsuite, they built and open-sourced a project called Atlantis. Atlantis is one of those tools that's been trying to fill that gap in Terraform collaboration, and it's produced a good workflow for Terraform collaboration for teams that's been serving its community well. Mishra has been a developer advocate here at HashiCorp for about a year, and Luke has been maintaining Atlantis solo full time, on his own, for about 9 months. we've been talking.

We've been talking. We have this new mission about Terraform collaboration. Mishra and Luke and the Terraform team at HashiCorp have been talking, and what we discovered in chatting is that our vision for Terraform collaboration is very compatible. And so I'm happy to announce that the Atlantis team has joined HashiCorp, and we're going to work on Terraform collaboration together.

Luke's got a great blog post. If you're a member of the Atlantis community, Luke's got a great blog post that explains the details of his side of the story. The short story is we're putting our heads together on this mission of Terraform collaboration.

Luke is going to, in the near term, continue to maintain Atlantis just like he has been me. Mishra is going to continue to be our man in the fields talking, continuing his work as a developer advocate. But we're excited to put our heads together and come up with a cohesive story for Terraform collaboration from Day 1 all the way up to a massive organization.

Speaking of massive organizations, I'm talking about this journey, right? We've got a great first step with remote state management for free. We've got the Atlantis folks onboard to help us chart this course. What's next for us? Well, you already know. What's next for our customers is already here. We have been working on the problem with Terraform collaboration alongside of our customers since the inception of Terraform Enterprise, and this represents the cutting edge. This is where we are doing our innovation. And my final announcement shows you the leading edge of that.
Terraform Remote Plan and Apply

Terraform itself has always been about 1 workflow across multiple providers, and Terraform Enterprise has always been about 1 workflow for Terraform collaboration. But what we've seen in talking with various kinds of organizations is ,as you have adopted Terraform CLI and workflows around it, making the switchover to the collaboration workflow provided by Terraform Enterprise is sometimes a bit of a hop.

We wanted to solve that problem. We wanted to merge these 2 workflows into a consistent stream. And so that's what Remote Plan and Apply do. We're really excited about this feature. This is the unification of Terraform CLI and Terraform Enterprise that we've been working on for a long time. Let me show you how it works.

It all starts with just a regular old Terraform Plan. Everybody knows Terraform Plan. But this Terraform Plan is wired up via the enhanced remote backend to Terraform Enterprise. And so instead of just the plan output, what I get is a URL that allows me to share this plan output with my coworkers. I get access to all of the variables securely stored within Terraform Enterprise. All I need is a TFV-API key.

And I get the streaming output from that plan right in my CLI. This is not only about adoption; this is about daily workflow for all of our Terraform Enterprise users, because this plan is a speculative plan that's using just the config that's in my local directory. So no longer do I have to make a pull request to get the feedback from the plan that's being run inside of Terraform Enterprise.

I can just do this over and over again from my terminal as I'm working on Terraform config. It changes the day-to-day experience of running Terraform in a large organization and honestly brings it back around to that Day 1 experience where you just have 1 directory full of config. So we're excited about closing this loop.

Oh, and you also get the output of Sentinel policies. This is really cool, because you can basically take the Sentinel policies that your organization has been writing to make sure that all of your Terraform is meeting the company's needs, and you can get the feedback on those policies right in your terminal.

Terraform Apply works the same way. Terraform Plan works whether you're using VCS to drive the Terraform Apply or not. But for teams that are using Terraform Apply and maybe running it from your laptops or often running it from a CI system, it works exactly the same way. You get the integration with Terraform Enterprise. You get the system of record of Terraform Enterprise, and you get the application of Sentinel policies.

This creates a new way of introducing Terraform Enterprise, without changing the existing workflow, into an organization, getting the benefits of Sentinel, and getting the benefits of that module registry that's built in. This is about Terraform Enterprise adapting to your workflow, creating a single unified workflow for Terraform across organizations small and large. This is available in a preview release to our enterprise customers today.

But what I think is so exciting about this next year is you're going to start to see the functionality that shows up in Terraform Enterprise, we are going to be fitting that functionality downstream to all of those tiers. So Remote Plan and Apply is a piece of functionality that you will see eventually available to the whole community. We're just so excited about being able to have this gradation of released functionality.

To review: We have been listening to your feedback. We have been hard at work on the core of the Terraform language in 0.12, and we're excited for you to play with the alpha build and let us know what you think, and we're dedicated to solving the collaboration problems in Terraform for all users, with a first step of free remote state management.

We've got the Atlantis team on board to help, and Remote Plan and Apply is Terraform Enterprise becoming more flexible than ever and represents the future of what we see for Terraform collaboration. Thank you so much for your time. I'm looking forward to chatting with all of you at the conference.

(Duplicated from [here](https://www.hashicorp.com/resources/keynote-terraform-free-saas-tier-hcl-upgrades).)
