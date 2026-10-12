---
layout: default
title: Writing
permalink: /writing.html
---

<div class="page-narrow">
  <h1 class="page-title">Writing</h1>
  {% include writing-items.html %}
  <ul class="writing-list">
    {% for item in writing_items %}{% include writing-entry.html item=item show_date=true %}{% endfor %}
  </ul>

  <aside class="blogroll">
  <h2>Blogs I read</h2>
  <ul class="writing-list">
    {% for blog in site.data.blogroll %}
    <li class="writing-entry">
      <a href="{{ blog.url }}">{{ blog.name }}</a>
      <span class="writing-meta"><span>{{ blog.author }}</span></span>
      <div class="blogroll-note">{{ blog.note }}</div>
    </li>
    {% endfor %}
  </ul>
  </aside>

  <p class="page-footnote"><a href="/feed.xml"><i class="fa fa-rss"></i> RSS</a></p>
</div>
