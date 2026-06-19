



---
date: 2026-06-15
featured_image: "https://cdn-images-1.medium.com/max/1024/0*9T2g2DDKyYAZrXxc"
tags: ["economics","ai"]
title: "Drilling Into AI's Financial Sustainability"
disable_share: false
---
    

### Drilling Into AI’s Financial Sustainability

Budgets for AI tokens can’t be infinite, no matter how much hyperscalers wish they were

In
[my April column](https://medium.com/@s.kirmer/the-llm-gamble-cc434c5a9f54)
, I talked about how the opaqueness of the true cost of AI is a potentially fatal flaw for the profitable commercialization of the technology long term. Interestingly, in the two months since, we’ve seen some remarkable headlines from the tech industry potentially validating my argument at catastrophic scale.

It feels like the winds in the AI industry are changing direction so fast that it’s difficult to keep track. A matter of a few months ago, tech companies and even some other businesses were cracking the whip to get staff to use AI more, demanding that teams integrate it into workflows, regardless of whether they had any clear need or particular desire for the software.

### Hindsight is 20–20

As anyone who thought about it could probably have predicted, when you
[tie people’s material livelihoods](https://www.businessinsider.com/meta-google-jpmorgan-make-ai-performance-reviews-goals-raises-promotions-2026-3)
to using a thing more, a large sector of people will, in fact, use the thing more. This led to “tokenmaxxing”,
[token usage leaderboards inside companies like Amazon](https://tech.yahoo.com/ai/articles/amazon-latest-tech-giant-face-212500092.html)
, and shocking quarterly AI
[token expense figures at tons of places such as Uber](https://www.businessinsider.com/ai-spending-roi-concerns-tokenmaxxing-uber-coo-andrew-macdonald-reaction-2026-5)
(and other companies that have not been willing to name names). It’s frankly unclear to me why these companies are surprised at these results, but nonetheless, this has led to a
[pivot](https://tech.yahoo.com/ai/copilot/articles/microsoft-ceo-admits-ai-tokenmaxxing-130605829.html?guccounter=1&guce_referrer=aHR0cHM6Ly9kdWNrZHVja2dvLmNvbS8&guce_referrer_sig=AQAAAKMoRsSOIfpE9cbK8yQ2umpwcTGSLF2fltyfuNMjGNzV6MS_Mm0ELddYEcFKx3E91Utoy7JxmJy3Qmne89NbJmVfK7hybcwUWGZ26fSXVOtagecb9a7aKU_oYAPP6az0bmkNUlNk9kDeKQAchr2w1NTfiAL1-fTwbV0nsd21GwDL)
[in](https://www.businessinsider.com/disney-ai-push-increase-velocity-tech-employees-tokenmaxxing-josh-damaro-2026-6)
[the instructions to staff](https://gizmodo.com/big-tech-is-quietly-admitting-that-if-it-wants-to-sell-people-on-ai-it-better-be-cheap-2000768710)
both because this
[cost is unsustainable](https://gizmodo.com/companies-are-getting-burned-by-burning-tons-of-tokens-2000765232)
for any length of time, but also because the use of the AI has not produced sufficiently spectacular business outcomes.

It’s possible that executive leadership believed that some semi-miraculous productivity explosion was going to come from AI usage, but if so, they really hadn’t done their homework. Lots of us in the field as well as
[people in media covering the industry](https://garymarcus.substack.com)
[sounded warnings](https://www.wheresyoured.at)
about how AI is a tool, which can be used effectively or ineffectively, and expecting miracles will always disappoint.

I’ve used this kind of metaphor before, but consider if these companies were in construction, and electric drills were newly invented, making exceptional productivity improvements in building possible. The correct reaction would not be to buy as many drills as they can, to the point of making drill components scarce and driving up their price, and instructing staff to use a drill in every task, producing scoreboards displaying who was using drills for the most minutes of the day. You’d have buildings that had swiss cheese patterns of holes in them, you’d have spent exorbitantly on the drills and the electricity to power them, and you’d have about as much to show for it as tech companies do from AI now.

### Money Isn’t Infinite

At any rate, reality has begun to come crashing down, and it was at least a quick return to earth. Some businesses are still buying drills, but the big players have noticed that the cost-benefit ratio here is not making sense, and are adjusting. However, as I
[explained in April](https://medium.com/@s.kirmer/the-llm-gamble-cc434c5a9f54)
, this is not going to be as easy as they think. Some companies are beginning to tell their teams that the use of AI needs to be for fruitful purposes, not just tokenmaxxing, to try and bring down costs while still reaping the benefits of the technology where it can generate value.

What they are not yet grasping is that budgeting for tokens and clearly defining when AI is going to help with a problem is a much more indeterminate task than using other kinds of technology. Let’s go back to
[my April article](https://medium.com/@s.kirmer/the-llm-gamble-cc434c5a9f54)
and recollect the experience of using AI for the individual.

> “[Y]ou can ostensibly control how many tokens you submit, and thus control your costs, but that control is limited. You can make your prompts brief, limit extraneous instructions, and keep down your costs for input as a result. However, when agentic tools get involved, and the LLM is constructing prompts to pass to other LLMs, you’re no longer in charge of the length of the prompts. Even more significantly, you have only the most minimal control over the number of tokens that any model responds with (such as by asking it to “be concise”). For the most part, the number of output tokens is a part of that nondeterministic unknown I described before. And, you’ll note, an output token costs 5x the price of an input token.”

To expand this further, any time you use AI, it has a chance of failing to successfully answer your question. So the slot-machine component piles on to the problem. The tech worker doesn’t know A. how many tokens any prompt will return or B. how many times a prompt will need to be fed in (potentially with edits) to get a successful answer to a question. To calculate the cost, we need to sum all the input prompt token counts, and all the output prompt token counts (A, which is unknown) for the length of the number of attempts required (B, which is also unknown). A and B vary indeterminately based on model architecture, the problem at hand, the randomness in the model, and other factors we are probably not even aware of behind the scenes. Then, we multiply by the price per token for whatever model or models are being used, which, as I explained in April, also varies.

So, if you’re in the financial department of a tech company, and you need to determine the budget in dollars for AI tokens for the next year, I wish you all the best of luck. Even estimating based on the past usage, or with very fine detail about the company’s productivity goals, your chances of budgeting the correct amount seem pretty slim to me. However, you have to implement some kind of limit, this can’t be a blank check scenario, so you’re going to have to cut people off at some point.

### Practical Implications

How’s this going to actually work? Is it “manual coding” in the second half of the year, after spending the first half using AI intensively? Are all our emails and marketing documents hand written in Q3 and Q4? Are we shutting down our AI transcription tools and voice-to-text software after a threshold is hit? This is a fascinating question to me, because I’ve personally witnessed how different the experience is of writing code with AI is from doing it without, and switching back and forth between the two processes would be incredibly disruptive.

This also brings up the question of how cost cutting on AI is going to affect the companies providing AI based solutions.
[Last October I discussed](https://medium.com/@s.kirmer/can-we-save-the-ai-economy-b431b1f62f93)
how the hyperscalers (Anthropic, OpenAI, Google, etc) are pushing startups to implement AI based features in their products, as an attempt to earn profits to return to the investors who have sunk many billions of dollars into this industry. As the cost of providing AI features increases, and companies move more and more to a pay-per-use model, this flywheel is going to start to collapse. If companies start using AI based tooling less because their budgets cannot accommodate the spiraling costs, the pipeline of revenues back to the hyperscalers will dry up.
[Anthropic and OpenAI are planning IPOs this year](https://www.theverge.com/ai-artificial-intelligence/946335/openai-ipo-s-1-confidential)
, both with extremely uncertain paths to profitability and hundreds of billions of dollars owed back to investors, so a slowdown in AI usage is the last thing they need.

It’s also worth mentioning that Apple announced their product foray into AI last week at WWDC, and
[critics are](https://www.theverge.com/tech/949502/apple-macos-27-golden-gate-siri-ai-apple-intelligence)
[responding pretty](https://www.theverge.com/tech/947432/siri-ai-apple-intelligence-ios-27-wwdc)
positively so far. The new Siri using technology from Google Gemini will have substantial privacy protection (on device and private cloud compute and minimal data storage) and is also not going to cost users extra. With this available, and if the quality lives up to expectations, regular consumer use of ChatGPT and Claude may also be at risk.

### Conclusion

Watch this space, because while the stories of “companies shocked at AI bills” and “OpenAI and Anthropic shooting for the largest IPOs in history” are often reported separately, they’re really the same narrative from different angles. Even if tech companies do feel like AI is providing them benefits and giving productivity gains, they simply do not have unlimited budgets to apply to it. If they do not have unlimited budgets (and
[consumers certainly don’t](https://www.theverge.com/ai-artificial-intelligence/917380/ai-monetization-anthropic-openai-token-economics-revenue)
, with CPG prices straining budgets and economic sentiment the lowest it’s been in almost a century of tracking), we have to come back and ask where the billions and billions that OpenAI, Anthropic, and others are expecting to generate in revenues are going to come from. Combine this with the
[public pushback](https://www.theverge.com/ai-artificial-intelligence/945809/amazon-employees-seattle-data-center-moratorium)
[against data centers](https://www.politico.com/news/2026/04/13/missouri-city-council-data-center-00867259)
[and negative](https://www.theverge.com/policy/944041/new-york-data-center-moratorium)
[sentiment about](https://www.theverge.com/ai-artificial-intelligence/920401/gen-z-ai)
[AI generally](https://www.theverge.com/ai-artificial-intelligence/935602/graduates-boo-ai-ceos)
, and hyperscalers have a real problem on their hands.

Read more of my work at
[www.stephaniekirmer.com](http://www.stephaniekirmer.com)

### Further Reading

<https://medium.com/@s.kirmer/can-we-save-the-ai-economy-b431b1f62f93>

<https://medium.com/@s.kirmer/the-llm-gamble-cc434c5a9f54>

<https://www.businessinsider.com/disney-ai-push-increase-velocity-tech-employees-tokenmaxxing-josh-damaro-2026-6>

<https://www.businessinsider.com/ai-spending-roi-concerns-tokenmaxxing-uber-coo-andrew-macdonald-reaction-2026-5>

<https://gizmodo.com/big-tech-is-quietly-admitting-that-if-it-wants-to-sell-people-on-ai-it-better-be-cheap-2000768710>

<https://tech.yahoo.com/ai/articles/amazon-latest-tech-giant-face-212500092.html>

<https://www.inc.com/georgia-fearn/palantir-ceo-just-accused-ai-labs-of-tokenmaxxing-at-corporate-companies-expense/91359321>

<https://www.businessinsider.com/meta-google-jpmorgan-make-ai-performance-reviews-goals-raises-promotions-2026-3>

<https://www.theverge.com/tech/949502/apple-macos-27-golden-gate-siri-ai-apple-intelligence>

<https://www.theverge.com/tech/947432/siri-ai-apple-intelligence-ios-27-wwdc>

<https://gizmodo.com/americans-are-starting-to-really-hate-data-centers-and-its-making-the-tech-industry-nervous-2000767088>

<https://gizmodo.com/companies-are-getting-burned-by-burning-tons-of-tokens-2000765232>


