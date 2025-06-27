



---
date: 2025-02-28
featured_image: "https://cdn-images-1.medium.com/max/1024/0*eiDUcByK2rMrcml-"
tags: ["ai","civic-engagement"]
title: "Generative AI and Civic Institutions"
disable_share: false
---
      


Should human obsolescence be our goal?

### Different Sectors, Different Goals

Recent events have got me thinking about AI as it relates to our civic institutions — think government, education, public libraries, and so on. We often forget that civic and governmental organizations are inherently deeply different from private companies and profit-making enterprises. They exist to enable people to live their best lives, protect people’s rights, and make opportunities accessible, even if (especially if) this work doesn’t have immediate monetary returns. The public library is an example I often think about, as I come from a library-loving and defending family — their goal is to provide books, cultural materials, social supports, community engagement, and a love of reading to the entire community, regardless of ability to pay.

In the private sector, efficiency is an optimization goal because any dollar spent on providing a product or service to customers is a dollar taken away from the profits. The (simplified) goal is to spend the bare minimum possible to run your business, with the maximum amount returned to you or the shareholders in profit form. In the civic space, on the other hand, efficiency is only a meaningful goal insomuch as it enables higher effectiveness — more of the service the institution provides getting to more constituents.

> In the civic space, efficiency is only a meaningful goal insomuch as it enables higher effectiveness — more of the service the institution provides getting to more constituents.

So, if you’re at the library, and you could use an AI chatbot to answer patron questions online instead of assigning a librarian to do that, that librarian could be helping in-person patrons, developing educational curricula, supporting community services, or many other things. That’s a general efficiency that could make for higher effectiveness of the library as an institution. Moving from card catalogs to digital catalogs is a prime example of this kind of efficiency to effectiveness pipeline, because you can find out from your couch whether the book you want is in stock, using search keywords, instead of flipping through hundreds of notecards in a cabinet drawer like we did when I was a kid.

