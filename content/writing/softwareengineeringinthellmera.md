



---
date: 2025-07-01
featured_image: "https://cdn-images-1.medium.com/max/1024/0*cgmPNZuBQvE6U0Iu"
tags: ["software-development","social-science","ai"]
title: "Software Engineering in the LLM Era"
disable_share: false
---
      


On growing new software engineers, even when it’s inefficient

In the broad software engineering space, debates about whether using LLMs in coding is a good or a bad idea are raging. On the extremes, there are some people who think that any use of LLMs in coding is indefensible, and other people are ready to throw out the whole field of software engineering as too expensive and unnecessary. I’m fascinated by this discussion, particularly from my sociologist’s perspective, because so much of the conversation seems to be about
[whether](https://www.zdnet.com/article/10-professional-developers-on-vibe-codings-true-promise-and-peril/)
[an LLM](https://www.techdirt.com/2025/06/03/how-i-built-a-task-management-tool-for-almost-nothing/)
[is useful](https://www.baldurbjarnason.com/2025/trusting-your-own-judgement-on-ai/)
. Is it so fatally flawed that it’s a total waste of time, or is it so unimaginably powerful that it’s a fool’s errand to avoid it? Instead of thinking about it so narrowly, I actually really want to talk about the broader context of software engineering in the context of LLM technology. (I consider software engineering only adjacent to my field of machine learning engineering, but I have worked alongside many extremely talented SWEs in my career, at tech companies of various sizes, and I’ve had the chance to observe the role quite closely. Some of the analysis below also applies to the MLE field, but not all of it.)

### Context

During my own career I’ve seen a lot change in the American tech economy, and in the way the job of “coding” has been perceived and described. It’s a bit of a trope but it was certainly true for a period of time that “learning to code” was touted as the fastest way to a white collar career with a steady paycheck and future-proof prospects, both for young people and for career-changers trying to find a place in the shifting economy.
[Coding bootcamps came and (mostly) went](https://www.insidehighered.com/news/tech-innovation/teaching-learning/2025/01/09/changes-boot-camp-marks-signal-shifts-workforce)
, for a time giving people a relatively quick way to gain the foundational skills of the job.

In many fields, however, shortages of qualified employees can swiftly turn into a glut of talent with nowhere to go (ask lawyers), especially when high or at least comfortable salaries are on offer. While some people think this is happening in software engineering, it’s not clear if that’s necessarily the case yet, because there are other factors in play too. In the mid-2010s, many tech companies and startups were scrambling for hyper-growth and hiring as fast as possible, using cheap venture capital to fund their expansions without regard for profitability, but that’s definitively over now. Tech layoffs, including many software engineers, exploded in the years immediately following the start of the COVID pandemic, in large part as a response to the unsustainable hiring of preceding years and the sudden jolt to the economy of lockdowns. After that period of layoffs, hiring for SWE talent slowed in many sectors. Developer skillsets are diversifying and specializing, so there may still be sub-fields with strong hiring, but a lot of young SWEs in particular are struggling to break in.

### Junior vs Senior

This brings us around to now. Some people argue that there aren’t too many software engineers, but there are too many inexperienced or junior software engineers, and that employers are still desperate for experienced hires. What does that really mean? Is it true? Without doing academic research to really investigate (if anyone has done good research on this question, please send it to me!), we can still take a look at the issues involved. First, let’s define terms.

> I’m not using anybody’s in-house leveling terms, or talking about job titles here, but I want to clarify what the differences might be in someone’s role depending on the experience and skills they bring.

A junior SWE is someone who needs quite a bit of support, coaching, and managing to produce good quality work. They’re not yet at a place of working independently or mentoring others. They are still learning how the job is done. This doesn’t mean they don’t produce value! Junior engineers do write code and get work done, and they can often learn very quickly and become more productive. However, a senior SWE is someone who can be expected to work mostly independently, with minimal supervision required for good work to be done and goals to be met, and they can be relied on to help those junior folks along. They start to be able to solve more difficult problems, write elegant code that is high quality, and even begin being part of strategy conversations about how to build your whole codebase for the long haul.

This is more or less the pattern for most skilled professions — you’ll learn some amount of what you need to know from schooling or training, but you really learn how to be a member of the profession and do the job from experience and practice. There’s no set rule about how much time it takes for you to go from junior to senior in this framework, because it’s all about what you can do and the capabilities you have. Your perceived value as a worker (and your pay) go up as you get better at the job over time.

### LLMs Enter Stage Left

With this, we can start to inquire about how that shifts, and how the existence of LLMs and LLM based coding tools actually may (to use a cliche) disrupt the context of the profession now.

As an individual, if you’re a senior SWE, you might find an LLM tool like Github Copilot or Cursor handy for doing scut work, such as getting unit tests working, writing basic docs, or sketching out the start of a project that you’ll then fill in based on your own knowledge. However, your own knowledge is really vital for this to be effective. As we in machine learning will tell you, LLM output is probabilistic at its core. If the training data has many examples of code that are relevant to what you’re doing, it’s going to be reasonably likely to produce code for you that works. But sooner or later (probably sooner) it’s going to generate something that won’t work. That might be failing loudly or failing silently, it might be opening up a security hole, or it might just be a suboptimal way of doing a task. The thing that matters at that point is what you do in response.

Assuming you are a senior SWE with significant experience writing all this stuff by hand yourself, you have the skills to spot the mistakes, and figure out how to fix them smoothly so the end product works well. The LLM probably makes you more productive in the end, because you could abstract away some of the work that isn’t interesting and doesn’t require much thought. If you’re not a senior person, well, then you may end up going back to the LLM to ask it to fix its own mistakes. And it might do that, but there’s always a risk of another mistake being introduced, and on down the road. There’s really no telling how long this could take, and it’s hard to compare the time with how long it would have taken you to learn the underlying code and just solve it yourself.

However, lots of people will argue that the LLM repeating workflow is fine. People may believe that just being there to click the hover button to tell Copilot to “Fix” over and over again is sufficient, even if it’s not a particularly satisfying job. However, there are serious arguments to be made that the output will be seriously flawed, whether in readability, maintainability, security holes, or other aspects.

> *“Sure, Gen AI supercharges development, but it also supercharges risk. Two engineers can now churn out the same amount of insecure, unmaintainable code as 50 engineers.” —*
> <https://www.zdnet.com/article/10-professional-developers-on-vibe-codings-true-promise-and-peril/>

This question has been addressed by many writers recently. However, I’m less interested at this moment in whether Copilot can get to the desired result eventually than I am in what this process and way of working does to us.

### Broaden the Aperture

Remember that we’re here to talk about the effect of the LLM on the profession. In the pre-AI era, a junior engineer would start working on a ticket, and make some mistakes, introduce a bug or two, and they’d basically be armed with StackOverflow and the docs, plus peers to collaborate with for help, to figure out how to get it right. Once they muddled through and got the code working, they’d make a PR and get feedback from more experienced peers, who would offer recommendations and corrections. Once those corrections were made, a PR could be approved and merged.

I think the “muddling through” part of this process is actually pedagogically and professionally quite important. Once you’ve passed through the academic preparation for the software engineering role, the practical preparation is what you need to develop the capabilities to grow. I am a strong believer in the idea that making mistakes and fixing them is a tremendously valuable way to learn. Once the junior dev working on that bit of code has worked hard, fixed their own bugs, written the tests and docs, and gone through PR review, they know that bit of code better than any other person around. That process is the productive cognitive labor that brings them a step closer to being an engineer who can work independently, and take on more senior responsibilities successfully.

### On Being Efficient

However, from the outside, this process looks slow. It looks like they had to spend a lot of time flailing around to just get to the end result of code that works, and surely it would be more efficient to either just make an LLM do it, or make a senior dev do it?

If efficiency is your only criteria, then sure, maybe this is true. But I want to push back strongly on the premise. We do lots of things without thinking about broader context or impact, especially in the tech industry, and prioritizing efficiency today at all costs is a recipe for future disaster. Let’s spin out the narrative a bit — if efficiency is the priority, either we have an LLM do the bulk of the work, or a senior dev does it, or maybe a bit of both, like an LLM does the first stab and a senior dev reviews it. Setting aside any questions of quality (about which there should be questions), what’s the role of a junior SWE in this space?

Does a junior SWE watch the LLM do most of the coding? Do they just exist as an observer? Do they click “ok” from time to time as the LLM goes along, exemplifying “vibe coding”? Or do they not exist at all in this scenario?
[Loud voices in the AI space certainly are arguing that they disappear altogether](https://www.bloodinthemachine.com/p/how-ai-is-killing-jobs-in-the-tech-f39)
. If so, in the immediate moment, employers in tech save a significant amount of money on salaries, so stock price goes up.

> The idea of vibe coding is using an LLM based tool to write the code for your project, with minimal actual hand-writing of code involved. The name comes from the principle that you behind the keyboard have a general sense of the “vibe” of what you want your result to be, but you either don’t know how to do it yourself or don’t want to do it yourself, so you’re outsourcing the cognitive work of coding to a computer. You’ll just describe the broad strokes of what you want, in human language, and let the LLM figure out a way to achieve that through code.

### Hollowing

However, we know that a healthy profession needs to be bringing in new talent as senior staff progress and eventually retire. Senior engineers are still being sought after, because they can solve the problems and write the complex code that neither junior devs nor LLMs can produce. Their experience and skills are undeniably valuable and necessary to good software being produced. But where do we think senior engineers come from? Just like senior doctors, or senior attorneys, they start out as junior people. Their capabilities must be acquired through experience.

If we build a working environment where junior software engineers no longer exist, we are hollowing out the pipeline of talent the profession needs. Instead of having a funnel of talent from academic study into the field, young people have no real way to get to the level of experience that is in highest demand.

### Conclusions

I appreciate readers coming along with me on this discussion, because it’s important to think about the technology we make ubiquitous not just from our own individual perspectives but from a broader view. How we employ LLM technology in the field of software engineering will have a serious impact on the future of the profession and what it looks like — and, I’d argue, this is true for many other fields as well where incorporating LLMs is becoming fashionable. I’m not arguing for zero LLM usage in coding, by any means — it can be incredibly useful if you have the experience and skills to make the most of it. (There are many important conversations to have about how it may impact our skill levels and the maintenance of our skills, but that’s a different topic for another day.)

But in any profession, senior practitioners don’t just appear — they’re created, and that process of creation takes work and time, and may not be the most immediately “efficient” thing to do. Efficiency in the immediate moment just isn’t the most important thing — it can’t be, if we want the future to be bright.

Read more of my work at
[www.stephaniekirmer.com](http://www.stephaniekirmer.com)
.

### Further Reading

* [AI Killed My Job: Tech workers](https://www.bloodinthemachine.com/p/how-ai-is-killing-jobs-in-the-tech-f39)
* [10 professional developers on vibe coding's true promise and peril](https://www.zdnet.com/article/10-professional-developers-on-vibe-codings-true-promise-and-peril/)
* [Frontiers | Some Evidence on the Cognitive Benefits of Learning to Code](https://www.frontiersin.org/journals/psychology/articles/10.3389/fpsyg.2021.559424/full)
* [Trusting your own judgement on 'AI' is a huge risk](https://www.baldurbjarnason.com/2025/trusting-your-own-judgement-on-ai/)

Jones, Capers. 2014. The Technical and Social History of Software Engineering.

[Layoffs.fyi - Tech Layoff Tracker and DOGE Layoff Tracker](https://layoffs.fyi/)

<https://www.trueup.io/layoffs>


