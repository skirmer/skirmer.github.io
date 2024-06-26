



---
date: 2023-09-17
featured_image: "https://cdn-images-1.medium.com/max/1024/0*IUPcjDKR0ChmLBfa"
tags: ["deep-learning","ai","large-language-models","editors-pick","machine-learning"]
title: "What Does It Mean When Machine Learning Makes a Mistake?"
disable_share: false
---
      
#### 
 Do our definitions of “mistake” make sense when it comes to ML/AI? If not, why not?



 A comment on my recent post about the public perception of machine learning got me thinking about the meaning of error in machine learning. The reader asked if I thought machine learning models would always “make mistakes”. As I described in that post, people have a strong tendency to anthropomorphize machine learning models. When we interact with an LLM chatbot, we apply techniques to those engagements that we have learned by communicating with other people—persuasion, phrasing, argument, etc. However, this is often ineffective and will result in unsatisfying responses.




 In my own day to day work, I see similar sorts of issues related to classifiers and regression models as well. My team and I spend a lot of time and energy trying to help customers and colleagues understand that machine learning is not perfect (and realistically never will be). “Why did the model say X when the truth turned out to be X-5?” is a perpetual theme. I don’t blame the question askers, at least not entirely, because as I wrote in my last piece, we in the broader machine learning community have not done a good job of teaching fundamental ML literacy.




 But this brings up a core question that needs more interrogation before we can really fix that literacy problem.




> 
>  What do we mean (and what do other people mean) when they say that a model made a mistake, or failed, or hallucinated, or lied?
> 



 Before we can answer that, we need to start from the beginning.



### 
 What is a machine learning model?



 In a very, very general sense, a machine learning model is an algorithm that accepts some input or prompt and returns some response that is probabilistically determined. How it decides what the response should be can vary dramatically - it might use a decision tree, or a neural network, or a linear regression, or any number of other types of machine learning.




 To create a model, we start with sample data that reflects the results we are looking for. The input samples can be all kinds of things—for generative AI, they could be large bodies of human-written text, or music or images. For other kinds of ML, they could be large datasets containing things like object characteristics, or classifications of things like images or texts into categories, or much more.




 Sometimes those will be “labeled” so that the model learns which ones are desirable or not, or which ones fall into a specific category and which other ones don’t. Other times, the model will learn patterns in the underlying samples and derive their own understanding of those patterns, to either replicate the characteristics of inputs, choose between options, divide inputs into groups, or other activities.



### 
 Ways generative AI models are trained



 The way we train generative models is specific, and more complicated than training a model to estimate the simple probability of one answer. Instead, these models are estimating the probabilities of many different elements and putting them together to create their response. Here are very simple explanations of a few of the ways we do this training. (These are all EXTREME oversimplications, so please forgive the lack of detail and any generalizations.)




 When we’re generating sound or images, we may use Generative Adversarial Networks. Here, models are pitted against each other, with one model generating new content and the other model attempting to tell if that content came from a model or not, back and forth. The two models compete for thousands and thousands of cases, each getting better at their task as they go. In the end, the generating model will be able to produce content that is nearly indistinguishable from what reality would produce. (The distinguishing model also gets very good at telling when an input was human generated, as a side effect.)




 For LLMs, and text generation like the GPT models, we use what we call Transformers. This training involves teaching the model an understanding of how words’ meanings relate to each other, as well as how to produce text content that is near-indistinguishable from human production. The results sound very convincing because the model knows which words are likely to go together (with probabilities based on how real human language used in training has put them together).




 To generate images from text inputs, like Dall-E, we use Diffusion. In this case, we teach the model to calculate what kinds of features of an image are most probably desired, based on the text that’s been provided. The model essentially starts with an image that’s just static, and based on your text, applies details/colors/features. This is based on what it has learned about how text
 *usually* 
 corresponds to images, according to its training data.




 Using these techniques, we teach models to decipher patterns in inputs — sometimes patterns we ourselves can’t even really explain or detect (especially true for deep learning), and then the model is able to interpret and apply those patterns. All of this is mathematics under the surface, even though the patterns may be in text, or images, or many other things.




 Now that we know this, we can talk about what the outputs are, and what it means when the output isn’t what we wanted.