However, we can pivot too hard in the direction of efficiency, and lose sight of the end goal of effectiveness. If, for example, your online librarian chat is often used by schoolchildren at home to get homework help, replacing them with an AI chatbot could be a disaster — after getting incorrect information from such a bot, and getting a bad grade at school, a child might be turned off from patronizing the library or seeking help there for a long time, or forever. So, it’s important to deploy generative AI solutions only when it is well thought out and purposeful, not just because the media is telling us that “AI is neat”. (
[Eagle eyed readers will know that this is basically similar advice to what I’ve said in the past about deploying AI in businesses as well.](https://medium.com/towards-data-science/economics-of-generative-ai-75f550288097)
)

As a result, what we thought was a gain in efficiency leading to net higher effectiveness actually could diminish the number of lifelong patrons and library visitors, which would mean a loss of effectiveness for the library. Sometimes unintended effects from attempts to improve efficiency can diminish our ability to provide a universal service. That is, there may be a tradeoff between making every single dollar stretch as far as it can possibly go, and providing reliable, comprehensive services to all the constituents of your institution.

> Sometimes unintended effects from attempts to improve efficiency can diminish our ability to provide a universal service.

### AI for Efficiency

It’s worth it to take a closer look at this concept — AI as a driver of efficiency. Broadly speaking, the theory we hear often is that incorporating generative AI more into our workplaces and organizations can increase productivity. Framing it at the most Econ 101 level: using AI, more work can be completed by fewer people in the same amount of time, right?

Let’s challenge some aspects of this idea. AI is useful to complete certain tasks, but is sadly inadequate for others. (As our imaginary schoolchild library patron learned, an LLM is not a reliable source of facts, and should not be treated like one.) So, AI’s ability to increase the volume of work being done with fewer people (efficiency) is limited by what kind of work we need to complete.

If our chat interface is only used for simple questions like “What are the library’s hours on Memorial Day?” we can hook up a RAG (Retrieval Augmented Generation) system with an LLM and make that quite useful. But outside of the limited bounds of what information we can provide to the LLM, we should probably set guard rails and make the model refuse to try and answer, to avoid giving out false information to patrons.

So, let’s play that out. We have a chatbot that does a very limited job, but does it well. The librarian who was on chatbot duty now may have some reduction in the work required of them, but there are still going to be a subset of questions that still require their help. We have some choices: put the librarian on chatbot duty for a reduced number of hours a week, hoping the questions come in when they’re on? Tell people to just call the reference desk or send an email if the chatbot refuses to answer them? Hope that people come in to the library in person to ask their questions?

I suspect the likeliest option is actually “the patron will seek their answer elsewhere, perhaps from another LLM like ChatGPT, Claude, or Gemini.” Once again, we’ve ended up in a situation where the library loses patronage because their offering wasn’t meeting the needs of the patron. And to boot, the patron may have gotten another wrong answer somewhere else, for all we know.

I am spinning out this long example just to illustrate that efficiency and effectiveness in the civic environment can have a lot more push and pull than we would initially assume. It’s not to say that AI isn’t useful to help civic organizations stretch their capabilities to serve the public, of course! But just like with any application of generative AI, we need to be very careful to think about what we’re doing, what our goals are, and whether those two are compatible.

### Conversion of Labor

Now, this has been a very simplistic example, and eventually we could hook up the whole encyclopedia to that chatbot RAG or something, of course, and try to make it work. In fact, I think we can and should continue developing more ways to chain together AI models to expand the scope of valuable work they can do, including making different specific models for different responsibilities. However, this development is itself work. It’s not really just a matter of “people do work” or “models do work”, but instead it’s “people do work building AI” or “people do work providing services to people”. There’s a calculation to be made to determine when it would be more efficient to do the targeted work itself, and when AI is the right way to go.

Working on the AI has an advantage in that it will hopefully render the task reproducible, so it will lead to efficiency, but let’s remember that AI engineering is vastly different from the work of the reference librarian. We’re not interchanging the same workers, tasks, or skill sets here, and in our contemporary economy, the AI engineer’s time costs a heck of a lot more. So if we did want to measure this efficiency all in dollars and cents, the same amount of time spent working at the reference desk and doing the chat service will be much cheaper than paying an AI engineer to develop a better agentic AI for the use case. Given a bit of time, we could calculate out how many hours, days, years of work as a reference librarian we’d need to save with this chatbot to make it worth building, but often that calculation isn’t done before we move towards AI solutions.

> *We need to interrogate the assumption that incorporating generative AI in any given scenario is a guaranteed net gain in efficiency.*

### Externalities

While we’re on this topic of weighing whether the AI solution is worth doing in a particular situation, we should remember that developing and using AI for tasks does not happen in a vacuum. It has some cost environmentally and economically when we choose to use a generative AI tool, even when it’s a single prompt and a single response.
[Consider that the newly released GPT-4.5 has increased prices 30x for input tokens ($2.50 per million to $75 per million) and 15x for output tokens ($10 per million to $150 per million) just since GPT-4o](https://arstechnica.com/ai/2025/02/its-a-lemon-openais-largest-ai-model-ever-arrives-to-mixed-reviews/)
. And that isn’t even taking into account the water consumption for cooling data centers
[(3 bottles per 100 word output for GPT-4)](https://www.tomshardware.com/tech-industry/artificial-intelligence/using-gpt-4-to-generate-100-words-consumes-up-to-3-bottles-of-water-ai-data-centers-also-raise-power-and-water-bills-for-nearby-residents)
,
[electricity use, and rare earth minerals used in GPUs](https://medium.com/towards-data-science/environmental-implications-of-the-ai-boom-279300a24184)
. Many civic institutions have as a macro level goal to improve the world around them and the lives of the citizens of their communities, and concern for the environment has to have a place in that. Should organizations whose purpose is to have a positive impact weigh the possibility of incorporating AI more carefully? I think so.

Plus, I don’t often get too much into this, but I think we should take a moment to consider some folks’ end game for incorporating AI — reducing staffing altogether. Instead of making our existing dollars in an institution go farther, some people’s idea is just reducing the number of dollars, and redistributing those dollars somewhere else. This brings up many questions, naturally, about where those dollars will go instead, and whether they will be used to advance the interests of the community residents some other way, but let’s set that aside for now. My concern is for the people who might lose their jobs under this administrative model.

For-profit companies hire and fire employees all the time, and their priorities and objectives are focused on profit, so this is not particularly hypocritical or inconsistent . But as I noted above, civic organizations have objectives around improving the community or communities in which they exist. In a very real way, they are advancing that goal when part of what they provide is economic opportunity to their workers. We live in a society where working is the overwhelmingly predominant way people provide for themselves and their families, and giving jobs to people in the community and supporting the economic well being of the community is a role that civic institutions do play.

> [R]educing staffing is not an unqualified good for civic organizations and government, but instead must be balanced critically against whatever other use the money that was paying their salaries will go to.

At the bare minimum, this means that reducing staffing is not an unqualified good for civic organizations and government, but instead must be balanced critically against whatever other use the money that was paying their salaries will go to. It’s not impossible for reducing staff to be the right decision, but we have to bluntly acknowledge that when members of communities experience joblessness, that effect cascades. They are now no longer able to patronize the shops and services they would have been supporting with their money, the tax base may be reduced, and this negatively affects the whole collective.

Workers aren’t just workers, they’re also patrons, customers, and participants in all aspects of the community. When we think of civic workers as simply money pits, to be replaced with AI or whose cost for labor we need to minimize, we lose sight of the reasons for the work to be done in the first place.

### Conclusion

I hope this discussion has brought some clarity about how really difficult it is to decide if, when, and how to apply generative AI to the civic space. It’s not nearly as simple a thought process as it might be in the for-profit sphere, because the purpose and core meaning of civic institutions are completely different. Those of us who do machine learning and build AI solutions in the private sector might think “oh, I can see a way to use this in government”, but we have to recognize and appreciate the complex contextual implications that might have.

Next month, I’ll be bringing you a discussion of how social science research is incorporating generative AI, which has some very intriguing aspects.

As you may have heard,
[Towards Data Science](https://towardsdatascience.com/)
has moved to an independent platform, but I will continue to post my work on my Medium page,
[my personal website](http://www.stephaniekirmer.com)
, and the new TDS platform, so you’ll be able to find me wherever you happen to go.
[Subscribe to my newsletter on Medium](https://medium.com/@s.kirmer)
if you’d like to ensure you get every article in your inbox.

Find more of my work at
[www.stephaniekirmer.com](http://www.stephaniekirmer.com)
.

### Further Reading

* ["It's a lemon"-OpenAI's largest AI model ever arrives to mixed reviews](https://arstechnica.com/ai/2025/02/its-a-lemon-openais-largest-ai-model-ever-arrives-to-mixed-reviews/)
* [Using GPT-4 to generate 100 words consumes up to 3 bottles of water - AI data centers also raise power and water bills for nearby residents](https://www.tomshardware.com/tech-industry/artificial-intelligence/using-gpt-4-to-generate-100-words-consumes-up-to-3-bottles-of-water-ai-data-centers-also-raise-power-and-water-bills-for-nearby-residents)
* [Environmental Implications of the AI Boom](https://medium.com/towards-data-science/environmental-implications-of-the-ai-boom-279300a24184)
* [Economics of Generative AI](https://medium.com/towards-data-science/economics-of-generative-ai-75f550288097)


