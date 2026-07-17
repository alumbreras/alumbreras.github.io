---
layout: post
title: From Alan Turing to ChatGPT
tags: artificial-intelligence
---
(This article has been translated from its <a href="https://albertolumbreras.net/posts/ChatGPT.html">Spanish version</a> by ChatGPT)

In 1936, Alan Turing published an article that marked a turning point in the perception of what machines could achieve. Turing addressed the issue of computability, defining as _computable_ those mathematical problems that can be solved through a step-by-step process, an _algorithm_. Turing gave us both bad and good news. The bad news is that certain mathematical problems lack an algorithmic solution. The good news is that for the rest of the problems, there is an algorithm that solves them, and this algorithm is reproducible by a mechanical device with a set of very basic operations called a "**Turing machine**".

The creation of the first computers, practical equivalents of the Turing machine, inspired some scientists to consider whether human thought could be replicated algorithmically. Thus, in the summer of 1956, a group of ten scientists gathered at Dartmouth College to explore the possibility of simulating every aspect of intelligence through machines. They named this research program "**Artificial Intelligence**" (AI).

The field of AI was born from various "**schools of thought**" that have evolved and branched out over the past half-century. Interestingly, the school that currently dominates the field, the connectionist school, inherits much from a branch called cybernetics, which was not invited to the Dartmouth meeting due to rivalries between its representative, Norbert Wiener, and the meeting organizers. Cybernetics is the study of automatic systems that use feedback mechanisms to improve themselves.

The **connectionist** school owes its success to the idea of using "artificial neural networks" as the mechanism for learning through that feedback. Neural networks are inspired by the neural connections in the human brain. A neuron activates if a sufficient number of neurons connected to it also activate. More precisely, each neuron adjusts the importance it gives to the activation of each neighbor. These adjustments are updated throughout the network until the neurons in the output layer generate the correct output for the given input examples. This protocol is called "training." The idea of neural networks already existed in the 1970s. Their resounding success in the last decade is due to two key elements. On the one hand, the availability of **computing power** that allows for giant neural networks that barely fit in the memory of a single computer. On the other hand, the availability, thanks to the internet, of astronomical amounts of **examples** with which to "train" these giant neural networks. Since 2010, giant neural networks (technically called *deep*) have achieved human-level performance in tasks such as image recognition and even automatic translation.

In 2017, the next revolution in the field of AI began to take shape. A group of Google researchers proposed a type of neural network called "**transformers**," whose main innovation was that it could be trained on thousands of processors in parallel, thus multiplying the amount of training data. It was here that an unexpected discovery occurred. Another group of researchers from OpenAI trained a neural network to behave like what is known as a "language model," which consists of the simple task of predicting the next word in a text corpus. That is, if we present the phrase "the dog of San Roque has no" to the system, we will give positive feedback if the output is "tail" and negative feedback if it is anything else. They observed that, when the corpus was large and diverse enough, the network somehow **encoded an internal representation of the world**, which allowed it to be used for many other tasks for which it had not been explicitly trained: text summarization, explaining jokes, logical reasoning. They called these models **Generative Pre-trained Transformers** (GPT).

In 2022, OpenAI researchers added two new training stages to their latest GPT-3 model, one consisting of presenting examples of questions and answers, and a final one where human evaluators (Nigerian workers) numerically rated these answers. Since this allowed the model to acquire the ability to fluidly converse with users, they called it **ChatGPT**. The quality of the responses given by ChatGPT has surprised even its own creators, who have warned of the need for a regulatory framework to limit the misuse of these technologies.

A few months after ChatGPT's release, Microsoft became OpenAI's largest investor with 49% ownership of the company. Other tech giants like Meta and Google have also released their own versions (Llama and Gemini), and open-source initiatives are multiplying, attempting to train similar models for public availability.

What ChatGPT envisions is not simply another AI system confined to certain applications. The potential of these types of models has placed us on the brink of a technological revolution with social and economic consequences that are difficult to predict, perhaps on the order of the steam engine or the internet. Among the possibilities illuminated by these systems are a new wave of process automation or digital assistants for all kinds of tasks, from professional (most computer programmers already use code generated by these systems in their daily work) to domestic.

## The Real Challenges of AI