### 
 Outputs



 The things a machine learning model produces can vary widely. Generative AI in particular produces images, video, audio, and text of every imaginable kind. Other kinds of models give us the likelihood of events/phenomena, estimates of unknown values, translations of text into different languages, labels or groupings for content, and more.




 In all of these cases, complex mathematical calculations are employed to estimate the best response based on the given input. “Best” is a very specific thing, however. In the process of creating the model, you have indicated to the model what character you want its responses to have.




> 
>  In the process of creating the model, you have indicated to the model what character you want its responses to have.
> 


### 
 What does it mean when we get something we didn’t expect?



**This is as much about us as it is about the model.** 
 It’s essentially like any product in the tech space. The product designers and creators put together “user stories” when they are developing something to sell to folks, and this is comprised of narratives about who will use this product, how, and why, and what they will want to get out of it.




 For example, say we’re designing a spreadsheet tool. We’d use user stories to think about Anne, the accountant, and we’d talk to accountants to decide what kind of features an accountant needs in their spreadsheet software. Then we’d think about Bob, the business analyst, and we’d talk to BI analysts about what their feature needs would be. We’d put all these on our list when planning the spreadsheet tool and use this to guide our design. You get the idea.




**Who’s the user for a machine learning model?** 
 It depends completely on what kind of model it is. If your model, for example, predicts home prices based on property features, it might be realtors or mortgage lenders or home buyers. A relatively specific model that has clear, bounded applications is easy to tailor for the user. We data scientists can make sure this model meets the expectations of people who will be using it.




 Sometimes the prediction will not be accurate, but that’s a mathematical problem, and we can likely decipher why that happened. Maybe we gave the model wrong data, or this house is exceptional for some reason we couldn’t tell the model, for example. If the model has never been taught to interpret the effect of, say, a backyard zoo on house price, it won’t have a way to incorporate that information. What if there’s been a housing price crash? We saw that not long ago, and you can imagine the patterns the model learned from before the crash would no longer apply.




 However, in a case like this, we have two things:



1. A clear goal the model is meant to achieve, that the data scientists and users are both aware of;
2. A quantifiable way to measure whether the model got close to its goal or not.



 This means it is clear and straightforward when we want to define whether the model was successful. After we make that determination, we can explore why the model did what it did — this is what’s called “model explainability” or “model interpretability” in the field.



### 
 But for LLMs?



 What does this whole framework mean for something like an LLM? Who’s the user for ChatGPT? (Did you just mentally say “everybody”?) When a model’s output can be as complex and varied as that of an LLM, we start to have questions.




 For the data scientists who built generative AI models, though they may employ different training methods, we are generally always trying to create content that is as close as possible to the training data, which is usually human or nature generated. To make that happen, the model is trained on sample content that people or nature DID produce. We do our best to give the model a mathematical way to understand how and why this content feels “real”, so it can replicate that. This is how a generative AI model becomes able to create efficiencies and make certain human work obsolete.




> 
>  For the data scientists who built generative AI models, the goal is to create content that is as close as possible to the training data, which is usually human or nature generated.
> 



 These models, by and large, are excellent at what they do in this regard! However, this creates some pitfalls. Because LLM models are so convincing at imitating human responses, users shorthand think of them as like people. It’s like the way children learn about animals — you teach a child that a furry creature with four legs and a wet nose is a dog, but then you put a cat in front of them, and they’re inclined to think that’s probably also a dog, because the basic features seem so similar. Only when you explain that the cat is a different thing do they start to interpret the differences and build a different mental model.




> 
>  Because these models are so convincing at imitating human responses, users shorthand think of them as like people.
> 



 Right now, I think most of the public is still building that different mental model to distinguish an LLM from a person. (As I wrote previously, data scientists need to be the adult explaining that a dog is not the same as a cat, to carry on the metaphor.)




 But I’ve gotten a little off track. What this really means is that people interacting with a very basic model (home prices) understand this is a limited algorithm. It’s more like a spreadsheet formula than like a person, and this shapes our expectations. But when we use ChatGPT, for example, it carries a lot of the characteristics of chatting online with a human being, and this affects us. Instead of expecting only limited things, like “text that sounds like human language”, we start expecting that statements will always be accurate, that the results will include cohesive critical thinking, and that facts from today’s news will be retrievable from the model, even though it was trained last year, for example.




