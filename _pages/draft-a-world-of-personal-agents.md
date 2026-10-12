---
topic: ai & society
layout: post
date: 2026-10-12
noindex: true
permalink: /drafts/a-world-of-personal-agents-d21fd01c.html
title: A world of personal agents
description: Why the next layer of consumer AI will not be one assistant that does everything, but many specialised agents that remember one part of your life each.
---

{% assign img = "/assets/img/2026-10-12-a-world-of-personal-agents" %}

<p class="archive-note">Draft for review. Not published yet.</p>

The next layer of consumer AI will not be one assistant that does everything. My bet is the opposite: a world of specialised agents, each owning one domain of a person's life and remembering it over months, with the general assistants (ChatGPT, Claude, Gemini) sitting on top and calling them rather than replacing them.

General assistants are brilliant at a request in isolation and know almost nothing about your home. A specialised agent is the reverse.

This is an exercise in imagining what that world looks like. I will argue that a specialist beats a generalist in its own domain for two reasons, what it remembers and the interface it gives you, and then sketch how the pieces could fit together without turning into a mess.

## Two answers to the same request

Start with something mundane. You ask: *"Help me with the shopping for a ratatouille."*

![The same request answered by a general assistant and by a household-aware shopping agent]({{ img }}/same-request-twice.png)

Both answers are correct. Only one of them can be put in a trolley.

On the left, a generic list: seven items, two of which this household already has. The next step is still yours: open the supermarket app and search item by item. On the right, a household-aware basket. It skips what the pantry estimate says is already at home, picks the brand you usually buy, asks only what memory cannot answer (whole or minced garlic?), and writes to the list the whole house shares.

The difference is not the model. You could run the same model behind both screens. The difference is everything around it.

## What a generalist does not have

None of the following is a better model. They are state, permissions and habits that live with the person, and that a general assistant would have to rebuild in every conversation.

| | General assistant today | Personal agent |
| --- | --- | --- |
| **Memory over time** | Chat history and a few saved facts | A model of the domain that updates itself: purchase rhythms, pantry levels, training load, sizes with a date |
| **Capture without thinking** | You type a full request | "We're out of milk", by voice, in two seconds, from any screen |
| **The household as the unit** | One account, one person | Several people, shared and private items, who added what |
| **Proactivity** | Answers when asked | "Coffee usually runs out in 3 days" shows up as a suggestion |
| **Accountable actions** | Free text you must re-type somewhere else | Structured cards you confirm; every write has an origin and can be undone |

The general assistants know this, and they are reaching for personal data: connecting your mail, your photos, your calendar. The race is for state, not for model quality. But a pile of connected data is not the same as a model of your pantry, your training plan or your child's shoe size, kept up to date by an agent whose only job is that.

## The interface is half the story

Memory is half of it. The other half, and I would argue the central reason specialists win, is the interface.

Chat is a universal surface, and that is exactly its weakness: it is the same box for every task. A domain deserves a surface shaped to it. A grocery agent is a shared list the whole house edits. A training agent is a plan and a log. A budget agent is a dashboard. A medical agent is a timeline. None of these reads well as a paragraph in a chat window, and none of them is best operated by typing a full sentence.

![Seven personal agents, each with a main screen shaped to its domain rather than a chat]({{ img }}/seven-apps.png)

Look at the main screen of each of these apps: none of them is a chat. Training is a progress chart, groceries a list shared by the household, recipes a book with how often you cooked each one, family gear a set of sizes with dates, travel an itinerary, health a timeline of results, money a budget. The assistant is one tab among others, and the microphone floats on every screen.

The claim is strong on purpose: **even with the same underlying model, the specialist wins because its surface fits the task.** Three properties follow from that and recur in every domain:

- **Capture is near-zero effort.** Voice, a photo of a receipt or a label, a tap from any screen. The friction of writing a full request is where generalists lose the everyday.
- **The unit is often not the individual.** A household, a family, a team. Shared and private items, and a record of who added what.
- **Actions are accountable.** The agent proposes structured cards that you confirm. That is what lets you trust an agent that *acts*, not just one that answers.

## Generalists on top, specialists underneath

