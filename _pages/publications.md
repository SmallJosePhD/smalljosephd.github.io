---
layout: archive
title: "Publications"
abstract: true
permalink: /publications/
author_profile: true
---

You can also find my articles on my <u><a href="https://scholar.google.com/citations?hl=en&user=ghb58Y0AAAAJ">Google Scholar profile</a>.</u>

<sup><b>†</b></sup>Equal first author

{% include base_path %}

{% for post in site.publications reversed %}
  {% include archive-single.html %}
{% endfor %}

<sup><b>†</b></sup>Equal first author
