---
title: "Applying Graph Theory to Infrastructure as Code"
date: 2016-05-14
header: 
  teaser: "https://speakerd.s3.amazonaws.com/presentations/a3c9bd9d5d8d4156a1e19919fd47b01d/preview_slide_0.jpg"
---

Delivered at HashiConf EU in June 2016 and at HashiConf US in September 2016.

## Abstract

Graphs are mathematical structures used to model relationships between objects. Modern infrastructures can be thought of as graphs - compute resource depend on network resources, which in turn depend on access control resources, and so on. At a certain scale, the relationships between all resources in an infrastructure become impractical to reason about.

Terraform builds a graph to model the relationships between resources so operators can safely manage and change infrastructure resources across bare metal, IaaS, PasS, and SaaS. Terraform models and potentially prevents that simple change with unforeseen consequences so operators don't have to.

In this talk, we will explore the graph theory at the heart of Terraform's orchestration engine

## Slides

{% include slides id="c3dbb365d7bd4171945c337097497532" %}

## Video

{% include video id="Ce3RNfRbdZ0" provider="youtube" %}
