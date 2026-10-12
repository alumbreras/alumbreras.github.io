---
layout: default
---

<div class="page-narrow">
    <div class="centered-content">
        <h1>Alberto Lumbreras</h1>
        <h2 class="headline">Staff Research Scientist</h2>
        <h3 class="headline">Paris (France) - Barcelona (Spain)</h3>
    </div>

    <figure class="home-banner">
        <img src="{{site.baseurl}}/assets/img/metamorphose-1.jpg" alt="Metamorphosis" />
        <figcaption>Escher, M.C. (1937). <i>Metamorphosis I.</i></figcaption>
    </figure>

    <div class="maintext home-intro">
        <p>I'm a Staff Research Scientist at <a href="https://ailab.criteo.com/">Criteo AI Lab</a>, where I work on AI agents and on bridging research and engineering. This site is where I distill my thoughts and notes on AI.</p>
    </div>

    <h2 class="writing-year">Recent writing</h2>
    {% include writing-items.html %}
    <ul class="writing-list">
        {% for item in writing_items limit: 5 %}{% include writing-entry.html item=item show_date=true %}{% endfor %}
    </ul>
    <p><a href="/writing.html">All writing →</a></p>
</div>
