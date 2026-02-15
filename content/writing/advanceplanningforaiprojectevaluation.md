



---
date: 2026-02-15
featured_image: "https://cdn-images-1.medium.com/max/1024/0*A2kOa7JMW0HZPrtC"
tags: ["ai","ai-agent"]
title: "Advance Planning for AI Project Evaluation"
disable_share: false
---
      


The work to do before the work begins

It’s a common situation to find in businesses right now — there is a proposed product or feature that would involve using AI, such as an LLM-based agent, and discussions begin about how to scope the project and build it. Product and Engineering will have great ideas for how this tool might be useful, and how much excitement it can generate for the business. However, if I’m in that room, the first thing I want to know after the project is proposed is “how are we going to evaluate this?” Sometimes this will result in questions about whether AI evaluation is really important or necessary, or whether this can wait until later (or never).

Here’s the truth: you only need AI evaluations if you want to know if it works. If you’re comfortable building and shipping without knowing the impact on your business or your customers, then you can skip assessment — however, most businesses would not actually be okay with that. Nobody wants to think of themselves as building things without being sure whether they work.

> If you’re comfortable building and shipping without knowing the impact on your business or your customers, then you can skip assessment — however, most businesses would not actually be okay with that.

So, let’s talk about what you need before you start building AI, so that you’re ready to evaluate it.

### **The Objective**

This may sound obvious, but what is your AI supposed to do? What is the purpose of it, and what will it look like when it is working?

You might be surprised how many people venture into building AI products without an answer to this question. But it really matters that we stop and think hard about this, because knowing what we are picturing when we envision the success of a project is necessary to know how to set up measurements of that success.

It is also important to spend time on this question before you begin, because you may discover that you and your colleagues/leaders do not actually agree about the answer. Too often organizations decide to add AI to their product in some fashion, without clearly defining the scope of the project, because AI is perceived as valuable on its own terms. Then, as the project proceeds, the internal conflict about what success is comes out when one person’s expectations are met, and another’s are not. This can be a real mess, and will only come out after a ton of time, energy, and effort have been committed. The only way to fix this is to agree ahead of time, explicitly, about what you’re trying to achieve.

### **KPIs**

It’s not just a matter of coming up with a mental image of a scenario where this AI product or feature is working, however. This vision needs to be broken down into measurable forms, such as KPIs, in order for us to later build the evaluation tooling required to calculate them. While qualitative or ad hoc data can be a great help for getting color or doing a “sniff test”, having people try out the AI tool ad hoc, without a systematic plan and process, is not going to produce enough of the right information to generalize about product success.

When we rely on vibes, “it seems ok”, or “nobody’s complaining”, to assess the results of a project, it’s both lazy and ineffective. Collecting the data to get a statistically significant picture of the project’s outcomes can sometimes be costly and time consuming, but the alternative is pseudoscientific guessing about how things worked. You can’t trust that the spot checks or feedback that is volunteered are truly representative of the broad experiences people will have. People routinely don’t bother to reach out about their experiences, good or bad, so you need to ask them in a systematic way. Furthermore, your test cases of an LLM based tool can’t just be made up on the fly — you need to determine what scenarios you care about, define tests that will capture those, and run them enough times to be confident about the range of results. Defining and running the tests will come later, but you need to identify usage scenarios and start to plan that now.

### **Set the Goalposts Before the Game**

It’s also important to think about assessment and measurement before you begin so that you and your teams are not tempted, explicitly or implicitly, to game the numbers. Figuring out your KPIs after the project is built, or after it’s deployed, may naturally lead to choosing metrics that are easier to measure, easier to achieve, or both. In social science research, there’s a concept that differentiates between what you can measure, and what actually matters, known as “measurement validity”.

For example, if you want to measure people’s health for a research study, and determine if your intervention improved their health, you need to define what you mean by “health” in this context, break it down, and take quite a few measurements of the different components that health includes. If, instead of doing all that work and spending the time and money, you just measured height and weight and calculated BMI, you would not have measurement validity. BMI may, depending on your perspective, have some relationship to health, but it certainly isn’t a comprehensive measure of the concept. Health cannot be measured with something like BMI alone, even though it’s cheap and easy to get people’s height and weight.

For this reason, after you’ve figured out what your vision of success is in practical terms, you need to formalize this and break down your vision into measurable objectives. The KPIs you define may later need to be broken down more, or made more granular, but until the development work of creating your AI tool begins, there’s going to be a certain amount of information you won’t be able to know. Before you begin, do your best to set the goalposts you’re shooting for and stick with them.

### **Think About Risk**

Particular to using LLM based technology, I think having a very honest conversation among your organization about risk tolerance is extremely important before setting out. I recommend putting the risk conversation at the beginning of the process because just like defining success, this may reveal differences in thinking among people involved in the project, and those differences need to be resolved for an AI project to proceed. This can even influence how you define success, and it will also affect the types of tests you create later in the process.

LLMs are nondeterministic, which means that given the same input they may respond differently in different situations. For a business, this means that you are accepting the risk that the way an LLM responds to a particular input may be novel, undesirable, or just plain weird from time to time. You can’t always, for sure, guarantee that an AI agent or LLM will behave the way you expect. Even if it does behave as you expect 99 times out of 100, you need to figure out what the character of that hundredth case will be, understand the failure or error modes, and decide if you can accept the risk that constitutes — this is part of what AI assessment is for.

### **Conclusion**

This might feel like a lot, I realize. I’m giving you a whole to-do list before anyone’s written a line of code! However, evaluation for AI projects is more important than for many other types of software project because of the inherent nondeterministic character of LLMs I described. Producing an AI project that generates value and makes the business better requires close scrutiny, planning, and honest self-assessment about what you hope to achieve and how you will handle the unexpected. As you proceed with constructing AI assessments, you’ll get to think about what kind of problems may occur (hallucinations, tool misuse, etc) and how to nail down when these are happening, both so you can reduce their frequency and be prepared for them when they do occur.

If this is interesting, and you’d like to know more about how to proceed, I encourage you to join me at my upcoming talk at
[ODSC East in April 2026](https://odsc.ai/east/)
to learn more about the next steps — actually using and customizing LLM evaluation tools to meet the needs of your project and effectively measure its success. (I will also make materials available on my website after the event for those who can’t make it.)

Read more of my work at
[www.stephaniekirmer.com](http://www.stephaniekirmer.com)


