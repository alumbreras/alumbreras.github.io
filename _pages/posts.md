---
layout: default
title: Posts
permalink: /posts.html
---

<h2 class="section">Posts</h2>

<div>
  <ul class='posts'>
    {% for post in site.posts %}
      <li><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ post.url }}">{{ post.title }}</a></li>
    {% endfor %}
</ul>
</div>
