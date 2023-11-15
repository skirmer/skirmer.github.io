



---
date: 2023-11-15
featured_image: "https://cdn-images-1.medium.com/max/1024/0*4xW77dr71-j8MXKQ"
tags: ["authenticity","generative-ai-tools","artificial-intelligence","explainable-ai","editors-pick"]
title: "Detecting Generative AI Content"
disable_share: false
---
      
#### 
 On deepfakes, authenticity, and the President’s Executive Order on AI



 One of the many interesting ethical issues that comes with the advances of generative AI is
 **detection of the product of models** 
 . It’s a practical issue as well, for those of us who consume media. Is this thing I am reading or looking at the product of a person’s thoughtful work, or just words or images probabilistically generated to appeal to me? Does it matter? If so, what do we do?



### 
 The Meaning of Indistinguishable Content



 When we talk about content being difficult or impossible to detect as AI generated, we’re getting into something akin to a Turing Test. Say that I give you a paragraph of text or an image file. If I ask you, “was this produced by a human being or a machine learning model?”, and you can’t accurately tell, then we’ve reached the point where we need to think about these issues.




 In many areas we’re close to this, especially with GPT-4, but even with less sophisticated models, depending on what kind of prompt we use and the volume of context. If we have a long document from a GPT model, it’s likely going to be easier to detect that it’s not human generated, because every new word is a chance for the model to do something that a regular person wouldn’t do. Same for a video or high-res image — the more chances for pixellation or the uncanny valley to show up, the more opportunity for us to spot the fake.




 It also seems clear to me that as we get more familiar with model generated content, we’re going to get better at identifying tell tale signs of AI involvement in the content. Just like I described several weeks ago in my explanation of how Generative Adversarial Networks work, we are in something of a GAN relationship with generative AI ourselves. The models are working on creating the most human-like content possible, and we are increasing our ability to tell that it’s not human. It’s like a race where each side is working to outwit the other.




> 
>  As we get more familiar with model generated content, we’re going to get better at identifying tell tale signs of AI involvement in the content.
> 


