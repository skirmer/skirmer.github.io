



---
date: 2024-04-01
featured_image: "https://cdn-images-1.medium.com/max/1024/0*fQG5pnw-KXDsyYNT"
tags: ["editors-pick","copyright","law","generative-ai-tools","artificial-intelligence"]
title: "The Coming Copyright Reckoning for Generative AI"
disable_share: false
---
      
#### 
 Courts are preparing to decide whether generative AI violates copyright—let’s talk about what that really means



 Copyright law in America is a complicated thing. Those of us who are not lawyers understandably find it difficult to suss out what it really means, and what it does and doesn’t protect. Data scientists don’t spend a lot of time thinking about copyright, unless we’re choosing a license for our open source projects. Even then, sometimes we just skip past that bit and don’t really deal with it, even though we know we should. But the legal world is starting to take a close look at how copyright intersects with generative AI, and this could have a real impact on our work. Before we talk about how it is affecting the world of generative AI, let’s
 [recap the truth of copyright](https://www.eff.org/teachingcopyright) 
 .



### 
 Copyright


1. US copyright law is relevant to what are called “original works of authorship”. This includes things under these categories: literary; musical; dramatic; pantomimes and choreographic work; pictorial, graphic, and sculptural works; audio-visual works; sound recordings; derivative works; compilations; architectural works.
2. Content must be written or documented to be copyrightable. “Ideas are not copyrightable. Only tangible forms of expression (e.g., a book, play, drawing, film, or photo, etc.) are copyrightable. Once you express your idea in a fixed form — as a digital painting, recorded song, or even scribbled on a napkin — it is automatically copyrighted if it is an original work of authorship.” —
 [Electronic Frontier Foundation](https://www.eff.org/teachingcopyright/handouts#copyrightFAQ)
3. Being protected means that only the copyright holder (the author or creator, descendants inheriting the rights, or purchaser of the rights) can do these things: make and sell copies of the works, create derivative works from the originals, and perform or display the works publicly.
4. Copyright isn’t forever, and it ends after a certain amount of time has elapsed. Usually, this is 70 years after the author’s death or 95 years after publication of the content. (Anything from before 1929 in the US is generally in the “public domain”, which means it is no longer covered by copyright.)



 Why does copyright exist at all? Recent legal interpretations argue that the whole point is not to just let creators get rich, but to encourage creation so that we have a society containing art and cultural creativity. Basically we exchange money with creators so they are incentivized to create great things for us to have. This means that a lot of courts look at copyright cases and ask, “Is this copy conducive to a creative, artistic, innovative society?” and take that into consideration when making judgments as well.



### 
 Fair Use



 In addition, “fair use” is not a free pass to ignore copyright. There are four tests to decide if a use of content is “
 [fair use](https://www.eff.org/teachingcopyright/handouts#fairuseFAQ) 
 ”:



1. The purpose and character of the second use: Are you doing something innovative and different with the content, or are you just replicating the original? Is your new thing innovative on its own? If so, it’s more likely to be fair use. Also, if your use is to make money, that is less likely to be fair use.
2. The nature of the original: If the original is creative, it’s harder to break copyright with fair use. If it’s just facts, then you’re more likely to be able to apply fair use (think of quoting research articles or encyclopedias).
3. Amount used: Are you copying the whole thing? Or just, say, a paragraph or a small section? Using as little as is necessary is important for fair use, although sometimes you may need to use a lot for your derivative work.
4. Effect: Are you stealing customers from the original? Are people going to buy or use your copy instead of buying the original? Is the creator going to lose money or market share because of your copy? If so, it’s likely not fair use. (This is relevant even if you don’t make any money.)



 You have to meet ALL of these tests to get to be fair use, not just one or two. All of this is, of course, subject to legal interpretation. (This article is NOT legal advice!) But now, with these facts in our pocket, let’s think about what Generative AI does and why the concepts above are crashing into Generative AI.



### 
 Generative AI Recap



 Regular readers of my column will have a pretty clear understanding of how generative AI is trained already, but let’s do a very quick recap.



* Giant volumes of data are collected, and a model learns by analyzing the patterns that exist in that data. (
 [As I’ve written before](https://medium.com/towards-data-science/how-human-labor-enables-machine-learning-367feee8bc91) 
 : “Some reports indicate that GPT-4 had on the order of
 *1 trillion* 
 words in its training data. Every one of those words was written by a person, out of their own creative capability. For context, book 1 in the Game of Thrones series was about 292,727 words. So, the training data for GPT-4 was about
 *3,416,152 copies of that book long* 
 .”)
* When the model has learned the patterns in the data (for an LLM, it learns all about language semantics, grammar, vocabulary, and idioms), then it will be fine tuned by human, so that it will behave as desired when people interact with it. These patterns in the data may be so specific that some scholars argue the model can “memorize” the training data.
* The model will then be able to answer prompts from users reflecting the patterns it has learned (for an LLM, answering questions in very convincing human-sounding language).



 There important implications for copyright law in both the inputs (training data) and outputs of these models, so let’s take a closer look.



### 
 Training Data and Model Output



 Training data is vital to creating generative AI models. The objective is to teach a model to replicate human creativity, so the model needs to see
 *huge volumes* 
 of works of human creativity in order to learn what that looks/sounds like. But, as we learned earlier, works that humans create belong to those humans (even if they are jotted down on a napkin). Paying every creator for the rights to their work is financially infeasible for the volumes of data we need to train even a small generative AI model. So, is it fair use for us to feed other people’s work into a training data set and create generative AI models? Let’s go over the Fair Use tests and see where we land.



1. The purpose and character of the second use



 We could argue that using data to train the model doesn’t really count as creating a derivative work. For example, is this different from teaching a child using a book or a piece of music? The counter arguments are first, that teaching one child is not the same as using millions of books to generate a product for profit, and second, that generative AI is so keenly able to reproduce content that it’s trained on, that it’s basically a big fancy tool for copying work almost verbatim. Is the result of generative AI sometimes innovative and totally different from the inputs? If it is, that’s probably because of very creative prompt engineering, but does that mean the underlying tool is legal?




 Philosophically, however, machine learning is trying to reproduce the patterns it has learned from its training data as accurately and precisely as possible. Are the patterns it learns from original works the same as the “heart” of the original works?




 2. The nature of the original




 This varies widely across the different kinds of generative AI that exist, but because of the sheer volumes of data required to train any model, it seems likely that at least some of it would fit the legal criteria for creativity. In many cases, the whole reason for using human content as training data is to try and get innovative (highly diverse) inputs into the model. Unless someone’s going to go through the entire 1 trillion words for GPT-4 and decide which ones were or weren’t creative, I think this criteria is not met for fair use.




 3. Amount used




 This is kind of a similar issue to #2. Because, almost by definition generative AI training datasets use everything they can get their hands on, and the volume needs to be huge and comprehensive; there’s not really a “minimal necessary” amount of content.




 4. Effect




 Finally, the effect issue is a big sticking point for generative AI. I think we all know people who use ChatGPT or similar tools from time to time instead of searching for the answer to a question in an encyclopedia or newspaper. There is strong evidence that people use services like Dall-E to request visual works “in the style of [Artist Name Here]” despite some apparent efforts from these services to stop that. If the question is whether people will use the generative AI instead of paying the original creator, it certainly seems like that is happening in some sectors. And we can see that companies like Microsoft, Google, Meta, and OpenAI are making billions in valuation and revenue from generative AI, so they’re definitely not going to get an easy pass on this one.



#### 
 Copying as a Concept in Computing



 I’d like to stop for a moment to talk about a tangential but important issue. Copyright law is not well equipped to handle computing generally, particularly software and digital artifacts. Copyright law was mostly created in an earlier world, where duplicating a vinyl record or republishing a book was a specialized and expensive task. But today, when anything on any computer can basically be copied in seconds with a click of the mouse, the whole idea of copying things is different from how it used to be. Also, keep in mind that installing any software counts as making a copy. A digital copy means something different in our culture than the kinds of copying that we had before computers. There are significant lines of questioning around how copyright should work in the digital era, because a lot of it no longer seems quite relevant. Have you ever copied a bit of code from GitHub or StackOverflow? I certainly have! Did
 *you* 
 carefully scrutinize the content license to make sure it was reproducible for your use case? You should, but did you?



### 
 New York Times v. OpenAI



 Now that we have a general sense of the shape of this dilemma, how are creators and the law approaching the issue? I think the most interesting such case (there are many) is the one brought by the New York Times, because part of it gets at the meaning of copying in a way I think other cases fail to do.




 As I mentioned above, the act of duplicating a digital file is so incredibly ubiquitous and normal that it’s hard to imagine enforcing that copying a digital file (at least, without the intent to distribute that exact file to the global public in violation of other fair use tests) is a copyright infringement. I think this is where our attention needs to fall for the generative AI question — not just duplication, but effect on the culture and the market.




 Is generative AI actually making copies of content? E.g.,training data in, training data back out? The NYT has shown in its filings that you can get verbatim text of NYT articles out of ChatGPT, with very specific prompting. Because the NYT has a paywall, if this is true, it would seem to clearly violate the Effect test of Fair Use. So far, OpenAI’s response has been “well, you used many complicated prompts to ChatGPT to get those verbatim results”, which makes me wonder, is their argument that if the generative AI
 *sometimes* 
 produces verbatim copies of content it was trained on, that’s not illegal? (Universal Music Group has filed a similar case related to music, arguing that the generative AI model Claude can reproduce lyrics to songs that are copyrighted nearly verbatim.)




 We are asking the courts to decide exactly how much and what kind of use of a copyrighted material is acceptable, and that is going to be challenging in this context — I tend to believe that using data for training should not be inherently problematic, but that the important question is how the model gets used and what effect that has.




 We tend to think of fair use as a single step, like quoting a paragraph in your article with citation. Our system has a body of legal thought that is well prepared for that scenario. But in generative AI, it’s more like two steps. To say that copyright is infringed, it seems to me that if the content gets used in training, it ALSO must be retrievable from the end model in a way that usurps the market for the original material. I don’t think you can separate out the quantity of input content used from the quantity that can be extracted verbatim as output. Is this actually true of ChatGPT, though? We are going to see what the courts think.




[Ars Technica](https://arstechnica.com/tech-policy/2024/02/why-the-new-york-times-might-win-its-copyright-lawsuit-against-openai/) 
 ,
 [The Verge](https://www.theverge.com/24062159/ai-copyright-fair-use-lawsuits-new-york-times-openai-chatgpt-decoder-podcast) 
 ,
 [TechDirt](https://www.techdirt.com/2023/12/28/the-ny-times-lawsuit-against-openai-would-open-up-the-ny-times-to-all-sorts-of-lawsuits-should-it-win/) 



### 
 DMCA



 There’s another interesting angle to these questions, which is whether or not DMCA (the Digital Millennium Copyright Act) has relevance here. You may be familiar with this law because it’s been used for decades to force social media platforms to remove music and film files that were published without the authorization of the copyright holder. The law was based on the idea that you can kind of go “whac-a-mole” with copyright violators, and get content removed one piece at a time. However, when it comes to training data sets, this obviously won’t fly—you’d need to retrain the entire model, at exorbitant cost in the case of most generative AI, removing the offending file or files from the training data. You could still use DMCA, in theory, to force the output of an offending model to be removed from a site, but proving which model produced the item will be a challenge. But that doesn’t get at the underlying issue of input+output as both being key to the infringement as I have described it.



### 
 Questions of Power



 If these behaviors are in fact violating copyright, the courts still have to decide what to do about it. Lots of people argue that generative AI is “too big to fail” in a manner of speaking — they can’t abolish the practices that got us here, because everyone loves ChatGPT, right? Generative AI (we are told) is going to revolutionize [insert sector here]!




 While the question of whether copyright is violated still remains to be decided, I do feel like there should be consequences if it is. At what point do we stop forgiving powerful people and institutions who skirt the law or outright violate it, assuming it is easier to ask forgiveness than permission? It’s not entirely obvious. We would not have many innovations that we rely on today without some people behaving in this fashion, but that doesn’t necessarily mean it’s worth it. Is there a devaluation of the rule of law that comes from letting these situations pass by?




 Like many listeners of
 [99% Invisible](https://99percentinvisible.org/episode/the-power-broker-03-david-sims/) 
 these days, I’m reading
 [The Power Broker by Robert Caro.](https://99percentinvisible.org/episode/the-power-broker-03-david-sims/) 
 Hearing about how Robert Moses handled questions of law in New York at the turn of the 20th century is fascinating, because his style of handling zoning laws seems reminiscent of the way Uber handled laws around livery drivers in early 2010’s San Francisco, and the way large companies building generative AI are dealing with copyright now. Instead of abiding by laws, they have taken the attitude that legal strictures don’t apply to them because what they are building is so important and valuable.




 I’m just not convinced that’s true, however. Each case is distinctive in some ways, of course, but the concept that a powerful man can decide that what he thinks is a good idea is inevitably more important than what anyone else thinks rubs me the wrong way. Generative AI may be useful, but to argue that it is more important than having a culturally vibrant and creative society seems disingenuous. The courts still have to decide whether generative AI is having a chilling effect on artists and creators, but the court cases being brought by those creators are arguing that it is.



### 
 The Future



 The US Copyright Office is not ignoring these challenging problems, although they may be a little late to the party, but they have put out a
 [recent blog post talking about their plans](https://blogs.loc.gov/copyright/2024/03/looking-forward-the-u-s-copyright-offices-ai-initiative-in-2024/) 
 for content related to generative AI. However, it’s very short on specifics and only tells us that reports are forthcoming in the future. The three areas this department’s work is going to focus on are:



* “digital replicas”: basically deepfakes and digital twins of people (think stunt doubles and actors having to get scanned at work so they can be mimicked digitally)
* “copyrightability of works incorporating AI-generated material”
* “training AI models on copyrighted works”



 These are all important topics, and I hope the results will be thoughtful. (I’ll write about them once these reports come out.) I hope the policymakers engaged in this work will be well informed and technically skilled, because it could be very easy for a bureaucrat to make this whole situation worse with ill-advised new rules.




 Another future possibility is that ethical datasets will be developed for training. This is something already being done by some folks at HuggingFace in the form of a
 [code dataset called The Stack](https://www.bigcode-project.org/docs/about/the-stack/) 
 . Could we do this sort of thing for other forms of content?



### 
 Conclusion



 Regardless of what the government or industry comes up with, however, the courts are proceeding to decide this problem. What happens if one of the cases in the courts is lost by the generative AI side?




 It may at least mean that some of the money being produced by generative AI will be passed back to creators. I’m not terribly convinced that the whole idea of generative AI will disappear, although we did see the end of a lot of companies during the era of Napster. Courts could bankrupt companies producing generative AI, and/or ban the production of generative AI models — this is not impossible! I don’t think it’s the most likely outcome, however- instead, I think we’ll see some penalties and some fragmentation of the law around this (this model is ok, that model is not, and so on), which may or may not make the situation any clearer legally.




 I would really like it if the courts take up the question of when and how a generative AI model should be considered infringing, not separating the input and output questions but examining them together as a single whole, because I think that is key to understanding the situation. If they do, we might be able to come up with legal frameworks that make sense for the new technology we are dealing with. If not, I fear we’ll end up further into a quagmire of laws woefully unprepared to guide our digital innovations.
 [We need copyright law that makes more sense in the context of our digital world](https://www.theatlantic.com/technology/archive/2024/02/generative-ai-lawsuits-copyright-fair-use/677595/) 
 . But we also need to intelligently protect human art and science and creativity in various forms, and I don’t think AI-generated content is worth trading that away.




*Read more of my content at* 
[*www.stephaniekirmer.com.*](http://www.stephaniekirmer.com.)



### 
 References and Additional Reading


* [Teaching Copyright](https://www.eff.org/teachingcopyright)
* [Looking Forward: The U.S. Copyright Office's AI Initiative in 2024 | Copyright](https://blogs.loc.gov/copyright/2024/03/looking-forward-the-u-s-copyright-offices-ai-initiative-in-2024/)
* [The scary truth about AI copyright is nobody knows what will happen next](https://www.theverge.com/23444685/generative-ai-copyright-infringement-legal-fair-use-training-data)
* [Will AI Destroy the DMCA Copyright Compromise? - Frost Brown Todd | Full-Service Law Firm](https://frostbrowntodd.com/will-ai-destroy-the-dmca-copyright-compromise/)
* [Generative AI Is Challenging a 234-Year-Old Law](https://www.theatlantic.com/technology/archive/2024/02/generative-ai-lawsuits-copyright-fair-use/677595/)
* [How copyright law could threaten the AI industry in 2024](https://www.reuters.com/legal/litigation/how-copyright-law-could-threaten-ai-industry-2024-2024-01-02/)
* [How AI copyright lawsuits could make the whole industry go extinct](https://www.theverge.com/24062159/ai-copyright-fair-use-lawsuits-new-york-times-openai-chatgpt-decoder-podcast)
* [The current legal cases against generative AI are just the beginning | TechCrunch](https://techcrunch.com/2023/01/27/the-current-legal-cases-against-generative-ai-are-just-the-beginning/?guccounter=1&guce_referrer=aHR0cHM6Ly9kdWNrZHVja2dvLmNvbS8&guce_referrer_sig=AQAAABRQgH3ZwO8oOc9nW5_yjeAzOTyc-jQkQNZk1QSLUuta6S67PC5WHTgJ2jU6wGaS3eNDtKRgqeKNBAFYGEZTcH4ZJpV-zfblEzUev6vxNik6cbM8bmap6ek1_a3vD6rL-VKtzL8An4VklVjrRPOK7seMP2P5Gy0dTvXOejoATPMi)
* [The Intercept charts a new legal strategy for digital publishers suing OpenAI](https://www.niemanlab.org/2024/03/the-intercept-charts-a-new-legal-strategy-for-digital-publishers-suing-openai/)
* [Patronus AI | Introducing CopyrightCatcher, the first Copyright Detection API for LLMs](https://www.patronus.ai/blog/introducing-copyright-catcher)





---



[The Coming Copyright Reckoning for Generative AI](https://towardsdatascience.com/the-coming-copyright-reckoning-for-generative-ai-b7fe0963c58f) 
 was originally published in
 [Towards Data Science](https://towardsdatascience.com) 
 on Medium, where people are continuing the conversation by highlighting and responding to this story.



