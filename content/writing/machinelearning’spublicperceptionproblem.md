



---
date: 
featured_image: "https://cdn-images-1.medium.com/max/1024/0*rPW80Ap9V_fpxHqa"
tags: ["machine-learning","social-science"]
title: "Machine Learning’s Public Perception Problem"
disable_share: false
---
      
#### 
 Why machine learning literacy for the public needs to be a priority for data science, and what we can do about it.



 I was listening to a podcast recently with an assortment of intelligent, thoughtful laypeople (whose names I will not share, to be polite) talking about how AI can be used in healthcare. I had misgivings already, because they were using the term “AI”, which I find frequently means everything and nothing at the same time. But I listened on, and they discussed ideas for how you could incorporate AI tools (really just machine learning) into medical practice. These tools included suggesting diagnoses based on symptoms and adjusting medication dosages based on patient vitals and conditions, which seemed promising and practical.




 However, in the next moment I was a bit shocked, because one speaker (a medical doctor) said (I paraphrase) “it seems like AI has gotten worse at math”. This stayed with me not only through the rest of the podcast but throughout the weekend.




 When educated, smart laypeople are this confused and this misinformed about what machine learning is, we have a problem. (I’m going to avoid using the term “AI” because I really believe it confuses our meaning more than it clarifies. In this context, these individuals were discussing machine learning and products employing it, even if they were unaware of it.)




 In the case of the doctor, he was likely referring to Large Language Models (LLMs) when he made the comment about math. He had somehow been led to believe that a model that is trained to arrange words in a sophisticated way in response to prompting should also be able to conduct mathematical calculations. It isn’t good at that (it wasn’t trained to be!) and his image of all areas of machine learning were tarnished by this reality.




 Contrary to this misconception, data scientists understand that LLMs represent only a small part of the broader machine learning landscape. Many other algorithms and models excel in mathematical calculations because that’s their specific purpose. (As a friend said, when I told him this story, “machine learning models just ARE math!”) The beginning of this paragraph is the problem, however- data scientists know this, but the public at large really doesn’t.




> 
>  …data scientists understand that LLMs represent only a small part of the broader machine learning landscape.
> 



 I could spend a whole article talking about the difference between language models and other forms of machine learning, but that’s not what I’m really interested in today. Instead, I want to speak to why we need to care that laypeople don’t have this information, and what the implications can be.



### 
 Why should we care if laypeople know anything about machine learning?



 As a sociologist-turned-data scientist, I care a lot about how people interact with data science and machine learning. I have a personal philosophy about this: if your machine learning doesn’t benefit people or the world around us in some way, it really doesn’t matter. I think the purpose of human endeavor needs to be improving the lives of others, and that applies to machine learning too.




 However, even if you don’t buy in to that philosophy, I contend you should still care whether the general public understands the essentials of machine learning. If people lack this understanding, the adoption of valuable, trustworthy tools can stagnate.




 My argument goes something like this:



1. People are not naturally prepared to understand and interact with machine learning.
2. Without understanding these tools, some people may avoid or distrust them.
3. Worse, some individuals may misuse these tools due to misinformation, resulting in detrimental outcomes.
4. After experiencing the negative consequences of misuse, people might become reluctant to adopt future machine learning tools that could enhance their lives and communities.



 Machine learning only works to the extent that the people using it can maximize its functioning. I routinely see and hear examples like the anecdote I started with in my own life, where people are starting with extremely misinformed preconceptions about what ML is or can be, and they build mental frameworks on top of this flawed foundation. This leads to their entire cognitive map of what ML is being incorrect.




 What this means for the field of data science is that all our work in the service of building more and more advanced machine learning is limited in its possibility not by the number of GPUs we can get our hands on but by our capacity to explain what we build and educate the public on what it means and how to use it.




> 
>  …our work in the service of building more advanced machine learning is limited in its possibility not by the number of GPUs we can get our hands on but by our capacity to explain what we build.
> 


