---
layout: archive
title: "Research"
permalink: /research/
author_profile: true
header:
  og_image: "research/ecdf.png"
---

The central theme of my academic research interests broadly lies at the intersection of illicit activities (such as grand corruption, money laundering, tax evasion, underground economy, kidnapping-for-ransom, terrorism, fraud, and robbery), fiscal sustainability, and sustainable development in developing countries. One strand of my research explores the size and flows of the funds these illicit activities generate. The other aspect of my research considers how the development and prevalence of these activities influence fiscal sustainability and sustainable economic growth and development in low-income countries.

Over the years, relying on multiple data sources and employing some advanced methods in quantitative economics and econometrics, I have provided insight into the complexity of a number of social, economic, and political issues. These include the drivers and inhibitors of poverty in Nigeria, the health spending-outcome nexus, the implication of the oil-corruption association for fiscal and economic sustainability; and the size of money laundering, amongst others.

<nbsp>

{% include base_path %}

{% assign ordered_pages = site.research | sort:"order_number" %}

{% for post in ordered_pages %}
  {% include archive-single.html type="grid" %}
{% endfor %}
