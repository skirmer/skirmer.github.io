



---
date: 2026-04-15
featured_image: "https://cdn-images-1.medium.com/max/1024/0*Ok0oQwn1U8m66U4c"
tags: ["artificial-intelligence","ai","sociology"]
title: "The LLM Gamble"
disable_share: false
---
    


Why it tickles your brain to use an LLM, and what that means for the AI industry

When you open up the chat window for an LLM, and you have a question in mind, there’s an undeniable sense of possibility. You can’t be quite sure what the response will be, but there’s a decent chance that it is going to impress you with its confidence and specificity to your request, and that it will solve your problem in seconds. When it does, the feeling can be quite delightful!

However, sometimes it fails — whether in general purpose knowledge or in specific cases like coding. As TikTok account
[Alberta Tech illustrates](https://www.tiktok.com/@alberta.nyc/video/7625674186203221261)
, sometimes the AI makes up its own imaginary functions and methods, building you something that couldn’t possibly run. But, sometimes, it gives you something that works! A lot about this feels like a slot machine, doesn’t it?

You don’t know what’s going to happen when you push the button, but you’re hoping for a delightful result, and every time you have a new chance for that dopamine hit. Nondeterminism makes every answer a bit different, and not knowing what you’ll get can frankly be exciting! It’s like your social media feed, too — what’s coming up? It might be an ad, or it might be your favorite creator.

I’m obviously nowhere near the first person to notice this element of the experience of using generative AI. In fall 2025,
[Cory Doctorow](https://pluralistic.net/2025/08/16/jackpot/#salience-bias)
made the point that we remember the times when gen AI worked well far more than we remember the times it failed and we had to push the button again, just like gamblers.
[Wesam Mikhail](https://www.linkedin.com/posts/wesammikhail_llm-coding-feels-like-productivity-but-behaves-activity-7436574539683307520-4cDK/?skipRedirect=true)
posted on LinkedIn about how the “wins” are misleading because the code that works is also introducing bugs and tech debt under the hood. But we feel the rush of “oh, wow, look, it did it!” even so.
[Paul Weimer](https://www.patreon.com/posts/slot-machine-llm-138864761)
,
[Fang-Pen Lin](https://fangpenlin.com/posts/2026/03/19/no-llm-is-not-going-to-replace-software-engineers-heres-why/)
, and many others have written about this same phenomenon in just the last several months.

One of the things that several of them also gestured at is the financial implications, and that’s a big part of what interests me about the metaphor.

### The Chips

We pay for generative AI in units called tokens. These are words or parts of words, usually, forming units of measure for the inputs and outputs from LLMs. In a literal sense, the number of tokens is a measure of how much power is used during the inference process. By paying for tokens, we are paying for all the resources and overhead involved in an inference task. That’s why we end up paying for both the amount of text we pass in to the LLM, in the form of prompts, and also the amount of text the LLM returns to us in its responses.

Costs of using LLMs, therefore, are presented in dollars per tokens, such as $5 per million input tokens and $25 per million output tokens, which are
[Anthropic’s current API rates](https://platform.claude.com/docs/en/about-claude/pricing)
for Opus 4.6. There are also detailed prices for cache hits and repetitions, but this is the basic rate. For OpenAI, the prices are lower but measured the same way: for
[GPT 5.4](https://openai.com/api/)
, it’s $2.50 per 1 million input tokens and $15 per 1 million output tokens. Older and less sophisticated models generally run cheaper.

So, if you submit 1 million input tokens to Opus 4.6, that will cost you $5, and if the outputs from Opus run to a length of 1 million tokens, that will cost you $25, making your total cost $30. 1 million tokens sounds like a lot, and it is (1.5 million tokens is roughly the length of the Harry Potter book series) but over time accumulating usage if you make the LLM a part of your regular work can pile up fast.

You may have already noticed the first point I want to make — you can ostensibly control how many tokens you submit, and thus control your costs, but that control is limited. You can make your prompts brief, limit extraneous instructions, and keep down your costs for input as a result. However, when agentic tools get involved, and the LLM is constructing prompts to pass to other LLMs, you’re no longer in charge of the length of the prompts. Even more significantly, you have only the most minimal control over the number of tokens that any model responds with (such as by asking it to “be concise”). For the most part, the number of output tokens is a part of that nondeterministic unknown I described before. And, you’ll note, an output token costs 5x the price of an input token.

So, returning to our slot machine metaphor, you put in a quarter to the machine, and that’s paying for your pull. But then you get a response out, and you ALSO have to pay for that, although you have no warning in advance of how much it will cost. If you didn’t win on that pull, and the LLM made up its own coding language and nothing runs? You still have to pay for that output, and the cost is only predicated on how long the response was, with no regard for how useful it was. The length could be any size, especially in agentic AI, and you have no way to predict it.

Oh well, you may think, this is the price of the product, and anyway, the next pull will surely be better, right? So you pay for that output that didn’t work, and then you put another quarter in the machine, and pull, and hope for better.

### Subscriptions

Regular users of generative AI may be remarking, “oh, but you can just get a subscription and just pay a flat rate!” This is true, and this is instrumental for the success of adoption of these tools to date. This abstracts away the token level cost, letting you use the LLM for a flat rate up to the usage limit. A Claude subscription for an individual user starts at $20 a month, and this is the tier that gives you Claude Code, Cowork, research tooling, and extensions to go into other software such as Excel.

However, it’s not as transparent as it might seem. None of these plans, on any provider, permit unlimited use, and the details of the limits are deeply obscured in documentation — “Your usage is affected by several factors, including the length and complexity of your conversations, the features you use, and which Claude model you’re chatting with.” This means that you can’t actually plan ahead for how much of your usage budget you’ll consume in any singular situation. At best, you have a cap on the cost you’ll encounter in any given month, so no surprise bills will show up, but you have no real idea when your usage for the month will abruptly cut off.

Put another way, if your usage budget is based on features, what model you’re using, and the other things they describe, that means your token usage is not a flat limiter. Usage limits aren’t finely tuned to the token numbers. What this means is that many users with subscriptions may in fact use more than $20 worth of the services each month. This is even more true for Max plans, which cost between $100 and $200 a month and offer even more usage, but again, the limits on usage are obscured from users’ view. Deciphering what the limits really are, and what makes your usage take up more of your limit, is an issue that users frequently discuss, for example in
[Reddit communities](https://www.reddit.com/r/ClaudeAI/comments/1s7fcjf/claude_usage_limits_discussion_megathread_ongoing/)
or on
[other social media](https://limitededitionjonathan.substack.com/p/why-you-keep-hitting-claudes-usage)
.

### Conclusion

What does this mean, overall? For one thing, the material cost of running generative AI inference is pretty high. For companies like Anthropic and OpenAI to generate significant revenue, much less make a profit and meet the expectations of investors, analysts generally agree that the prices I’ve laid out above are below cost. This is why, for example, Anthropic has forced users of OpenClaw to use per-token-use pricing, not subscriptions- people are using more of their limits and turning the subscriptions into loss leaders.

However, pay-per-usage is extremely difficult to sell to most users, because that reveals the fact I outlined at the beginning, which is that you have to pay for the pull of the slot machine and for the output, even if you don’t win. We expect value for money, in situations like this, so the business model of gambling doesn’t really make sense in the context of software. When we’re used to ROI and quality assurance, a business model where you are required to pay for the product even when it doesn’t work requires a significant paradigm shift.

There’s no choice, though, for the generative AI providers — when the model does inference and returns tokens it costs them money, whether the response is any good or not. This is core to the question of how this technology turns from a novelty or a bubble into a sustainable business. Will people accept paying for each gamble, when they can’t predict how much it will cost them (because the number of output tokens is nondeterministic) and can’t predict whether it will actually work for their needs? I have to doubt it, for the general population, and that means a ticking time bomb for the industry.

Read more of my work at
[www.stephaniekirmer.com](http://www.stephaniekirmer.com)
. Also, you can see me speak live in person at ODSC East on April 30 in Boston.

### Further Reading

<https://pluralistic.net/2025/08/16/jackpot/#salience-bias>

<https://www.linkedin.com/posts/wesammikhail_llm-coding-feels-like-productivity-but-behaves-activity-7436574539683307520-4cDK/>

<https://fangpenlin.com/posts/2026/03/19/no-llm-is-not-going-to-replace-software-engineers-heres-why/>

<https://www.patreon.com/posts/slot-machine-llm-138864761>

<https://www.reddit.com/r/ClaudeAI/comments/1cib17i/since_i_started_using_claude_instead_of_chat_gpt/>


