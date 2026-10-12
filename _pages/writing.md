---
layout: default
title: Writing
permalink: /writing.html
# Unpublished draft notes: send their old URLs here instead of a 404
redirect_from:
  - /ai-notes/00_Introduction_to_Agents/
  - /ai-notes/00_Introduction_to_Large_Language_Models/
  - /ai-notes/00_Introduction_to_Paper_Reviews/
  - /ai-notes/00_Introduction_to_Stats_and_Machine_Learning/
  - /ai-notes/Agent_design_patterns/
  - /ai-notes/Attention/
  - /ai-notes/DPO/
  - /ai-notes/Expectation_Maximization/
  - /ai-notes/Fine_tuning_LLM_meal_planning/
  - /ai-notes/GRPO/
  - /ai-notes/Gibbs_Sampling/
  - /ai-notes/Importance_Sampling/
  - /ai-notes/Metropolis_Hastings/
  - /ai-notes/On_training_agents/
  - /ai-notes/PPO/
  - /ai-notes/RLAIF/
  - /ai-notes/RLVF/
  - /ai-notes/Structured_outputs_and_tool_calling/
  - /ai-notes/Tokenization/
  - /ai-notes/Variational_Autoencoders/
  - /ai-notes/What_is_an_agent/
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
