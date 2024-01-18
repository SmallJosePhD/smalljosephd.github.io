---
title: Implementation of the Fractional Frequency Flexible Fourier Form ARDL in EViews
date: 2024-01-18
permalink: /posts/2024/01-fourier-ardl
excerpt_separator: <!--more-->
toc: true
tags:
  - Fourier ARDL
  - ARDL bounds testing
  - Bootstrap ARDL
---

#The method 
All that I want to show you is how to implement this model using the ARDL method in Eviews. First, I will invite you to read one of the previous posts in this blog, where I have briefly discussed the ARDL method. (Read about it here.) More importantly, the section, ARDL at a Glance will be helpful. Pay attention to Cases 1 and 2 under the model specifications. I further invite you to read about the bootstrap method here. In this post, we are going to apply the knowledge of bootstrap. Consider the following model, which I call FARDL(p,q):
