



---
date: 2023-10-03
featured_image: "https://cdn-images-1.medium.com/max/1024/0*OrON13WTu0NVXsBw"
tags: ["data-science","business","ai","editors-pick","machine-learning"]
title: "Is Generative AI Taking Over the World?"
disable_share: false
---
      
#### 
 Businesses are jumping on a bandwagon of creating something, anything that they can launch as a “Generative AI” feature or product. What’s driving this, and why is it a problem?


### 
 The AI Hype Cycle: In a Race to Somewhere?



 I was recently catching up on back issues of Money Stuff, Matt Levine’s indispensable newsletter/blog at Bloomberg, and there was an interesting piece about how AI stock picking algorithms don’t actually favor AI stocks (and also they don’t perform all that well on the picks they do make).
 [Go read Money Stuff to learn more about that.](https://www.bloomberg.com/opinion/articles/2023-08-22/ai-funds-don-t-like-ai-stocks?srnd=undefined) 




 But one of the points made alongside that analysis was that businesses all around the economic landscape are gripped with FOMO around AI. This leads to a semi-comical assortment of applications of what we are
 *told* 
 is AI.




> 
>  “Some companies are saying they’re doing AI when they’re really just trying to figure out the basics of automation. The pretenders will be shown up for that at some point,” he said. …
> 



> 
>  The fashion and apparel company Ralph Lauren earlier this month described AI as “really an important part of our . . . revenue growth journey”. Restaurant chains such as KFC owner Yum Brands and Chipotle have touted AI-powered technology to improve the efficiency of ingredient orders or help making tortilla chips.
> 



> 
>  Several tourism-related businesses such as Marriott and Norwegian Cruise Line said they are working on AI-powered systems to make processes like reservation booking more efficient and personalised.
> 



> 
>  None of the examples above referenced AI in their most recent quarterly filings, though Ralph Lauren did note some initiatives in broad terms in its annual report in May.
> 



 (from Money Stuff, but he was quoting the Financial Times)




 To me, this hits right, though I’m not so sure they’re going to get caught out. I will admit, also, that many companies are in fact employing generative AI (usually tuned off the shelf things from big development companies), but they’re rarely what anyone actually needs or wants — instead, they’re just trying to get in on the new hot moment.




 I thought it might be useful to talk about how this all happens, however. When someone decides that their company needs “AI innovation”, whether it’s actually generative AI or not, what’s really going on?



### 
 An Understanding of AI (and Automation)



 Let’s revisit what AI really is, before we proceed. As regular readers will know, I
 **really** 
 hate when people throw around the term “AI” carelessly, because most of the time they don’t know at all what they mean by this. I prefer to be more specific, or at least to explain what I mean.




 To me, AI is when we use machine learning strategies, often but not always deep learning, to build models or combinations of models that can complete complex tasks that normally would require human capabilities. When does a machine learning model get complex enough that we should call it AI? That’s a very hard question, and there’s much disagreement about it. But this is my framing: machine learning is the technique we use to create AI, and machine learning is a big umbrella including deep learning and lots of other stuff. The field of data science is sort of an even bigger umbrella that can include some or all of machine learning but also includes many other things.




> 
>  AI is when we use machine learning strategies, often deep learning, to build models or combinations of models that can complete complex tasks that normally would require human capabilities.
> 



 There’s another subcategory, generative AI, and I think when most laypeople today talk about AI, that’s actually what they mean. That’s your LLMs, image generation, and so on (see my previous posts for more discussion of all that). If, say, a search engine is technically AI, which one could argue, it’s definitely not generative AI, and if you ask someone on the street today if a simple search engine is AI, they probably wouldn’t think so.




 Let’s discuss an example, to help perhaps clarify a bit about automations, and what makes them not necessarily AI. A question-answering chatbot is a good example.




 In one hand, we have a pretty basic automation, something we’ve had around for ages.



* Customer puts a question or a search word into a popup box on your website
* An application that looks at this question or set of words, and strips out the stopwords (a, and, the, and so forth — a simple search and replace type function)
* Application then puts the remaining terms in a search box, returning the results of that search of your database/FAQ/wiki to the chat popup box



 This is a very rough approximation of the old way of doing these things. People don’t love it, and if you ask for the wrong thing, you’re stuck. It’s basically a LMGTFY\*. This tool doesn’t even imitate the kind of problem solving or response strategy a human might use.




 On the other hand, we could have a ChatGPT equivalent now:



* Customer puts a question or a search word into a popup box on your website
* The LLM behind the scenes ingests the customer’s input as a prompt, interprets this, and returns a text response based on the words, their syntactic embeddings, and the model’s training to produce exceedingly “human-like” responses.



 This will mean a few big positives. First, the LLM knows not only the words you sent it, but also what OTHER words have similar meanings and associations based on its learned token embeddings, so it will be able to stretch past the exact words used when responding. If you asked about “buying a house” it can link that to “real estate” or “mortgage” or “home prices”, roughly because texts it has been trained on showed those words in similar contexts and near each other.




 In addition, the response will likely be much more pleasant to read and consume for the customer on the website, making their experience with your company aesthetically better. The results of this model are more nuanced and much, much more complicated than those of your old-school chatbot.




 However, we need to remember that the LLM is not aware of or concerned with accuracy or currency of information. Remember my comments in previous posts about what an LLM is and how it’s trained—it’s not learning about factual accuracy, but only about producing text that is very much like what humans write and what humans like to receive. The facts might be accurate, but there is every chance they might not be. In the first example, on the other hand, you have complete control over everything that may possibly be returned from your database.




 For an average user of your website, this might not actually feel drastically different on the front end — the response might be more pleasant, and might make them feel “understood” but they don’t have any idea that the answers are at higher risk of inaccuracy in the LLM version. Technically, if we get right down to it, both of these are automating the process of answering customers’ questions for you, but only one is a generative AI tool for doing so.




> 
>  Side note: I’m not going to get into the difference between AGI (artificial general intelligence) and specialized AI right now, other than to say that AGI does not, as of this moment, exist and anyone who tells you it does is wrong. I may cover this question more in a future post.
> 


### 
 Who’s Behind It?



 So, let’s continue our original conversation. What leads to a company throwing some basic automation or a wrapper for ChatGPT in a press release and calling it their new AI product? Who’s driving this, and what are they actually thinking? My theory is that there are two essential paths that lead us here.



* **I Want PR:** 
 An executive sees the hype cycle happening, and they want to get their business some media attention, so they get their teams to build something that they can sell as AI. (Or, relabel something they already have as AI.) They may or may not know or care whether the thing is actually generative AI.
* **I Want Magic:** 
 An executive hears something in news or media about AI, and they want their business to have whatever advantages they believe their competition is getting from AI. They come in to the office and direct their teams to build something that will provide the
 *benefits* 
 of AI. I‘d be surprised if this executive really knows the difference between generative AI and a simpler automation.



 None of this necessarily precludes the idea that a good generative AI tool could end up happening, of course- plenty exist already! But when we start from the presumption of “We need to use this technology for
 *something* 
 ” and not from “We need to solve this real problem”, we’re approaching the development process in the entirely wrong way.




 But come on, what’s the harm in any of this? Does it really matter, or is this just fodder for some good jokes between data scientists about the latest bonkers “AI” feature some company has rolled out? I’d argue that it does matter (although it is also often material for good jokes).



### 
 Why Should We Care?



 As data scientists, I think we should actually be a little perturbed by this phenomenon, for a couple of reasons.




**First, this culture devalues our actual contributions.** 
 Data science used to be the sexiest job around, or so many magazine covers told us, but we’re fortunately settling into a much calmer, more stable, less flashy place. Data science teams and departments provide sturdy, reliable value to their businesses by determining how the business can be run efficiently and effectively. We figure out who to market to and when; we tell companies how to organize their supply chains and warehouses; we identify productivity opportunities through changes to systems and processes. Instead of “that’s how we’ve always done it”, we are now empowered to find the best way to actually do things, using data, across our companies. Sometimes we build whole new products or features to make the things our companies sell better. It’s incredibly valuable work! Go look at my article on the
 [Archetypes of the Data Science Role](https://medium.com/towards-data-science/archetypes-of-the-data-scientist-role-1b078966fb2) 
 if you’re not convinced.




 All this stuff we do is not less valuable or less important if it’s not generative AI. We do plenty of machine learning work that probably doesn’t reach the mysterious complexity boundary into AI itself, but all that stuff is still helping people and making an impact.




**Second, we’re just feeding into this stupid hype cycle by calling everything AI.** 
 If you call your linear regression AI, you’re also supporting a race to the bottom in terms of what the phrase means. The phrase is going to die a death of a thousand cuts if we use it to refer to absolutely everything. Maybe that’s fine, I know I’m certainly ready to stop hearing about the phrase “artificial intelligence” any time now. But in principle, those of us in the data science field
 **know better** 
 . I think we have at least some responsibility to use the terms of our trade correctly and to resist the pressure to let the meanings turn to mush.




**Third, and I think possibly most importantly, the time we spend humoring the demands of people outside the field by building things to produce AI PR takes time away from the real value we could be creating.** 
 My conviction is that data scientists should build stuff that makes people’s lives better and helps people do things they need to do. If we’re constructing a tool, whether it uses AI or not, that nobody needs and that helps no one, that’s a waste of time. Don’t do that. Your customers almost certainly actually need something (look at your ticket backlog!), and you should be doing that instead. Don’t do projects just because you “need something with AI”, do projects because they meet a need and have a real purpose.




 When executives at companies walk in in the morning and decide “we need AI features”, whether it’s for PR or for Magic, it’s not based on strategically understanding what your business actually needs, or the problems you are actually there to solve for your customers. Now, I know that as data scientists we’re not always in a position to push back against executive mandates, even when they’re a little silly, but I’d really like to see more companies stepping back a moment and thinking about whether a generative AI tool is in fact the right solution to a real problem in their business. If not, maybe just sit tight, and wait until that problem actually comes up. Generative AI isn’t going anywhere, it’ll be there when you actually have a real need for it. In the meantime, keep using all the tried and true real data science and machine learning techniques we already have — but just don’t pretend they’re now “AI” to get yourself clicks or press.




*See more of my work at* 
[*www.stephaniekirmer.com*](http://www.stephaniekirmer.com/)
*.* 



### 
 Examples in the Wild



 Ok, I’ve been crabby enough about this whole circus, now let’s have a little fun. I’ve been browsing through press releases from companies telling the world about their new, snazzy AI features and reflecting on how absurdly unnecessary and wasteful these seem, and I picked out a couple of amusing ones to share.



* [Coca-Cola gets generative AI to design its ads and invent new flavors](https://www.coca-colacompany.com/media-center/coca-cola-creations-imagines-year-3000-futuristic-flavor-ai-powered-experience) 
 : This press release is some grade-A word salad, but they appear to be using Dall-E to generate ad visuals. Frankly, the visuals still look to me like something out of the year 2002, but maybe I’m old. Also, they plainly admit this is a hype cycle jaunt. “After leaning into Augmented Reality last year, we’re embracing the power of AI and continuing to build our company’s capabilities in this exciting space.” Metaverse didn’t work out, so this is the next thing, I guess?
* This appears to be real generative AI, but is among the worst ideas I’ve ever heard. Afterparty would like to
 [let celebrities deepfake themselves to save time talking to fans](https://www.businesswire.com/news/home/20230919237357/en/Afterparty-Secures-5M-in-Funding-to-Debut-Afterparty-AI-Enables-Creators-to-Infinitely-Scale-Fan-Interactions) 
 while still making money. Does anyone want this? It’s my understanding that celebrities are naturally quite hesitant to have their likenesses replicated by AI, considering the value potential there. I’m also not clear on why any fan would want this. (Who gets the rights to the deepfake avatar IP?) But, hey, there’s NFTs!



 Comment with your favorite silly examples of “AI for AI’s sake” out there in the world and I’ll post some of the best ones in the future.




 \*
 [Let Me Google That For You](https://letmegooglethat.com/) 
 , for the young’uns out there who don’t remember.






---



[Is Generative AI Taking Over the World?](https://towardsdatascience.com/is-generative-ai-taking-over-the-world-a970a5ccdad5) 
 was originally published in
 [Towards Data Science](https://towardsdatascience.com) 
 on Medium, where people are continuing the conversation by highlighting and responding to this story.



