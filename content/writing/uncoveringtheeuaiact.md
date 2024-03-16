



---
date: 2024-03-14
featured_image: "https://cdn-images-1.medium.com/max/1024/0*wAh-YBiKpVD2oBVX"
tags: ["editors-pick","law","data-science","ai","machine-learning"]
title: "Uncovering the EU AI Act"
disable_share: false
---
      
#### 
 The EU has moved to regulate machine learning. What does this new law mean for data scientists?



[The EU AI Act just passed the European Parliament](https://artificialintelligenceact.eu/) 
 . You might think, “I’m not in the EU, whatever,” but trust me, this is actually more important to data scientists and individuals around the world than you might think. The EU AI Act is a major move to regulate and manage the use of certain machine learning models in the EU or that affect EU citizens, and it contains some strict rules and serious penalties for violation.




 This law has a lot of discussion about risk, and this means risk to the health, safety, and fundamental rights of EU citizens. It’s not just the risk of some kind of theoretical AI apocalypse, it’s about the day to day risk that real people’s lives are made worse in some way by the model you’re building or the product you’re selling. If you’re familiar with many debates about AI ethics today, this should sound familiar. Embedded discrimination and violation of people’s rights, as well as harm to people’s health and safety, are serious issues facing the current crop of AI products and companies, and this law is the EU’s first effort to protect people.



### 
 Defining AI



 Regular readers know that I always want “AI” to be well defined, and am annoyed when it’s too vague. In this case,
 [the Act defines “AI” as follows](https://artificialintelligenceact.eu/article/3/) 
 :




> 
>  A machine-based system designed to operate with varying levels of autonomy that may exhibit adaptiveness after deployment and that, for explicit or implicit objectives, infers from the input it receives, how to generate outputs such as predictions, content, recommendations or decisions that can influence physical or virtual environments.
> 



 So, what does this really mean? My interpretation is that machine learning models that produce outputs that are used to influence the world (especially people’s physical or digital conditions) fall under this definition. It doesn’t have to adapt live or retrain automatically, although if it does that’s covered.




 But if you’re building ML models that are used to do things like…



* decide on people’s risk levels, such as credit risk, rule or lawbreaking risk, etc
* determine what content people online are shown in a feed, or in ads
* differentiate prices shown to different people for the same products
* recommend the best treatment, care, or services for people
* recommend whether people take certain actions or not



 These will all be covered by this law, if your model effects anyone who is a citizen of the EU — and that’s just to name a few examples.



### 
 Classifying AI Applications



 All AI is not the same, however, and the law acknowledges that. Certain applications of AI are going to be banned entirely, and others subjected to much higher scrutiny and transparency requirements.



#### 
 Unacceptable Risk AI Systems



 These kinds of systems are now called “Unacceptable Risk AI Systems” and are
 **simply not allowed** 
 . This part of the law is going into effect first, six months from now.



* Behavioral manipulation or deceptive techniques to get people to do things they would otherwise not
* Targeting people due to things like age or disability to change their behavior and/or exploit them
* Biometric categorization systems, to try to classify people according to highly sensitive traits
* Personality characteristic assessments leading to social scoring or differential treatment
* “Real-time” biometric identification for law enforcement outside of a select set of use cases (targeted search for missing or abducted persons, imminent threat to life or safety/terrorism, or prosecution of a specific crime)
* Predictive policing (predicting that people are going to commit crime in the future)
* Broad facial recognition/biometric scanning or data scraping
* Emotion inferring systems in education or work without a medical or safety purpose



 This means, for example, you can’t build (or be forced to submit to) a screening that is meant to determine whether you’re “happy” enough to get a retail job. Facial recognition is being restricted to only select, targeted, specific situations. (
 [Clearview AI is definitely an example of that](https://www.theverge.com/23919134/kashmir-hill-your-face-belongs-to-us-clearview-ai-facial-recognition-privacy-decoder) 
 .) Predictive policing, something I worked on in academia early in my career and now very much regret, is out.




 The “biometric categorization” point refers to models that group people using risky or sensitive traits like political, religious, philosophical beliefs, sexual orientation, race, and so on. Using AI to try and label people according to these categories is understandably banned under the law.



#### 
 High Risk AI Systems



 This list, on the other hand, covers systems that are not banned, but highly scrutinized. There are specific rules and regulations that will cover all these systems, which are described below.



* AI in medical devices
* AI in vehicles
* AI in emotion-recognition systems
* AI in policing



 This is excluding those specific use cases described above. So, emotion-recognition systems might be allowed, but not in the workplace or in education. AI in medical devices and in vehicles are called out as having serious risks or potential risks for health and safety, rightly so, and need to be pursued only with great care.



#### 
 Other



 The other two categories that remain are “Low Risk AI Systems” and “General Purpose AI Models”. General Purpose models are things like GPT-4, or Claude, or Gemini — systems that have very broad use cases and are usually employed within other downstream products. So, GPT-4 by itself isn’t in a high risk or banned category, but the ways you can embed them for use is limited by the other rules described here. You can’t use GPT-4 for predictive policing, but GPT-4 can be used for low risk cases.



### 
 Transparency and Scrutiny



 So, let’s say you’re working on a
 **high risk** 
 AI application, and you want to follow all the rules and get approval to do it. How to begin?




 For High Risk AI Systems, you’re going to be responsible for the following:



* **Maintain and ensure data quality** 
 : The data you’re using in your model is your responsibility, so you need to curate it carefully.
* **Provide documentation and traceability** 
 : Where did you get your data, and can you prove it? Can you show your work as to any changes or edits that were made?
* **Provide transparency** 
 : If the public is using your model (think of a chatbot) or a model is part of your product, you have to tell the users that this is the case. No pretending the model is just a real person on the customer service hotline or chat system.
 *This is actually going to apply to all models, even the low risk ones.*
* **Use human oversight** 
 : Just saying “the model says…” isn’t going to cut it. Human beings are going to be responsible for what the results of the model say and most importantly, how the results are used.
* **Protect cybersecurity and robustness** 
 : You need to take care to make your model safe against cyberattacks, breaches, and unintentional privacy violations. Your model screwing up due to code bugs or hacked via vulnerabilities you didn’t fix is going to be on you.
* **Comply with impact assessments** 
 : If you’re building a high risk model, you need to do a rigorous assessment of what the impact could be (even if you don’t mean to) on the health, safety, and rights of users or the public.
* **For public entities, registration in a public EU database** 
 : This registry is being created as part of the new law, and filing requirements will apply to “public authorities, agencies, or bodies” — so mainly governmental institutions, not private businesses.


#### 
 Testing



 Another thing the law makes note of is that if you’re working on building a high risk AI solution, you need to have a way to test it to ensure you’re following the guidelines, so
 [there are allowances for testing](https://artificialintelligenceact.eu/article/54b/) 
 on regular people once you get informed consent. Those of us from the social sciences will find this pretty familiar — it’s a lot like getting institutional review board approval to run a study.



#### 
 Effectiveness



 The law has a staggered implementation:



* In 6 months, the prohibitions on unacceptable risk AI take effect
* In 12 months, general purpose AI governance takes effect
* In 24 months, all the remaining rules in the law take effect



 Note: The law does not cover purely personal, non-professional activities, unless they fall into the prohibited types listed earlier, so your tiny open source side project isn’t likely to be a risk.



### 
 Penalties



 So, what happens if your company fails to follow the law, and an EU citizen is affected?
 [There are explicit penalties in the law.](https://artificialintelligenceact.eu/article/71/) 




 If you do one of the prohibited forms of AI described above:



* Fines of up to
 **35 million Euro** 
 or, if you’re a business,
 **7% of your global revenue** 
 from the last year (whichever is higher)



 Other violation not included in the prohibited set:



* Fines of up to
 **15 million Euro** 
 or, if you’re a business,
 **3% of your global revenue** 
 from the last year (whichever is higher)



 Lying to authorities about any of these things:



* Fines of up to
 **7.5 million Euro** 
 or, if you’re a business,
 **1% of your global revenue** 
 from the last year (whichever is higher)



 Note: For small and medium size businesses, including startups, then the fine is whichever of the numbers is lower, not higher.



### 
 What Should Data Scientists Do?



 If you’re building models and products using AI under the definition in the Act, you should first and foremost
 **familiarize yourself with the law and what it’s requiring** 
 . Even if you aren’t affecting EU citizens today, this is likely to have a major impact on the field and you should be aware of it.




 Then, watch out for potential violations in your own business or organization. You have some time to find and remedy issues, but the banned forms of AI take effect first. In large businesses, you’re likely going to have a legal team, but don’t assume they are going to take care of all this for you. You are the expert on machine learning, and so you’re a very important part of how the business can detect and avoid violations. You can use
 [the Compliance Checker tool on the EU AI Act website](https://artificialintelligenceact.eu/assessment/eu-ai-act-compliance-checker/) 
 to help you.




 There are many forms of AI in use today at businesses and organizations that are not allowed under this new law. I mentioned Clearview AI above, as well as predictive policing. Emotional testing is also a very real thing that people are subjected to during job interview processes (I invite you to google “emotional testing for jobs” and see the onslaught of companies offering to sell this service), as well as high volume facial or other biometric collection. It’s going to be extremely interesting and important for all of us to follow this and see how enforcement goes, once the law takes full effect.




 I’d like to take a moment here and say a few words about a dear friend of mine who passed this week after a tough struggle with cancer. Ed Visel, known online as alistaire, was an outstanding data scientist and gave a ton of his time and talent to the broader data science community.
 [If you asked an R question on StackOverflow in the last decade, there’s a good chance he helped you](https://stackoverflow.com/users/4497050/alistaire) 
 . He was always patient and kind, because having been a self-made data scientist like me, he knew what it was like to learn this stuff the hard way, and never lost that empathy.






 Photo by the author
 


 I had the immense good fortune to work with Ed for a few years, and to be his friend for several more. We lost him far too soon, and my ask is that you help a friend or colleague solve a technical problem in his memory. The data science community is going to be a less friendly place without him.




 In addition, if you knew Ed, either online or in person, the family has asked for donations to
 [Severson Dells Nature Center](https://www.seversondells.com/) 
 , a place that was special to him.




*Read more of my content at* 
[*www.stephaniekirmer.com.*](http://www.stephaniekirmer.com.)



### 
 References and Further Reading



[The AI Act Explorer](https://artificialintelligenceact.eu/ai-act-explorer/) 




<https://www.theverge.com/23919134/kashmir-hill-your-face-belongs-to-us-clearview-ai-facial-recognition-privacy-decoder>



* [EU AI Act Compliance Checker](https://artificialintelligenceact.eu/assessment/eu-ai-act-compliance-checker/)
* [Europe agrees landmark AI regulation deal](https://www.reuters.com/technology/stalled-eu-ai-act-talks-set-resume-2023-12-08/)





---



[Uncovering the EU AI Act](https://towardsdatascience.com/uncovering-the-eu-ai-act-22b10f946174) 
 was originally published in
 [Towards Data Science](https://towardsdatascience.com) 
 on Medium, where people are continuing the conversation by highlighting and responding to this story.



