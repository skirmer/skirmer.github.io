



---
date: 2025-02-01
featured_image: "https://cdn-images-1.medium.com/max/1024/0*ZQwqwXv8DoOwNnsC"
tags: ["society","big-tech","ai"]
title: "The Cultural Backlash Against Generative AI"
disable_share: false
---
      

#### What’s making many people resent generative AI, and what impact does that have on the companies responsible?

The recent reveal of DeepSeek-R1, the large scale LLM developed by a Chinese company (also named DeepSeek), has been a very interesting event for those of us who spend time observing and analyzing the cultural and social phenomena around AI.
[Evidence suggests that R1 was trained for a fraction of the price that it cost to train ChatGPT](https://www.bbc.com/news/articles/c5yv5976z9po)
(any of their recent models, really), and there are a few reasons that might be true. But that’s not really what I want to talk about here — tons of
[thoughtful](https://www.wheresyoured.at/deep-impact/)
[writers](https://www.wired.com/story/deepseek-china-model-ai/)
[have](https://arstechnica.com/ai/2025/01/how-does-deepseek-r1-really-fare-against-openais-best-reasoning-models/)
[commented](https://www.theguardian.com/commentisfree/2025/jan/28/deepseek-r1-ai-world-chinese-chatbot-tech-world-western)
on what DeepSeek-R1 is, and what really happened in the training process.

What I’m more interested in at the moment is how this news shifted some of the momentum in the AI space.
[Nvidia and other related stocks dropped precipitously when the news of DeepSeek-R1 came out](https://www.cnbc.com/2025/01/27/nvidia-sheds-almost-600-billion-in-market-cap-biggest-drop-ever.html)
, largely (it seems) because it didn’t require the newest GPUs to train, and by training more efficiently, it required less power than an OpenAI model. I had already been thinking about the cultural backlash that Big Generative AI was facing, and something like this opens up even more space for people to be critical of the practices and promises of generative AI companies.

Where are we in terms of the critical voices against generative AI as a business or as a technology? Where is that coming from, and why might it be occurring?

### Schools of Thought

The two often overlapping angles of criticism that I think are most interesting are first, the social or community good perspective, and second, the practical perspective. From a social good perspective, critiques of generative AI as a business and an industry are myriad, and
[I’ve talked a lot about them in my writing here](https://medium.com/towards-data-science/environmental-implications-of-the-ai-boom-279300a24184)
. Making generative AI into something ubiquitous comes at extraordinary costs, from the environmental to the economic and beyond.

As a practical matter, it might be simplest to boil it down to “this technology doesn’t work the way we were promised”. Generative AI lies to us, or “hallucinates”, and it performs poorly on many of the kinds of tasks that we have most need for technological help on. We are led to believe we can trust this technology, but it fails to meet expectations, while simultaneously being used for such misery-inducing and criminal things as synthetic CSAM and deepfakes to undermine democracy.

So when we look at these together, you can develop a pretty strong argument: this technology is not living up to the overhyped expectations, and in exchange for this underwhelming performance, we’re giving up electricity, water, climate, money, culture, and jobs. Not a worthwhile trade, in many people’s eyes, to put it mildly!

I do like to bring a little nuance to the space, because I think when we accept the limitations on what generative AI can do, and the harm it can cause, and don’t play the overhype game, we can find a passable middle ground. I don’t think we should be paying the steep price for training and for inference of these models unless the results are really, REALLY worth it. Developing new molecules for medical research? Maybe, yes. Helping kids cheat (poorly) on homework? No thanks. I’m not even sure it’s worth the externality cost to help me write code a little bit more efficiently at work, unless I’m doing something really valuable. We need to be honest and realistic about the true price of both creating and using this technology.

### How we got here

So, with that said, I’d like to dive in and look at how this situation came to be. I wrote way back in September 2023 that machine learning had a public perception problem, and in the case of generative AI, I think that has been proven out by events. Specifically, if people don’t have realistic expectations and understanding of what LLMs are good for and what they’re not good for, they’re going to bounce off, and backlash will ensue.

> *“My argument goes something like this:*

> *1. People are not naturally prepared to understand and interact with machine learning.*

> *2. Without understanding these tools, some people may avoid or distrust them.*

> *3. Worse, some individuals may misuse these tools due to misinformation, resulting in detrimental outcomes.*

> *4. After experiencing the negative consequences of misuse, people might become reluctant to adopt future machine learning tools that could enhance their lives and communities.”*

> me, in
> [Machine Learning’s Public Perception Problem, Sept 2023](https://medium.com/towards-data-science/machine-learnings-public-perception-problem-48daf587e7a8)

So what happened? Well, the generative AI industry dove head first into the problem and we’re seeing the repercussions.

### Generative AI applications don’t meet people’s needs

Part of the problem is that
[generative AI really can’t effectively do everything the hype claims](https://hbr.org/2023/06/the-ai-hype-cycle-is-distracting-companies)
. An LLM can’t be reliably used to answer questions, because it’s not a “facts machine”. It’s a “probable next word in a sentence machine”. But we’re seeing promises of all kinds that ignore these limitations, and tech companies are forcing generative AI features into every kind of software you can think of. People hated Microsoft’s Clippy because it wasn’t any good and they didn’t want to have it shoved down their throats — and one might say
[they’re doing the same basic thing with an improved version, and we can see that some people still understandably resent it](https://www.theverge.com/2025/1/16/24345051/microsoft-365-personal-family-copilot-office-ai-price-rises)
.

When someone goes to an LLM today and asks for the price of ingredients in a recipe at their local grocery store right now, there’s absolutely no chance that model can answer that correctly, reliably. That is not within its capabilities, because the true data about those prices is not available to the model. The model might accidentally guess that a bag of carrots is $1.99 at Publix, but it’s just that, an accident. In the future, with chaining models together in agentic forms, there’s a chance we could develop a narrow model to do this kind of thing correctly, but right now it’s absolutely bogus.

But people are asking LLMs these questions today! And when they get to the store, they’re very disappointed about being lied to by a technology that they thought was a magic answer box. If you’re OpenAI or Anthropic, you might shrug, because if that person was paying you a monthly fee, well, you already got the cash. And if they weren’t, well, you got the user number to tick up one more, and that’s growth.

However, this is actually a major business problem. When your product fails like this, in an obvious, predictable (inevitable!) way, you’re beginning to singe the bridge between that user and your product. It may not burn it all at once, but it’s gradually tearing down the relationship the user has with your product, and you only get so many chances before someone gives up and goes from a user to a critic. In the case of generative AI, it seems to me like you don’t get many chances at all. Plus, failure in one mode can make people mistrust the entire technology in all its forms. Is that user going to trust or believe you in a few years when you’ve hooked up the LLM backend to realtime price APIs and can in fact correctly return grocery store prices? I doubt it. That user might not even let your model help revise emails to coworkers after it failed them on some other task.

From what I can see, tech companies think they can just wear people down, forcing them to accept that generative AI is an inescapable part of all their software now, whether it works or not. Maybe they can, but I think this is a self defeating strategy. Users may trudge along and accept the state of affairs, but they won’t feel positive towards the tech or towards your brand as a result. Begrudging acceptance is not the kind of energy you want your brand to inspire among users!

### What Silicon Valley has to do with it

You might think, well, that’s clear enough —let’s back off on the generative AI features in software, and just apply it to tasks where it can wow the user and works well. They’ll have a good experience, and then as the technology gets better, we’ll add more where it makes sense. And this would be somewhat reasonable thinking (although, as I mentioned before, the externality costs will be extremely high to our world and our communities).

However, I don’t think the big generative AI players can really do that, and here’s why. Tech leaders have spent a truly exorbitant amount of money on creating and trying to improve this technology —
[from investing in companies that develop it](https://www.reuters.com/technology/artificial-intelligence/openai-talks-investment-round-valuing-it-up-340-billion-wsj-reports-2025-01-30/)
, to
[building power plants and data centers](https://www.cnn.com/2025/01/21/tech/openai-oracle-softbank-trump-ai-investment/index.html)
, to lobbying to avoid copyright laws, there are hundreds of billions of dollars sunk into this space already with more soon to come.

In the tech industry, profit expectations are quite different from what you might encounter in other sectors —
[a VC funded software startup has to make back 10–100x what’s invested (depending on stage) to look like a really standout success](https://kruzeconsulting.com/blog/what-vcs-return-expectations/)
. So investors in tech push companies, explicitly or implicitly, to take bigger swings and bigger risks in order to make higher returns plausible.
[This starts to develop into what we call a “bubble” — valuations become out of alignment with the real economic possibilities, escalating higher and higher with no hope of ever becoming reality.](https://www.washingtonpost.com/technology/2024/07/24/ai-bubble-big-tech-stocks-goldman-sachs/)
[As Gerrit De Vynck in the Washington Post noted](https://www.washingtonpost.com/technology/2024/07/24/ai-bubble-big-tech-stocks-goldman-sachs/)
, “… Wall Street analysts are expecting Big Tech companies to spend around $60 billion a year on developing AI models by 2026, but reap only around $20 billion a year in revenue from AI by that point… Venture capitalists have also poured billions more into thousands of AI start-ups. The AI boom has helped contribute to the $55.6 billion that venture investors put into U.S. start-ups in the second quarter of 2024, the highest amount in a single quarter in two years, according to venture capital data firm PitchBook.”

[So, given the billions invested, there are serious arguments to be made that the amount invested in developing generative AI to date is impossible to match with returns.](https://www.wheresyoured.at/oai-business/)
There just isn’t that much money to be made here, by this technology, certainly not in comparison to the amount that’s been invested. But, companies are certainly going to try. I believe that’s part of the reason why we’re seeing generative AI inserted into all manner of use cases where it might not actually be particularly helpful, effective, or welcomed. In a way, “we’ve spent all this money on this technology, so we have to find a way sell it” is kind of the framework. Keep in mind, too, that the investments are continuing to be sunk in to try and make the tech work better, but any LLM advancement these days is proving very slow and incremental.

### Where to now?

Generative AI tools are not proving essential to people’s lives, so the economic calculus is not working to make a product available and convince folks to buy it. So, we’re seeing companies move to the “feature” model of generative AI, which
[I theorized could happen in my article from August 2024](https://medium.com/towards-data-science/economics-of-generative-ai-75f550288097)
. However, the approach is taking a very heavy hand, as with Microsoft adding generative AI to Office365 and making the features and the accompanying price increase both mandatory. I admit I hadn’t made the connection between the public image problem and the feature vs product model problem until recently — but now we can see that they are intertwined. Giving people a feature that has the functionality problems we’re seeing, and then upcharging them for it, is still a real problem for companies. Maybe when something just doesn’t work for a task, it’s neither a product nor a feature? If that turns out to be the case, then investors in generative AI will have a real problem on their hands, so companies are committing to generative AI features, whether they work well or not.

I’m going to be watching with great interest to see how things progress in this space. I do not expect any great leaps in generative AI functionality, although depending on how things turn out with DeepSeek, we may see some leaps in efficiency, at least in training. If companies listen to their users’ complaints and pivot, to target generative AI at the applications it’s actually useful for, they may have a better chance of weathering the backlash, for better or for worse. However, that to me seems highly, highly unlikely to be compatible with the desperate profit incentive they’re facing. Along the way, we’ll end up wasting tremendous resources on foolish uses of generative AI, instead of focusing our efforts on advancing the applications of the technology that are really worth the trade.

Read more of my work at
[www.stephaniekirmer.com](http://www.stephaniekirmer.com)
.

### Further Reading

<https://www.bbc.com/news/articles/c5yv5976z9po>

<https://www.cnbc.com/2025/01/27/nvidia-sheds-almost-600-billion-in-market-cap-biggest-drop-ever.html>

<https://medium.com/towards-data-science/environmental-implications-of-the-ai-boom-279300a24184>

<https://hbr.org/2023/06/the-ai-hype-cycle-is-distracting-companies>

<https://www.theverge.com/2025/1/16/24345051/microsoft-365-personal-family-copilot-office-ai-price-rises>

<https://www.reuters.com/technology/artificial-intelligence/openai-talks-investment-round-valuing-it-up-340-billion-wsj-reports-2025-01-30/>

<https://www.cnn.com/2025/01/21/tech/openai-oracle-softbank-trump-ai-investment/index.html>

<https://www.washingtonpost.com/technology/2024/07/24/ai-bubble-big-tech-stocks-goldman-sachs/>

<https://www.wheresyoured.at/oai-business/>

<https://medium.com/towards-data-science/economics-of-generative-ai-75f550288097>


---

[The Cultural Backlash Against Generative AI](https://medium.com/data-science/the-cultural-backlash-against-generative-ai-30372d3b9080)
was originally published in
[TDS Archive](https://medium.com/data-science)
on Medium, where people are continuing the conversation by highlighting and responding to this story.