Our anthropomorphic tendency, along with our phobias and philias fueled by science fiction, have generated debates about whether these machines will be able to feel like us, or even rebel against us. Even linguists like Chomsky strive to make it clear that [ChatGPT does not *really* think](https://sinpermiso.info/textos/la-falsa-promesa-de-chatgpt). But without minimizing the importance of the new perspectives these advances may bring to fields like philosophy, linguistics, or psychology, in a sense, asking whether the machine thinks like a human is like asking whether a submarine "swims" like a fish. The fact that the machine does not think like a human does not diminish the effects its emergence will have on our societies.

Since the last internet revolution, the dream of a utopia of shared knowledge coexists (more poorly than well) with the monopolistic nightmare and concentration of power already seen in the analog world. Similarly, the AI revolution is pregnant with both utopia and dystopia. Beyond metaphysical musings about what intelligence is or whether human intelligence is the only possible intelligence, the real challenges posed by this new technology are much more tangible.

#### Control of the Means of Production (GPUs)

The means of production in the era of large language models (LLMs) are special processors called GPUs, manufactured almost exclusively by NVIDIA. To train ChatGPT, OpenAI used 1000 GPU processors for a month, which, between hardware and electricity, cost about 4 million dollars. It is estimated that future versions will cost around 2.5 billion euros (https://mpost.io/gpt-5-training-will-cost-2-5-billion-and-start-next-year/). Very few public or private institutions can afford this kind of expenditure. The largest GPU purchase to date has been announced by Princeton, which has secured 9 million dollars to buy 300 GPUs, far below the capabilities of private industry. Even so, Princeton has been lucky, as NVIDIA is rejecting orders from most customers to focus on the needs of the big players.

The concentration of these means of production in a few hands raises issues such as the opacity of their models. Without access to the data used by these companies to train their models, we cannot properly analyze the biases they internalize from these data. Thus, the models may end up asserting things like "a man is to a doctor what a woman is to a nurse," or that a black person appearing in a photo dressed in civilian clothes at the prison door is an inmate and a white person in the same context is a prison officer. Controlling such biases is essential as these models are incorporated into decision-making processes in fields such as human resources, medicine, or justice.

The creation of open-source, open and transparent models is the only way to ensure democratic control and access to these.

#### The Theft of Raw Materials (Data)

If GPUs are the means of production, data are the raw materials that these means transform into knowledge-commodities. AI models are trained using large volumes of data, which often include texts, images, and other types of content produced by humans without profit motive. From forum responses to YouTube videos, including computer code shared with the community for free use.

This exploitation of public information and user-created content poses an ethical and legal dilemma. Some illustrators and graphic artists have already expressed concerns about how large tech companies use their works to train image generation models without their explicit permission or compensation. These concerns have intensified with the creation of models capable of generating art in styles that mimic specific artists.

This unconsented appropriation of the commons recalls the processes of primitive capital accumulation through the appropriation of communal lands, in the sense that such appropriation is forced and, once achieved, will be difficult to undo.

#### Environmental Impacts

If, as journalist Guillaume Pitron explains in his book "The Digital Hell," the internet already consumes 10% of the world's electricity and accounts for 4% of CO2 emissions, it is expected that large language models will quickly increase this bill. Training a model like ChatGPT consumes the same as 1000 North American households in a year (10GWh). Once trained, each user query consumes ten times more than a Google query (a total of 1GWh per day). Not counting the generation of sound, images, and especially video, capabilities that have already begun to be incorporated into these systems.

Currently, there is a race toward more energy-efficient models. This could even reduce global CO2 emissions if AI were used to optimize current production chains. However, in the framework of consumer society, it is expected that Jevon's paradox will be fulfilled again, where the improvement in the efficiency in the use of a resource increases the total consumption of that resource.

#### Surplus Value

The incorporation of language models into value chains is already increasing productivity. Like all preceding technology, we cannot expect this productivity increase to result in reduced working hours or higher wages. On the contrary, shareholders see this technology as a new cost-cutting opportunity. The translators' guild

, for example, where self-employed workers are abundant, is already seeing agencies not only expecting faster translations but also pressing rates downwards.

The battle is again to avoid a new source of surplus value for shareholders, at least through taxes. Otherwise, the theft would be double since the vast majority of the advances that have led to current AI models have been funded by public funds.