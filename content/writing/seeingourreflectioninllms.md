



---
date: 2024-03-02
featured_image: "https://cdn-images-1.medium.com/max/1024/0*HkUTtfff7Bxn4ds8"
tags: ["bias-in-ai","ai","llm","machine-learning","editors-pick"]
title: "Seeing Our Reflection in LLMs"
disable_share: false
---
      
#### 
 When LLMs give us outputs that reveal flaws in human society, can we choose to listen to what they tell us?


### 
 Machine Learning, Nudged



 By now, I’m sure most of you have heard the news about
 [Google’s new LLM\*, Gemini, generating pictures of racially diverse people in Nazi uniforms](https://www.vox.com/future-perfect/2024/2/28/24083814/google-gemini-ai-bias-ethics) 
 . This little news blip reminded me of something that I’ve been meaning to discuss, which is when models have blind spots, so we apply expert rules to the predictions they generate to avoid returning something wildly outlandish to the user.




 This sort of thing is not that uncommon in machine learning, in my experience, especially when you have flawed or limited training data. A good example of this that I remember from my own work was predicting when a package was going to be delivered to a business office. Mathematically, our model would be very good at estimating exactly when the package would get physically near the office, but sometimes, truck drivers arrive at destinations late at night and then rest in their truck or in a hotel until morning. Why? Because no one’s in the office to receive/sign for the package outside of business hours.




 Teaching a model about the idea of “business hours” can be very difficult, and the much easier solution was just to say, “If the model says the delivery will arrive outside business hours, add enough time to the prediction that it changes to the next hour the office is listed as open.” Simple! It solves the problem and it reflects the actual circumstances on the ground. We’re just giving the model a little boost to help its results work better.




 However, this does cause some issues. For one thing, now we have two different model predictions to manage. We can’t just throw away the original model prediction, because that’s what we use for model performance monitoring and metrics. You can’t assess a model on predictions after humans got their paws in there, that’s not mathematically sound. But to get a clear sense of the real world model impact, you do want to look at the post-rule prediction, because that’s what the customer actually experienced/saw in your application. In ML, we’re used to a very simple framing, where every time you run a model you get one result or set of results, and that’s that, but when you start tweaking the results before you let them go, then you need to think at a different scale.



### 
 Applying to LLMs



 I kind of suspect that this is a form of what’s going on with LLMs like Gemini. However, instead of a post-prediction rule, it appears that the
 [smart money says Gemini and other models are applying “secret” prompt augmentations to try and change the results the LLMs produce.](https://www.washingtonpost.com/technology/2024/02/22/google-gemini-ai-image-generation-pause/?pwapi_token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyZWFzb24iOiJnaWZ0IiwibmJmIjoxNzA4ODM3MjAwLCJpc3MiOiJzdWJzY3JpcHRpb25zIiwiZXhwIjoxNzEwMjE1OTk5LCJpYXQiOjE3MDg4MzcyMDAsImp0aSI6IjFhMzAyYjkyLTRkN2ItNDNmMi1hNThlLWY1MDBjY2I2NDFjMyIsInVybCI6Imh0dHBzOi8vd3d3Lndhc2hpbmd0b25wb3N0LmNvbS90ZWNobm9sb2d5LzIwMjQvMDIvMjIvZ29vZ2xlLWdlbWluaS1haS1pbWFnZS1nZW5lcmF0aW9uLXBhdXNlLyJ9.E-JdVAohho0X-rTsTb1bfof4gIpYl8-NpPdZwL6h9Dc) 




 In essence, without this nudging, the model will produce results that are reflective of the content it has been trained on. That is to say, the content produced by real people. Our social media posts, our history books, our museum paintings, our popular songs, our Hollywood movies, etc. The model takes in all that stuff, and it learns the underlying patterns in it, whether they are things we’re proud of or not. A model given all the media available in our contemporary society is going to get a whole lot of exposure to racism, sexism, and myriad other forms of discrimination and inequality, to say nothing of violence, war, and other horrors. While the model is learning what people look like, and how they sound, and what they say, and how they move, it’s learning the warts-and-all version.




> 
>  Our social media posts, our history books, our museum paintings, our popular songs, our Hollywood movies, etc. The model takes in all that stuff, and it learns the underlying patterns in it, whether they are things we’re proud of or not.
> 



 This means that if you ask the underlying model to show you a doctor, it’s going to probably be a white guy in a lab coat. This isn’t just random, it’s because in our modern society white men have disproportionate access to high status professions like being doctors, because they on average have access to more and better education, financial resources, mentorship, social privilege, and so on. The model is reflecting back at us an image that may make us uncomfortable because we don’t like to think about that reality.



### 
 So what do we do?



 The obvious argument is, “Well, we don’t want the model to reinforce the biases our society already has, we want it to improve representation of underrepresented populations.” I sympathize with this argument, quite a lot, and I care about representation in our media. However, there’s a problem.




 It’s very unlikely that applying these tweaks is going to be a sustainable solution. Recall back to the story I started with about Gemini. It’s like playing whac-a-mole, because the work never stops — now we’ve got people of color being shown in Nazi uniforms, and this is understandably deeply offensive to lots of folks. So, maybe where we started by randomly applying “as a black person” or “as an indigenous person” to our prompts, we have to add something more to make it exclude cases where it’s inappropriate — but how do you phrase that, in a way an LLM can understand? We probably have to go back to the beginning, and think about how the original fix works, and revisit the whole approach. In the best case, applying a tweak like this fixes one narrow issue with outputs, while potentially creating more.




 Let’s play out another very real example. What if we add to the prompt, “Never use explicit or profane language in your replies, including [list of bad words here]”. Maybe that works for a lot of cases, and the model will refuse to say bad words that a 13 year old boy is requesting to be funny.
 [But sooner or later, this has unexpected additional side effects.](https://www.wired.com/story/ai-list-dirty-naughty-obscene-bad-words/) 
 What about if someone’s looking for the
 [history of Sussex, England](https://www.boredpanda.com/people-with-dirty-last-names-problems/) 
 ? Alternately, someone’s going to come up with a bad word you left out of the list, so that’s going to be constant work to maintain. What about bad words in other languages?
 [Who judges what goes on the list](https://www.newsweek.com/twitter-lgbtq-censor-censorship-elon-musk-1792139) 
 ? I have a headache just thinking about it.




 This is just two examples, and I’m sure you can think of more such scenarios. It’s like putting band aid patches on a leaky pipe, and every time you patch one spot another leak springs up.



### 
 Where do we go from here?



 So, what is it we actually want from LLMs? Do we want them to generate a highly realistic mirror image of what human beings are actually like and how our human society actually looks from the perspective of our media? Or do we want a sanitized version that cleans up the edges?




 Honestly, I think we probably need something in the middle, and we have to continue to renegotiate the boundaries, even though it’s hard. We don’t want LLMs to reflect the real horrors and sewers of violence, hate, and more that human society contains, that is a part of our world that should not be amplified even slightly.
 [Zero content moderation is not the answer.](https://open.substack.com/pub/platformer/p/why-platformer-is-leaving-substack?selection=61e54bce-0a54-44d7-9e24-86bc2ac24e36&utm_campaign=post-share-selection&utm_medium=web) 
 Fortunately, this motivation aligns with the desires of large corporate entities running these models to be popular with the public and make lots of money.




> 
>  …we have to continue to renegotiate the boundaries, even though it’s hard. We don’t want LLMs to reflect the real horrors and sewers of violence, hate, and more that human society contains, that is a part of our world that should not be amplified even slightly. Zero content moderation is not the answer.
> 



 However, I do want to continue to make a gentle case for the fact that we can also learn something from this dilemma in the world of LLMs. Instead of simply being offended and blaming the technology when a model generates a bunch of pictures of a white male doctor, we should pause to understand why that’s what we received from the model. And then we should debate thoughtfully about whether the response from the model should be allowed, and make a decision that is founded in our values and principles, and try to carry it out to the best of our ability.




 As I’ve said before, an LLM isn’t an alien from another universe, it’s us. It’s trained on the things
 **we** 
 wrote/said/filmed/recorded/did. If we want our model to show us doctors of various sexes, genders, races, etc, we need to make a society that enables all those different kinds of people to have access to that profession and the education it requires. If we’re worrying about how the model mirrors us, but not taking to heart the fact that it’s us that needs to be better, not just the model, then we’re missing the point.




> 
>  If we want our model to show us doctors of various sexes, genders, races, etc, we need to make a society that enables all those different kinds of people to have access to that profession and the education it requires.
> 



 \*I’m sure I’m not the only one to think this, but since Gemini is definitionally multimodal, using not just language but audio, video, etc in training, “LLM” seems like the wrong term for it. But all the references I find online still seem to be using that word.




*You can find more of my work at* 
[*www.stephaniekirmer.com.*](http://www.stephaniekirmer.com.)



### 
 References


* [Black Nazis? A woman pope? That's just the start of Google's AI problem.](https://www.vox.com/future-perfect/2024/2/28/24083814/google-gemini-ai-bias-ethics)
* [Google takes down Gemini AI image generator. Here's what you need to know.](https://www.washingtonpost.com/technology/2024/02/22/google-gemini-ai-image-generation-pause/?pwapi_token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyZWFzb24iOiJnaWZ0IiwibmJmIjoxNzA4ODM3MjAwLCJpc3MiOiJzdWJzY3JpcHRpb25zIiwiZXhwIjoxNzEwMjE1OTk5LCJpYXQiOjE3MDg4MzcyMDAsImp0aSI6IjFhMzAyYjkyLTRkN2ItNDNmMi1hNThlLWY1MDBjY2I2NDFjMyIsInVybCI6Imh0dHBzOi8vd3d3Lndhc2hpbmd0b25wb3N0LmNvbS90ZWNobm9sb2d5LzIwMjQvMDIvMjIvZ29vZ2xlLWdlbWluaS1haS1pbWFnZS1nZW5lcmF0aW9uLXBhdXNlLyJ9.E-JdVAohho0X-rTsTb1bfof4gIpYl8-NpPdZwL6h9Dc)
* [AI and the List of Dirty, Naughty, Obscene, and Otherwise Bad Words](https://www.wired.com/story/ai-list-dirty-naughty-obscene-bad-words/)
* [People With 'Offensive' Last Names Shared Their Everyday Problems, And It's Hilarious](https://www.boredpanda.com/people-with-dirty-last-names-problems/)
* [Why Platformer is leaving Substack](https://open.substack.com/pub/platformer/p/why-platformer-is-leaving-substack?selection=61e54bce-0a54-44d7-9e24-86bc2ac24e36&utm_campaign=post-share-selection&utm_medium=web)





---



[Seeing Our Reflection in LLMs](https://towardsdatascience.com/seeing-our-reflection-in-llms-7b9505e901fd) 
 was originally published in
 [Towards Data Science](https://towardsdatascience.com) 
 on Medium, where people are continuing the conversation by highlighting and responding to this story.



