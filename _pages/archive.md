---
layout: default
title: Archive
permalink: /archive.html
---

<div class="page-narrow">
  <h1 class="page-title">Archive</h1>
  <p class="page-intro">Things I have done that are not my current focus, kept here for the record.</p>

  <h2 class="writing-year">Career coaching</h2>
  <p>
    I trained as a coach with the <a href="https://coactive.com/">Co-Active Training Institute</a>
    and coached professionals from engineering to the arts, both inside my company and independently.
    I am not taking new clients at the moment. <a href="/coaching.html">The original coaching page</a>
    is still available.
  </p>

  <h2 class="writing-year">Older posts</h2>
  <ul class="writing-list">
    {% assign archived = site.posts | where: "archived", true %}
    {% for item in archived %}{% include writing-entry.html item=item show_date=true %}{% endfor %}
  </ul>
</div>
