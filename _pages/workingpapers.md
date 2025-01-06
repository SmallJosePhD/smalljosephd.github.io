---
layout: archive
title: "Working Papers"
abstract: true
permalink: /workingpapers/
author_profile: true
---

{% include base_path %}

{% for post in site.publications reversed %}
  {% include archive-wp.html %}
{% endfor %}
