---
layout: default
---

<div class="page-narrow">
    <div class="centered-content">
        <h1>Alberto Lumbreras</h1>
        <h2 class="headline">AI Research Scientist</h2>
        <h3 class="headline">Paris (France) - Barcelona (Spain)</h3>
    </div>

    <div style="text-align: center;">
        <figure style="display: inline-block;">
            <img src="{{site.baseurl}}/assets/img/metamorphose-1.jpg" alt="Metamorphosis" style="max-width: 100%;" />
            <figcaption style="text-align: left; font-size: 0.9em; color: #555;">Escher, M.C. (1937). <i>Metamorphosis I.</i></figcaption>
        </figure>
    </div>

    <div class="maintext home-intro">
        <p>I am a <b>research scientist</b> at <a href="https://ailab.criteo.com/">Criteo AI Lab</a>, where I lead applied projects on generative AI, LLMs and recommender systems together with engineering teams. My publications are in top-tier journals and conferences (<i>see <a href="/research.html">Research</a></i>).</p>
        <p>This is also where I <b>write</b>: about how AI works, how I work with it day to day, and what it is doing to society (<i>see <a href="/writing.html">Writing</a></i>).</p>
    </div>

    <h2 class="writing-year">Recent writing</h2>
    {% include writing-items.html %}
    <ul class="writing-list">
        {% for item in writing_items limit: 5 %}{% include writing-entry.html item=item show_date=true %}{% endfor %}
    </ul>
    <p><a href="/writing.html">All writing →</a></p>
</div>
