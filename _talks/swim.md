---
title: "SWIM: Scalable Group Membership Protocol"
date: 2015-07-22
header: 
  teaser: "https://speakerd.s3.amazonaws.com/presentations/f6a9458b1039434d98f65174ad95ac21/preview_slide_0.jpg"
---

## Abstract

The problem of group membership in a networked distributed system can be expressed as the ability to reliably and repeatedly provide the answer a simple question: "who is alive?".

Group membership represents a key part of many useful applications, including P2P systems, network overlays, service discovery, and HA clustering. The SWIM protocol addresses severe limitations in the scalability of existing heartbeat-based broadcast membership algorithms by introducing a new approach using weakly-consistent, gossip based information sharing.

We'll start by working to understand the general problem space of group membership. Then we'll walk through the details of heartbeat-based membership algorithms and discuss their limitations when it comes to scalability. Once we have a grounding in the domain, we'll talk about the details of the SWIM protocol along with the benefits it provides and the tradeoffs of its strategy.

We'll conclude with some discussion of a real-world implementation of SWIM in the Serf project and the role it plays in the Consul service discovery tool.

## Slides

{% include slides id="f6a9458b1039434d98f65174ad95ac21" %}
