



---
date: 2025-03-31
featured_image: "https://cdn-images-1.medium.com/max/1024/0*IzTuMFMlK7ZKN5LV"
tags: ["social-science","ai","polling"]
title: "AI in Social Research and Polling"
disable_share: false
---
      


What do we do when nobody answers the phone?

This month, I’m going to be discussing a really interesting topic that I came across in a
[recent draft paper by a professor at the University of Maryland named M. R. Sauter](https://oddletters.com/files/2025/02/Psychotic-Ecologies-working-paper-Jan-2025.pdf)
. In the paper, they discuss (among other things) the phenomenon of social scientists and pollsters trying to employ AI tools to help overcome some of the challenges in conducting social science human subjects research and polling, and point out some major flaws with these approaches. I had some additional thoughts that were inspired by the topic, so let’s talk about it!

### Hi, can I ask you a short series of questions?

Let’s start with a quick discussion of why this would be necessary in the first place. Doing social science research and polling is extraordinarily difficult in the modern day. A huge part of this is simply due to the changes in how people connect and communicate — namely, cellphones- making it incredibly hard to get access to a random sampling of individuals who will participate in your research.

To contextualize this, when I was an undergraduate sociology student almost 25 years ago, in research methods class we were taught that a good way to randomly sample people for large research studies was to just take the area code and 3 digit phone number prefix for an area, and randomly generate selections of four digits to complete them, and call those numbers. In those days, before phone scammers became the bane of all our lives, people would answer and you could ask your research questions. Today, on the other hand, this kind of method for trying to get a representative sample of the public is almost laughable. Scarcely anyone answers calls from unknown numbers in their daily lives, outside of very special situations (like when you’re waiting for a job interviewer to call).

So, what do researchers do now? Today, you can sometimes pay gig workers for poll participation, although Amazon MTurk workers or Upworkers are not necessarily representative of the entire population. The sample you can get will have some bias, which has to be accounted for with sampling and statistical methods. A bigger barrier is that these people’s time and effort costs money, which pollsters and academics are loath to part with (and in the case of academics, increasingly they do not have).

What else? If you’re like me, you’ve probably gotten an unsolicited polling text before as well- these are interesting, because they could be legitimate, or they could be scammers out to get your data or money, and it’s tremendously difficult to tell the difference. As a sociologist, I have a soft spot for doing polls and answering surveys to help other social scientists, and I don’t even trust these to click through, more often than not. They’re also a demand on your time, and many people are too busy even if they trust the source.

> The entire industry of polling depends on being able to get a diverse sample of people from all walks of life on the telephone, and convincing them to give you their opinion about something.

Regardless of the attempted solutions and their flaws, this problem matters. The entire industry of polling depends on being able to get a diverse sample of people from all walks of life on the telephone, and convincing them to give you their opinion about something. This is more than just a problem for social scientists doing academic work, because polling is a massive industry unto itself with a lot of money on the line.

### Do we *really* need the humans?

Can AI help with this problem in some way? If we involve generative AI in this task, what might that look like? Before we get to practical ways to attack this, I want to discuss a concept
[Sauter](https://oddletters.com/files/2025/02/Psychotic-Ecologies-working-paper-Jan-2025.pdf)
proposes called “AI imaginaries” — essentially, the narratives and social beliefs we hold about what AI really is, what it can do, and what value it can create. This is hard to pin down, partly because of a “strategic vagueness” about the whole idea of AI. Longtime readers will know I have struggled mightily with figuring out whether and how to even reference the term “AI” because it is such an overloaded and conflicted term.

However, we can all think of potentially problematic beliefs and expectations about AI that we encounter implicitly or explicitly in society, such as the idea that AI is inherently a channel for social progress, or that using AI instead of employing human people for tasks is inherently good, because of “efficiency”. I’ve talked about many of these concepts in my other columns, because I think challenging the accuracy of our assumptions is important to help us suss out what the true contributions of AI to our world can really be. Flawed assumptions can lead us to buy into undeserved hype or overpromising that the tech industry can be unfortunately prone to.

In the context of applying AI to social science research, some of
[Sauter’s](https://oddletters.com/files/2025/02/Psychotic-Ecologies-working-paper-Jan-2025.pdf)
components of the AI imaginary include:

* expectations that AI can be relied upon as a source of truth
* believing that everything meaningful can be measured or quantified, and
* (perhaps most problematically) asserting that there is some equivalency between the output of human intelligence or creativity and the output of AI models

> Flawed assumptions can lead us to buy into undeserved hype or overpromising that the tech industry can be unfortunately prone to.

### What have they tried?

With this framework if thinking in mind, let’s look at a few of the specific approaches people have taken to fixing the difficulties in finding real human beings to involve in research using AI. Many of these techniques have a common thread in that they give up on trying to actually get access to individuals for the research, and instead just ask LLMs to answer the questions instead.

In one case, an AI startup offers to use LLMs to run your polling for you, instead of actually asking any people at all. They mimic electoral demographics as closely as possible and build samples almost like “digital twin” entities. (
[Notably, they were predicting the eventual US general election result wrong](https://www.semafor.com/article/09/20/2024/ai-startup-aaru-uses-chatbots-instead-of-humans-for-political-polls)
in a September 2024 article.)

[Sauter](https://oddletters.com/files/2025/02/Psychotic-Ecologies-working-paper-Jan-2025.pdf)
cites a number of other research approaches applying similar techniques, including testing whether the LLM would change its answers to opinion questions when exposed to media with particular leanings or opinions (eg, replicating the effect of news on public opinion), attempting to specifically emulate human subgroups using LLMs, believing that this can overcome algorithmic bias, and testing whether the poll responses of LLMs are distinguishable from human answers to the lay person.

### Does it work?

Some defend these strategies by arguing that their LLMs can be made to produce answers that approximately match the results of real human polling, but simultaneously argue that human polling is no longer accurate enough to be usable. This brings up the obvious question of, if the human polling is not trustworthy, how is it trustworthy enough to be the benchmark standard for the LLMs?

Furthermore, if the LLM’s output today can be made to match what we think we know about human opinions, that doesn’t mean that output will continue to match human beliefs or the opinions of the public in the future. LLMs are constantly being retrained and developed, and the dynamics of public opinions and perspectives are fluid and variable. One validation today, even if successful, doesn’t promise anything about another set of questions, on another topic, at another time or in another context. Assumptions about this future dependability are consequences of the fallacious expectation that LLMs can be trusted and relied upon as sources of truth,
[when that is not now and never has been the purpose of these models](https://www.stephaniekirmer.com/writing/howdoweknowifaiissmokeandmirrors/)
.

We should always take a step back and remember what LLMs are built for, and what their actual objectives are. As
[Sanders et al](https://hdsr.mitpress.mit.edu/pub/dm2hrtx0/release/1)
notes, “LLMs generate a response predicted to be most acceptable to the user on the basis of a training process such as reinforcement learning with human feedback”. They’re trying to estimate the next word that will be appealing to you, based on the prompt you have provided — we should not start to fall into mythologizing that suggests the LLM is doing anything else.

When an LLM produces an unexpected response, it’s essentially because a certain amount of randomness is built in to the model — from time to time, in order to sound more “human” and dynamic, instead of choosing the next word with the highest probability, it’ll choose a different one further down the rankings. This randomness is not based on an underlying belief, or opinion, but is just built in to avoid the text sounding robotic or dull. However, when you use an LLM to replicate human opinions, these become outliers that are absorbed into your data. How does this methodology interpret such responses? In real human polling, the outliers may contain useful information about minority perspectives or the fringes of belief — not the majority, but still part of the population. This opens up a lot of questions about how our interpretation of this artificial data can be conducted, and what inferences we can actually draw.

### On synthetic data

This topic overlaps with the broader concept of synthetic data in the AI space. As the quantities of unseen organically human generated content available for training LLMs dwindle, studies have attempted to see whether you could bootstrap your way to better models, namely by making an LLM generate new data, then using that to train on.
[This fails, causing models to collapse](https://futurism.com/ai-trained-ai-generated-data-interview)
, in a form that
[Jathan Sadowski](https://www.jathansadowski.com/)
named “Habsburg AI”.

What this teaches us is that
[there is more that differentiates the stuff that LLMs produce from organically human generated content than we can necessarily detect](https://www.stephaniekirmer.com/writing/theculturalimpactofaigeneratedcontentpart1/)
. Something is different about the synthetic stuff, even if we can’t totally identify or measure what it is, and we can tell this is the case because the end results are so drastically different. I’ve talked before about the complications and challenges around human detection of synthetic content, and it’s clear that just because humans may not be able to easily and obviously tell the difference, that doesn’t mean there is none.

> [J]ust because humans may not be able to easily and obviously tell the difference, that doesn’t mean there is none.

We might also be tempted by the argument that, well, polling is increasingly unreliable and inaccurate, because we have no more easy, free access to the people we want to poll, so this AI mediated version might be the best we can do. If it’s better than the status quo, what’s wrong with trying?

### Is it a good idea?

Whether or not it works, is this the right thing to do? This is the question that most users and developers of such technology don’t take much note of. The tech industry broadly is often guilty of this — we ask whether something is effective, for the immediate objective we have in mind, but we may skip over the question of whether we should do it anyway.

I’ve spent a lot of time recently thinking about why these approaches to polling and research worry me.
[Sauter](https://oddletters.com/files/2025/02/Psychotic-Ecologies-working-paper-Jan-2025.pdf)
makes the argument that this is inherently corrosive to social participation, and I’m inclined to agree in general. There’s something troubling about determining that because people are difficult or expensive to use, that we toss them aside and use technological mimicry to replace them. The validity of this depends heavily on what the task is, and what the broader impact on people and society would be.
[Efficiency is not the unquestionable good that we might sometimes think](https://www.stephaniekirmer.com/writing/generativeaiandcivicinstitutions/)
.

For one thing, people have increasingly begun to learn that our data (including our opinions) has monetary and social value, and it isn’t outrageous for us to want to get a piece of that value. We’ve been giving our opinions away for free for a long time, but I sense that’s evolving. These days retailers regularly offer discounts and deals in exchange for product reviews, and as I noted earlier, MTurkers and other gig workers can rent out their time and get paid for polling and research projects. In the case of commercial polling, where a good deal of the energy for this synthetic polling comes from, substituting LLMs sometimes feels like a method for making an end run around the pesky human beings who don’t want to contribute to someone else’s profits for free.

> If we assume that the LLM can generate accurate polls, we are assuming a state of determinism that runs counter to the democratic project.

But setting this aside, there’s a social message behind these efforts that I don’t think we should minimize. Teaching people that their beliefs and opinions are replaceable with technology sets a precedent that can unintentionally spread. If we assume that the LLM can generate accurate polls, we are assuming a state of determinism that runs counter to the democratic project, and expects democratic choices to be predictable. We may think we know what our peers believe, maybe even just by looking at them or reading their profiles, but in the US, at least, we still operate under a voting model that lets that person have a secret ballot to elect their representation. They are at liberty to make their choice based on any reasoning, or none at all. Presuming that we don’t actually have the free will to change our mind in the privacy of the voting booth just feels dangerous. What’s the argument, if we accept the LLMs instead of real polls, that this can’t be spread to the voting process itself?

I haven’t even touched on the issue of trust that keeps people from honestly responding to polls or research surveys, which is an additional sticking point. Instead of going to the source and really interrogating what it is in our social structure that makes people unwilling to honestly state their sincerely held beliefs to peers, we again see the approach of just throwing up our hands and eliminating people from the process altogether.

### Sweeping social problems under an LLM rug

It just seems really troubling that we are considering using LLMs to paper over the social problems getting in our way. It feels similar to
[a different area I’ve written about](https://www.stephaniekirmer.com/writing/seeingourreflectioninllms/)
, the fact that LLM output replicates and mimics the bigotry and harmful content that it finds in training data. Instead of taking a deeper look at ourselves, and questioning why this is in the organically human created content, some people propose censoring and heavily filtering LLM output, as an attempt to hide this part of our real social world.

I guess it comes down to this: I’m not in favor of resorting to LLMs to avoid trying to solve real social problems. I’m not convinced we’ve really tried, in some cases, and in other cases like the polling, I’m deeply concerned that we’re going to create even more social problems by using this strategy. We have a responsibility to look beyond the narrow scope of the issue we care about at this particular moment, and anticipate cascading externalities that may result.

Read more of my work at
[www.stephaniekirmer.com](http://www.stephaniekirmer.com)
.

### Further Reading

M. R. Sauter, 2025.
<https://oddletters.com/files/2025/02/Psychotic-Ecologies-working-paper-Jan-2025.pdf>

* [How Do We Know if AI Is Smoke and Mirrors?](https://www.stephaniekirmer.com/writing/howdoweknowifaiissmokeandmirrors/)
* [Demonstrations of the Potential of AI-based Political Issue Polling](https://hdsr.mitpress.mit.edu/pub/dm2hrtx0/release/1)
* [No people, no problem: AI chatbots predict elections better than humans](https://www.semafor.com/article/09/20/2024/ai-startup-aaru-uses-chatbots-instead-of-humans-for-political-polls)
* [Using AI for Political Polling - Ash Center](https://ash.harvard.edu/articles/using-ai-for-political-polling/)
* [The Cultural Impact of AI Generated Content: Part 1](https://www.stephaniekirmer.com/writing/theculturalimpactofaigeneratedcontentpart1/)
* [Out of One, Many: Using Language Models to Simulate Human Samples | Political Analysis | Cambridge Core](https://www.cambridge.org/core/journals/political-analysis/article/abs/out-of-one-many-using-language-models-to-simulate-human-samples/035D7C8A55B237942FB6DBAD7CAA4E49)
* [Jathan Sadowski](https://www.jathansadowski.com/)
* [When AI Is Trained on AI-Generated Data, Strange Things Start to Happen](https://futurism.com/ai-trained-ai-generated-data-interview)
* [Seeing Our Reflection in LLMs](https://www.stephaniekirmer.com/writing/seeingourreflectioninllms/)


