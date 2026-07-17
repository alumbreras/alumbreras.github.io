---
layout: default
title: AI Notes
permalink: /ai-notes.html
---

# AI Notes

Welcome to my AI Notes - a collection of technical articles where I document concepts, papers, and insights as I learn and explore the field of Artificial Intelligence and Machine Learning.

This is a work in progress, evolving between individual notes and potentially a more structured book format.

---

## Stats and Machine Learning

{% assign ml_notes = site.ai_notes | where: "category", "Stats and Machine Learning" %}

<!-- Manual ordered list by complexity -->
{% capture manual_titles %}
Biased and unbiased estimators
La maldición de la multidimensionalidad
Importance Sampling
Metropolis-Hastings Algorithm
Gibbs Sampling
Variational Inference
Variational Autoencoders (VAE)
Non-negative Matrix Factorization (Lee and Seung algorithm)
The Chinese Restaurant Process
Generating distributions with the Stick Breaking version of the Dirichlet Process
{% endcapture %}
{% assign manual_list = manual_titles | split: "
" %}

<div>
  <ul class='posts'>
    {% for title_raw in manual_list %}
      {% assign title = title_raw | strip %}
      {% if title != "" %}
        {% assign note = ml_notes | where: "title", title | first %}
        {% if note %}
          <li><a href="{{ note.url }}">{{ note.title }}</a></li>
        {% endif %}
      {% endif %}
    {% endfor %}
  </ul>
</div>

<!-- Show articles not in the manual list -->
{% assign unlisted_notes = "" | split: "" %}
{% for note in ml_notes %}
  {% assign is_listed = false %}
  {% for title_raw in manual_list %}
    {% assign title = title_raw | strip %}
    {% if note.title == title %}
      {% assign is_listed = true %}
      {% break %}
    {% endif %}
  {% endfor %}
  {% unless is_listed %}
    {% assign unlisted_notes = unlisted_notes | push: note %}
  {% endunless %}
{% endfor %}

<!-- Hands-on subsection for Stats and ML -->
{% assign handson_notes = site.ai_notes | where: "category", "Hands-on" %}
{% capture ml_handson_titles %}
{% endcapture %}
{% assign ml_handson_list = ml_handson_titles | split: "
" %}

{% assign ml_handson_articles = "" | split: "" %}
{% for title_raw in ml_handson_list %}
  {% assign title = title_raw | strip %}
  {% if title != "" %}
    {% assign note = handson_notes | where: "title", title | first %}
    {% if note %}
      {% assign ml_handson_articles = ml_handson_articles | push: note %}
    {% endif %}
  {% endif %}
{% endfor %}

{% if ml_handson_articles.size > 0 %}
### Hands-on

<div>
  <ul class='posts'>
    {% for note in ml_handson_articles %}
      <li><a href="{{ note.url }}">{{ note.title }}</a></li>
    {% endfor %}
  </ul>
</div>
{% endif %}

---

## Large Language Models

{% assign llm_notes = site.ai_notes | where: "category", "Large Language Models" %}

<!-- Manual ordered list by complexity -->
{% capture llm_manual_titles %}
Tokenization
Attention Mechanisms
Proximal Policy Optimization (PPO)
Direct Preference Optimization (DPO)
Group Relative Policy Optimization (GRPO)
Reinforcement Learning from AI Feedback (RLAIF)
Reinforcement Learning from Visual Feedback (RLVF)
{% endcapture %}
{% assign llm_manual_list = llm_manual_titles | split: "
" %}

<div>
  <ul class='posts'>
    {% for title_raw in llm_manual_list %}
      {% assign title = title_raw | strip %}
      {% if title != "" %}
        {% assign note = llm_notes | where: "title", title | first %}
        {% if note %}
          <li><a href="{{ note.url }}">{{ note.title }}</a></li>
        {% endif %}
      {% endif %}
    {% endfor %}
  </ul>
</div>

<!-- Show articles not in the manual list -->
{% assign llm_unlisted_notes = "" | split: "" %}
{% for note in llm_notes %}
  {% assign is_listed = false %}
  {% for title_raw in llm_manual_list %}
    {% assign title = title_raw | strip %}
    {% if note.title == title %}
      {% assign is_listed = true %}
      {% break %}
    {% endif %}
  {% endfor %}
  {% unless is_listed %}
    {% assign llm_unlisted_notes = llm_unlisted_notes | push: note %}
  {% endunless %}
{% endfor %}

<!-- Hands-on subsection for LLMs -->
{% capture llm_handson_titles %}
Fine-tuning an LLM for Meal Planning
{% endcapture %}
{% assign llm_handson_list = llm_handson_titles | split: "
" %}

{% assign llm_handson_articles = "" | split: "" %}
{% for title_raw in llm_handson_list %}
  {% assign title = title_raw | strip %}
  {% if title != "" %}
    {% assign note = handson_notes | where: "title", title | first %}
    {% if note %}
      {% assign llm_handson_articles = llm_handson_articles | push: note %}
    {% endif %}
  {% endif %}
{% endfor %}

{% if llm_handson_articles.size > 0 %}
### Hands-on

<div>
  <ul class='posts'>
    {% for note in llm_handson_articles %}
      <li><a href="{{ note.url }}">{{ note.title }}</a></li>
    {% endfor %}
  </ul>
</div>
{% endif %}

---

## Agents

{% assign agents_notes = site.ai_notes | where: "category", "Agents" %}

<!-- Manual ordered list by complexity -->
{% capture agents_manual_titles %}
What is an Agent?
Structured Outputs and Tool Calling
Agent Design Patterns
On Training Agents
{% endcapture %}
{% assign agents_manual_list = agents_manual_titles | split: "
" %}

<div>
  <ul class='posts'>
    {% for title_raw in agents_manual_list %}
      {% assign title = title_raw | strip %}
      {% if title != "" %}
        {% assign note = agents_notes | where: "title", title | first %}
        {% if note %}
          <li><a href="{{ note.url }}">{{ note.title }}</a></li>
        {% endif %}
      {% endif %}
    {% endfor %}
  </ul>
</div>

<!-- Show articles not in the manual list -->
{% assign agents_unlisted_notes = "" | split: "" %}
{% for note in agents_notes %}
  {% assign is_listed = false %}
  {% for title_raw in agents_manual_list %}
    {% assign title = title_raw | strip %}
    {% if note.title == title %}
      {% assign is_listed = true %}
      {% break %}
    {% endif %}
  {% endfor %}
  {% unless is_listed %}
    {% assign agents_unlisted_notes = agents_unlisted_notes | push: note %}
  {% endunless %}
{% endfor %}

<!-- Hands-on subsection for Agents -->
{% capture agents_handson_titles %}
{% endcapture %}
{% assign agents_handson_list = agents_handson_titles | split: "
" %}

{% assign agents_handson_articles = "" | split: "" %}
{% for title_raw in agents_handson_list %}
  {% assign title = title_raw | strip %}
  {% if title != "" %}
    {% assign note = handson_notes | where: "title", title | first %}
    {% if note %}
      {% assign agents_handson_articles = agents_handson_articles | push: note %}
    {% endif %}
  {% endif %}
{% endfor %}

{% if agents_handson_articles.size > 0 %}
### Hands-on

<div>
  <ul class='posts'>
    {% for note in agents_handson_articles %}
      <li><a href="{{ note.url }}">{{ note.title }}</a></li>
    {% endfor %}
  </ul>
</div>
{% endif %}

---

## Paper Reviews

{% assign paper_notes = site.ai_notes | where: "category", "Paper Reviews" %}

<!-- Manual ordered list -->
{% capture paper_manual_titles %}
{% endcapture %}
{% assign paper_manual_list = paper_manual_titles | split: "
" %}

<div>
  <ul class='posts'>
    {% for title_raw in paper_manual_list %}
      {% assign title = title_raw | strip %}
      {% if title != "" %}
        {% assign note = paper_notes | where: "title", title | first %}
        {% if note %}
          <li><a href="{{ note.url }}">{{ note.title }}</a></li>
        {% endif %}
      {% endif %}
    {% endfor %}
  </ul>
</div>

<!-- Show articles not in the manual list -->
{% assign paper_unlisted_notes = "" | split: "" %}
{% for note in paper_notes %}
  {% assign is_listed = false %}
  {% for title_raw in paper_manual_list %}
    {% assign title = title_raw | strip %}
    {% if note.title == title %}
      {% assign is_listed = true %}
      {% break %}
    {% endif %}
  {% endfor %}
  {% unless is_listed %}
    {% assign paper_unlisted_notes = paper_unlisted_notes | push: note %}
  {% endunless %}
{% endfor %}

---

## Miscellaneous

<div>
  <ul class='posts'>
    {% for note in unlisted_notes %}
      <li><a href="{{ note.url }}">{{ note.title }}</a></li>
    {% endfor %}
    {% for note in llm_unlisted_notes %}
      <li><a href="{{ note.url }}">{{ note.title }}</a></li>
    {% endfor %}
    {% for note in agents_unlisted_notes %}
      <li><a href="{{ note.url }}">{{ note.title }}</a></li>
    {% endfor %}
    {% for note in paper_unlisted_notes %}
      <li><a href="{{ note.url }}">{{ note.title }}</a></li>
    {% endfor %}
  </ul>
</div>

---

<!-- Collect all hands-on articles that are already listed in subsections -->
{% assign all_categorized_handson = "" | split: "" %}
{% for note in ml_handson_articles %}
  {% assign all_categorized_handson = all_categorized_handson | push: note %}
{% endfor %}
{% for note in llm_handson_articles %}
  {% assign all_categorized_handson = all_categorized_handson | push: note %}
{% endfor %}
{% for note in agents_handson_articles %}
  {% assign all_categorized_handson = all_categorized_handson | push: note %}
{% endfor %}

<!-- Find uncategorized hands-on articles -->
{% assign uncategorized_handson = "" | split: "" %}
{% for note in handson_notes %}
  {% assign is_categorized = false %}
  {% for categorized_note in all_categorized_handson %}
    {% if note.url == categorized_note.url %}
      {% assign is_categorized = true %}
      {% break %}
    {% endif %}
  {% endfor %}
  {% unless is_categorized %}
    {% assign uncategorized_handson = uncategorized_handson | push: note %}
  {% endunless %}
{% endfor %}

{% if uncategorized_handson.size > 0 %}
## Hands-on

<div>
  <ul class='posts'>
    {% for note in uncategorized_handson %}
      <li><a href="{{ note.url }}">{{ note.title }}</a></li>
    {% endfor %}
  </ul>
</div>

---
{% endif %}