#### 
 People are not innately prepared to understand ML



 I recently read an article called
 [“Why Johnny Can’t Prompt”](https://dl.acm.org/doi/abs/10.1145/3544548.3581388) 
 (Zamfirescu-Pereira, Wong, Hartmann, and Yang, April 2023). This gave me a lot to think about when it comes to how non-data-scientists think about and deal with generative AI in particular, but about machine learning broadly as well.




 I may write more separately about this article later on, but for this argument, the valuable point is this: People tend to apply their established frameworks for interacting with other
 **people** 
 to their interactions with
 **machine learning systems** 
 , leading to subpar results and user frustration.




> 
>  People tend to apply their established frameworks for interacting with other
>  **people** 
>  to their interactions with
>  **machine learning systems** 
>  , leading to subpar results and user frustration.
> 



 Now, I don’t think this is irreparable. I actually think that human beings always need to learn how to use new tools, and that we can definitely get there. Think of how we gradually learned to use computers, and then smartphones. It was not immediately obvious what to do or how to make ourselves “understood” by the devices in front of us.




 This was mostly resolved by a combination of time, improvements in the design of devices to make them more intuitive (eg, the technology coming to meet us where we are), and education. When I was young, older or less technologically savvy folks had access to free or low cost computer classes at local community colleges, for example. The goal was not to learn programming, but just to learn to use computers effectively, because they were incredibly useful tools.




 I think this process can work for machine learning as well, but there are a few differences. For one, lots of machine learning is abstracted away from us, or it’s wrapped in an anthropomorphic interface (in the case of LLM chatbots, for example). A lot of the results of machine learning models come in to our lives without us realizing they’re there, such as search result personalization, or alerts in apps based on predictions of what we will want or need, just to name a few. In the case of generative AI, much of the machine learning is under the surface of a conversational chatbot, and we’re naturally inclined to interact with that like we might any human conversation partner. However, this is a mistake, as the authors describe in the article I mentioned above. At this point in time, the best results from an LLM are not achieved by just talking to it “like a person”.



#### 
 Some people won’t use things they don’t understand



 This reality creates a few conditions we need to be aware of. First, many people aren’t going to buy the line that machine learning is entirely beneficial and easy. Lots of people look at the new era of generative AI and are alarmed instead of excited. This is a reasonable reaction for many. For one thing, we have a lot of cultural references and exposures that have taught us that “too smart” computers are dangerous and we should be wary of them.




 People felt like this about personal computers too. Some were either worried about the capability and power they might have, or nervous about their own actual ability to understand and use them. Those computer classes at the community colleges eased hesitant folks into a comfortable relationship with the idea of computers. Unfortunately, I don’t see the field of data science taking that same kind of care with uncertain members of the public today.




 Adopting new technologies is always challenging, not because people are unintelligent or uncurious, but due to genuine concerns about potential risks. Acknowledging these concerns and demonstrating a commitment to preventing negative outcomes can improve the credibility of machine learning with the public.



#### 
 Other people will misuse and abuse things they don’t understand



 On the other hand, there are plenty of people who have jumped in to interacting with machine learning, especially LLMs, with both feet. People are using it for all kinds of things, including work in various industries as well as entertainment. The hype and media coverage has raised awareness of LLM technology and its potential, and nearly every company with a computer on the premises is trying to make AI part of their business strategy.




 However, there is a negative side to all this excitement. When people start using machine learning, such as LLMs, they start to notice the problems and the ways the technology doesn’t live up to overinflated expectations. Maybe the chatbot doesn’t understand your question, or the model’s predictions aren’t always perfect, but the end user is expecting that the machine won’t make any mistakes. Why are they expecting that? Because what they know about machine learning came from pop culture and hype. We data scientists haven’t taken the time to explain what expectations are reasonable, and which ones are still science fiction material.



#### 
 After misusing tools they don’t understand, people will fear to use new tools in the future



 So, what happens when we overpromise and underdeliver when it comes to machine learning solutions for lay users? In many, many cases, we will have disappointed and disillusioned people who could have been great advocates for new technologies. They’re going to be less likely to try the next version, or to use machine learning in the future, because they gave it a chance and got burned.




 Think of this example:
 [the lawyer who used ChatGPT to get citations for a brief.](https://apnews.com/article/artificial-intelligence-chatgpt-fake-case-lawyers-d6ae9fa79d0542db9e1455397aef381c) 
 When this story came out, the data science community skewered the lawyer. “Who would do that? Didn’t they know that you can’t rely on ChatGPT for accuracy of things like that?”




 I actually feel rather sorry for this lawyer, even if these consequences were the result of quite a bit of sloppiness. The promise of ChatGPT seems almost magical to lots of the public, and media representations about the near miraculous things it can do have fed this notion. A lot of people learned for the first time about the fact that ChatGPT will “lie” to you by reading about this case.




 These misperceptions arise from anthropomorphizing LLMs, assuming they have human-like reasoning and truth-discerning abilities. In reality, ChatGPT is a very sophisticated model that puts words in order in reaction to a prompt you give. It’s trained to produce very intelligible language. But ChatGPT has no concept of “truth” or “lie”. It has no internal embeddings to represent whether something is accurate. So when the news talks about ChatGPT lying, or “hallucinating”, this is all a bit misleading.




 However, the important point is that now we’ve got a group of people who saw this news, to say nothing of the lawyer involved, who are now at best anxious about whether anything you get from ChatGPT can be relied upon. This whole scenario really didn’t help them understand the idea of LLMs, and it certainly didn’t help the broader goal of applying machine learning where it can be beneficial. Somebody got burned by their lack of education about how the model works, other folks laughed about it, and now we’ve created a lot more skeptics who are going to shy away from using at least some forms of machine learning in the future.




 All this leads to the same place and the same problem — when there is no proper public education about a technology, we are leaving the public education task to unreliable and biased sources that have priorities other than the greater good. Just ask any public health professional trying to increase adoption of vaccinations these days. Machine learning could easily follow that same unfortunate path if we don’t get out in front of the education of the public.



### 
 What can we do to solve this problem?



 How do we as practitioners of data science bridge this gap between our technical expertise and the awareness of the public? As a former educator, I care a lot about this. It matters whether the public really understands what machine learning can do for us, because we have a chance to do a lot of good with it.




 One thing I think we can do is invest more of our time and energy into the education of the public. Now, I’m not saying every person on the street needs a tutorial in backpropagation or encoder architecture. (That’s like saying people need to study microchips in order to be effective computer users.) But I do think there are some essential elements people need to understand about machine learning so they can be informed users of the technology, including the ethics, risks, and limitations of what’s possible right now. As a field, data science needs to have some sense of what information a person needs to be a successful and effective user of machine learning, and how we can share it.




 If we weren’t seeing such a dramatic shift into LLMs being at the fingertips of the public, we might be able to wait on this. Basic predictive model results are usually intermediated by a data science professional, in that the model’s inputs are carefully designed and the results presented in a thoughtful way. In the case of LLM chatbots, however, this is not true. People can feed in anything they want, and no one is in control of what comes back. Users need a lot more knowledge to produce and consume this information responsibly.




 Secondly, I think data science as a field needs to be a lot more vocal and insistent about disagreeing with excessive hype and overstatement of what machine learning can really do and what it’s capable of. Most of this I find in click-bait types of media, or even some more theoretically trustworthy journalism. Don’t get me wrong, machine learning is downright amazing, and it can do incredible things! However, it’s not perfect, and we shouldn’t let anyone pretend it is without pushback.




 By ignoring this problem, we risk setting back progress in machine learning — not in its technological progress, necessarily (although congressional failure to understand machine learning could have that effect), but in the progress of its actual applications in practical life. I don’t want to see the incredible potential of this technology become marginalized or minimized because we didn’t help the public become ready for it.




*See more of my work at* 
[*www.stephaniekirmer.com*](http://www.stephaniekirmer.com)
*.* 






---



[Machine Learning’s Public Perception Problem](https://towardsdatascience.com/machine-learnings-public-perception-problem-48daf587e7a8) 
 was originally published in
 [Towards Data Science](https://towardsdatascience.com) 
 on Medium, where people are continuing the conversation by highlighting and responding to this story.