> 
>  [P]eople interacting with a very basic model understand this is a limited algorithm. … But when we use ChatGPT, for example, it carries a lot of the characteristics of chatting online with a human being, and this affects us.
> 



 To the extent that the appearance of critical thinking may occur in model results, that’s because the model has learned that the arrangements of text that we interpret as “critical thinking” from real human sources sound more “human”, and so it is imitating these arrangements for that purpose. When we talk to people, we infer from what they say that they are using critical thinking. We can’t do that with machine learning, however.




 Remember the two key elements I described above that the house price model has:




> 
>  1. A clear goal the model is meant to achieve, that the data scientists and users are both aware of;
> 



> 
>  2. A quantifiable way to measure whether the model got close to its goal or not.
> 



 With generative AI, including but not limited to LLMs, we’ve got problems with 1, partly because the goal is not actually that clear (“return material that is indistinguishable from what a human would produce”) but mostly because the data scientists are definitely not communicating successfully to users what that goal is. Data scientists working on these models have got number 2, because they are using complex mathematical systems to teach the models when they have produced sufficiently “real” or human-like content. But for the regular user on the street, this is a lot harder. Determining if the model did a good job is much like grading papers, rather than checking the result of a math problem. Subjectivity creeps in.




 But even if it was easier to measure, I strongly argue that users, even some technically savvy and highly educated ones, are not really clear on what these models have been trained to do, and therefore can’t know what is realistic to expect and what is not. Therefore, results that are perfectly appropriate for the model, such as a fluid, eloquent, perfectly “human” paragraph describing how the moon is made of green cheese, is going to be seen as a “mistake”. It’s not, though- this output met its training goals- and that’s the source of a lot of our confusion.



### 
 Calibrating expectations



 This suggests that we need to calibrate expectations of these models, and I hope this article perhaps can help with that. To successfully use a machine learning model, and tell the difference between error and the expected behavior, you need to have an understanding of what tasks the models have been trained to perform and the nature of the training data. If you get really fancy, you’d also have clear context for how the data scientists behind that model measured success, because that dramatically shapes the model’s behavior.




 By incorporating these elements, you will have the context required to understand what the model’s results mean, and will be able to interpret them accurately — your expectations will be reasonable and you’ll know whether they were met. And, you’ll know what a “mistake” really means when it comes to machine learning.




 There is some useful material out there clarifying a lot of this (how they’re trained, what the responses really mean) for popular generative machine learning models, and I’ve added a few links to some below. (I am not endorsing all opinions in these materials, but just offering them as options for those who want to learn more about generative AI.)



* [Are AI models doomed to always hallucinate? | TechCrunch](https://techcrunch.com/2023/09/04/are-language-models-doomed-to-always-hallucinate/)
* [Google Cloud Skills Boost](https://www.cloudskillsboost.google/journeys/118)



 Garon, Jon M., A Practical Introduction to Generative AI, Synthetic Media, and the Messages Found in the Latest Medium (March 14, 2023). Available at SSRN:
 <https://ssrn.com/abstract=4388437>
 or
 [http://dx.doi.org/10.2139/ssrn.4388437](https://dx.doi.org/10.2139/ssrn.4388437) 




*See more of my work at* 
[*www.stephaniekirmer.com*](http://www.stephaniekirmer.com/)
*.* 




*Note: I usually say “machine learning” and not AI, but in the case of “generative AI” I choose to use that phrase because of its wide adoption across the field.* 






---



[What Does It Mean When Machine Learning Makes a Mistake?](https://towardsdatascience.com/what-does-it-mean-when-machine-learning-makes-a-mistake-37b213200697) 
 was originally published in
 [Towards Data Science](https://towardsdatascience.com) 
 on Medium, where people are continuing the conversation by highlighting and responding to this story.



