---
layout: default
title: Writing
permalink: /writing.html
---

<div class="page-narrow">
  <h1 class="page-title">Writing</h1>
  <p class="page-intro">
    Essays and notes on artificial intelligence: how it works, how I work with it,
    and what it is doing to the world around us. Now and then, a derivation I wanted
    to work out myself.
  </p>

  {% include writing-items.html %}
  {% assign by_year = writing_items | group_by_exp: "item", "item.date | date: '%Y'" %}
  {% for year in by_year %}
  <h2 class="writing-year">{{ year.name }}</h2>
  <ul class="writing-list">
    {% for item in year.items %}{% include writing-entry.html item=item %}{% endfor %}
  </ul>
  {% endfor %}

  <p class="page-footnote"><a href="/feed.xml"><i class="fa fa-rss"></i> RSS</a></p>
</div>
