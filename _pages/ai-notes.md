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

{% if unlisted_notes.size > 0 %}
<div style="margin-top: 30px; padding: 15px; background-color: #fff3cd; border-left: 4px solid #ffc107;">
  <h4 style="margin-top: 0; color: #856404;">⚠️ Other Articles (not yet ordered)</h4>
  <ul class='posts'>
    {% for note in unlisted_notes %}
      <li><a href="{{ note.url }}">{{ note.title }}</a></li>
    {% endfor %}
  </ul>
</div>
{% endif %}

---

## Large Language Models and Agents

{% assign llm_notes = site.ai_notes | where: "category", "Large Language Models and Agents" %}

<!-- Manual ordered list by complexity -->
{% capture llm_manual_titles %}
Proximal Policy Optimization (PPO)
Direct Preference Optimization (DPO)
Group Relative Policy Optimization (GRPO)
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

{% if llm_unlisted_notes.size > 0 %}
<div style="margin-top: 30px; padding: 15px; background-color: #fff3cd; border-left: 4px solid #ffc107;">
  <h4 style="margin-top: 0; color: #856404;">⚠️ Other Articles (not yet ordered)</h4>
  <ul class='posts'>
    {% for note in llm_unlisted_notes %}
      <li><a href="{{ note.url }}">{{ note.title }}</a></li>
    {% endfor %}
  </ul>
</div>
{% endif %}

---

## Hands-on

{% assign handson_notes = site.ai_notes | where: "category", "Hands-on" %}

<!-- Manual ordered list -->
{% capture handson_manual_titles %}
Fine-tuning an LLM for Meal Planning
{% endcapture %}
{% assign handson_manual_list = handson_manual_titles | split: "
" %}

<div>
  <ul class='posts'>
    {% for title_raw in handson_manual_list %}
      {% assign title = title_raw | strip %}
      {% if title != "" %}
        {% assign note = handson_notes | where: "title", title | first %}
        {% if note %}
          <li><a href="{{ note.url }}">{{ note.title }}</a></li>
        {% endif %}
      {% endif %}
    {% endfor %}
  </ul>
</div>

<!-- Show articles not in the manual list -->
{% assign handson_unlisted_notes = "" | split: "" %}
{% for note in handson_notes %}
  {% assign is_listed = false %}
  {% for title_raw in handson_manual_list %}
    {% assign title = title_raw | strip %}
    {% if note.title == title %}
      {% assign is_listed = true %}
      {% break %}
    {% endif %}
  {% endfor %}
  {% unless is_listed %}
    {% assign handson_unlisted_notes = handson_unlisted_notes | push: note %}
  {% endunless %}
{% endfor %}

{% if handson_unlisted_notes.size > 0 %}
<div style="margin-top: 30px; padding: 15px; background-color: #fff3cd; border-left: 4px solid #ffc107;">
  <h4 style="margin-top: 0; color: #856404;">⚠️ Other Articles (not yet ordered)</h4>
  <ul class='posts'>
    {% for note in handson_unlisted_notes %}
      <li><a href="{{ note.url }}">{{ note.title }}</a></li>
    {% endfor %}
  </ul>
</div>
{% endif %}