### 
 Detection Approaches



 However, there’s probably a limit to how good we can get at this detection, and models will win out over regular human eyes and ears (if they haven’t already). We just don’t have the sensory capabilities and the pattern-recognition sophistication that a giant model can have. Fortunately, we can use models as tools on our side of the race as well, training models to scrutinize content and determine that it isn’t human generated, so that’s one tool in our quiver.




 At some point, though, there may really not be any reliably detectable signs of machine learning origins for some content, especially in small quantities. Philosophically speaking, given unlimited model advancement, there is probably a point at which there IS no real difference between the two kinds of content. In addition, most of us won’t be using a model to test all the media we consume to make sure it’s human generated and authentic. In response, some organizations, such as the
 [Content Authenticity Initiative](https://contentauthenticity.org/) 
 , are driving efforts to get content authentication metadata adopted broadly, which could be a help. These kinds of efforts, however, require goodwill and work on the part of people making the models available.




> 
>  At some point, though, there may really not be any reliably detectable signs of machine learning origins for some content.
> 



 You might ask, well, what about people who are intentionally bad actors trying to create harm with deepfakes or misinformation using AI generated content? They’re not going to volunteer to identify their content, are they? It’s a fair question. However, at least at this moment, the models that are sophisticated enough to fool people at scale are mostly under the control of large companies (OpenAI, etc). This won’t continue to be the case, but right this minute it would at least make a solid dent in the issue of provenance if the people who serve the most sophisticated LLMs to the public took some action on this.




 This isn’t a very optimistic story, so far. Generative AI is careening rapidly towards a place where those very powerful models are small enough that bad actors can run their own, and where those models easily create content that is literally indistinguishable from organic human content, even by other models.



### 
 Reasons for Detecting



 I’ve gotten a little ahead of myself, though. Why is it so important to everyone that we figure out whether content came from a model in the first place? If you can’t tell, does it matter?




 One major reason is that the purveyor of the content may have malicious intentions, such as misinformation or deepfakes. Creating images, audio, and video are the most common scenarios here — making it appear like someone said or did something they didn’t do. If you’ve been following the
 [US President’s Executive Order on AI](https://www.whitehouse.gov/briefing-room/presidential-actions/2023/10/30/executive-order-on-the-safe-secure-and-trustworthy-development-and-use-of-artificial-intelligence/) 
 , you may have heard that President Biden in fact got interested in this because he heard of the potential for people to use his likeness and voice fraudulently for misinformation. This is a very serious issue, because at this time, we tend to trust what we see with our own eyes in images or videos, and that can have a significant impact on people’s lives and safety.




> 
>  At this time, we tend to trust what we see with our own eyes in images or videos, and that can have a significant impact on people’s lives and safety.
> 



 A related issue is when models are used to imitate the work of specific humans not for necessarily malicious reasons, but just because that work is enjoyable and popular, and potentially profitable. It’s straightforwardly unethical, but in most cases probably not meant to actively hurt either the audience or the person being mimicked. (It does hurt people, of course — taking away the earning potential and livelihoods of artists and writers, which producers of the content should take responsibility for.) This can also cause reputational damage when deepfakes are used to lie about people’s actions. (Just ask
 [Joe Rogan, who’s been fighting ads](https://mashable.com/article/joe-rogan-tiktok-deepfake-ad) 
 using his likeness in deepfakes.)




 A third angle that I began thinking about after Casey Newton discussed it in his
 [October 5 issue of Platformer](https://open.substack.com/pub/platformer/p/how-authoritarian-governments-are?r=7xzvu&utm_medium=ios&utm_campaign=post) 
 is the risk that public figures can invert the issue and claim that real, authentic evidence of their bad behavior is artificially generated. What do we do when we can’t reliably uncover misdeeds using evidence, because “it’s a deepfake” is an unfalsifiable response? We’re not quite there yet, but I could see this becoming a real issue in the not too distant future.




> 
>  What do we do when we can’t reliably uncover misdeeds using evidence, because “it’s a deepfake” is an unfalsifiable response?
> 



 Less urgently, I also think there’s something to wanting my consumption of media to represent engaging with another person, even though it is a mainly one way movement of ideas. I think of reading or consuming art as engagement with the thoughts of another person, and engaging with words strung together by a model doesn’t quite have the same feel. So personally, I’d like to know if content I’m consuming is human produced.



### 
 The Executive Order



 Given all these very real risks, we are facing some serious challenges. There seems to be a tradeoff between detectable provenance (meaning, safety for the general public and all the issues I described above) and model sophistication, and as an industry, data science is driving forward on the side of model sophistication. Who’s going to balance the scales out?




 The president’s executive order represents some significant progress on this topic. (It talks about a lot of other important issues as well, which I may discuss another time.) I spent the last week and a half thinking about this executive order and reading other people’s perspectives on it from around the industry. While there are some who argue that it’s going to stifle advancement (and that it will reify the big players in generative AI, at the expense of smaller competitors), I think I’ve landed on the side of being optimistic about the executive order.




 Creating competitive generative AI models is incredibly expensive, and resource intensive, and this naturally limits how many competitors can get into the space in the first place. Protecting hypothetical new players in the space at the expense of broader social safety doesn’t make sense to me. I also don’t think the executive order is at all onerous for those organizations who have the resources to be in this room in the first place.




 The order itself is also not that prescriptive. It calls for a number of things to be created, but leaves open wide latitude for how that should happen, and hopefully well informed people will be involved in those processes. 🤞 (Data scientists in the field ought to make a point to monitor what happens and be vocal if it’s going off the rails.) In particular, it asks for the Commerce Department to create “standards and best practices for detecting AI-generated content and authenticating official content”. There are also some important components around safety and security where models are concerned.




**Do I have tremendous trust that our government will do a great job regulating AI while not damaging innovation?** 
**No, not really.** 
 But, I feel confident that industry left to its own devices will not pay as much attention to the issues of provenance and content detection as is needed — they haven’t demonstrated that this is a priority so far.




> 
>  I feel confident that industry left to its own devices will not pay as much attention to the issues of provenance and content detection as is needed.
> 



 At the same time, I’m not sure that detecting generative AI produced content will in fact be physically possible in all or even most contexts, especially as we make advances. The executive order doesn’t say anything about preventing models from being developed if their content crosses into undetectable territory, but that risk does worry me. That really would be stifling innovation, and we need to think very carefully about what the tradeoffs are or could be. Although, the horse may be out of that particular barn already — so many open source generative AI models are out there in the world, continuously getting better at what they do.



### 
 Conclusion



 This topic is hard, and the right action to take is not necessarily very clear. The more sophisticated and complex the output of a model is, the better our chances of detecting that output is not human-generated, but we’re in a technological race that will make that detection harder and harder. Policy engagement on the topic may give us some guard rails, but we can’t know yet whether it will really help, or if it will turn out to be a ham-fisted disaster.




 This is one of those times when I don’t have a way to tie up the discussion in a neat bow. The potential and actual risks of indistinguishable generative AI output are serious, and should be treated as such. However, we are in a scientific/mathematical place where we can’t create a quick or easy solution, and we need to give weight to the benefits that more advanced generative AI could produce.




 Regardless, data scientists should take time to read the executive order or at least the factsheet, and be clear about what the statement does and does not say. As regular readers will know, I think we’ve got to be responsible for spreading accurate and accessible information about these issues to the laypersons in our lives, and this is a good opportunity, since the topic is in the news. Make sure you contribute positively to the data science literacy around you.




 See more of my work at
 [www.stephaniekirmer.com](https://www.stephaniekirmer.com) 
 .



### 
 References



 Casey Newton -
 [October 5 issue of Platformer](https://open.substack.com/pub/platformer/p/how-authoritarian-governments-are?r=7xzvu&utm_medium=ios&utm_campaign=post) 




[The Fact Sheet on the Executive Order on AI](https://www.whitehouse.gov/briefing-room/statements-releases/2023/10/30/fact-sheet-president-biden-issues-executive-order-on-safe-secure-and-trustworthy-artificial-intelligence/) 




[The full document of the Executive Order on AI](https://www.whitehouse.gov/briefing-room/presidential-actions/2023/10/30/executive-order-on-the-safe-secure-and-trustworthy-development-and-use-of-artificial-intelligence/) 




[Reporting on deepfake fraud in ads, featuring Joe Rogan](https://mashable.com/article/joe-rogan-tiktok-deepfake-ad) 




[Content Authenticity Initiative](https://contentauthenticity.org/) 






---



[Detecting Generative AI Content](https://towardsdatascience.com/detecting-generative-ai-content-286200498f93) 
 was originally published in
 [Towards Data Science](https://towardsdatascience.com) 
 on Medium, where people are continuing the conversation by highlighting and responding to this story.