If every domain gets its own agent, do we end up with seven more apps to juggle? Not necessarily.

A personal agent does not have to be one more chatbot to open. It can be a tool that any assistant calls through the [Model Context Protocol](https://modelcontextprotocol.io/) (MCP). You keep talking to the assistant you like; the assistant asks the specialist for the facts and the actions it cannot invent.

![A person talks to general assistants, which call seven personal agents through MCP; the agents reach retailers, health providers, banks and travel services with consent]({{ img }}/generalists-and-specialists-v2.png)

I see it arriving in three layers that use the same tools:

1. **Today:** autonomous apps, each with its own agent and interface. People install the ones they need.
2. **Next:** the apps talk to each other through MCP, with explicit consent between them.
3. **Later:** a central agent (yours, or ChatGPT, or Claude) calls each app as a sub-agent.

The central agent is optional. You should be able to open any of the specialised apps directly and get full value from it. And whether the people building these apps will *want* to integrate with each other is an open question. They may have no choice if users come to expect it, or they may prefer to stay closed to protect their data and their business, as some large platforms already do with outside agents.

## Agents that talk to each other

The value compounds when the agents call each other, as long as each one stays the single owner of its domain.

![Seven agents, seven memories, each answering in its own structured card]({{ img }}/seven-agents.png)

Take one request. You ask your assistant to plan the week's dinners. The meal-planning agent does not guess what is at home: it asks the shopping agent what the pantry estimate says, proposes a menu that uses what is there, and writes only the missing items to the shared list. The recipe agent supplies the method and the macros, so when the meal is cooked it is logged against your training plan with the numbers of *your* version of the dish, not a generic one. Three agents, three memories, one request, and no copy of anyone's data living in the wrong place.

The rule that keeps this from becoming a mess is simple: **every piece of data has a single owner, and the other agents link to it rather than copy it.**

Two questions then decide where a feature lives:

- *Whose reason is it?* Planning meals makes sense because of a goal, so an athlete's meal plan belongs to the training agent and the family menu to the shopping agent, and both link to the recipes.
- *Would someone who only has this app miss it?* If not, it does not belong there.

The same shape reaches well beyond the kitchen. A money agent remembers income rhythms, recurring bills and subscriptions; it hands the shopping agent the week's grocery budget and warns you before a subscription renews, and the statements never leave your device. A health agent remembers conditions, medications, appointments and lab results over time. It is the most privacy-sensitive domain of all: everything stays local, it is shared only with explicit consent (with the training agent, for instance, only the injuries), and it organises and remembers rather than diagnoses.

## Why not one agent per task, and why not one agent for everything

There are two ways to get this wrong.

One agent for everything is today's general assistant: brilliant in the moment, amnesic about your life, and stuck with a chat box as its only interface.

One unconnected agent per task is the opposite failure: no shared context across domains ("you just ran a marathon, maybe skip the heavy dinner tonight"), several subscriptions and trust relationships, and nobody with the full picture.

The middle path is domain specialists that share protocols. And that brings what I think is the most underrated property of all: **swappability**. If your fitness agent exposes a standard interface, you can replace it with a better one tomorrow, and your central assistant adapts. That is the user's real leverage, and the reason no single provider should be able to lock the whole stack.

## Open questions

I do not know how this plays out, and several questions seem decisive to me:

- **Who builds the domain agents?** Many will come from the company behind the service: your bank, your supermarket, your health insurer. Then each provider sees only its own slice, and there is room for a neutral agent that aggregates across them, one money agent over several banks.
- **Will those providers open up?** They have good reasons to stay closed: their data, their customer relationship, their ads. They also have reasons to open: users expecting it, regulation (European banks are already required to open account data), and generalists becoming the place where people start.
- **From tools to agents.** Today's specialised apps are mostly passive: they expose data and wait to be called. The interesting step is when each one becomes an agent with its own memory and initiative, one that notices the missing blood-pressure log before your appointment, and coordinates with the others through shared protocols.

What I am fairly confident about is the direction. The models are becoming a commodity; what is scarce is state about a person's life, and an interface that makes keeping that state effortless. That is where I would expect the next good consumer products to come from.
