



---
date: 2023-11-30
featured_image: "https://cdn-images-1.medium.com/max/1024/1*uPvCrTxCb-lDb48-sxlSmA@2x.jpeg"
tags: ["machine-learning","artificial-intelligence","healthcare","editors-pick","medicine"]
title: "What Role Should AI Play in Healthcare?"
disable_share: false
---
      
#### 
**On the use of machine learning in healthcare and the United Healthcare AI scandal**



 Some of you may know that I am a sociologist by training — to be exact, I studied medical sociology in graduate school. This means I focused on how people and groups interact with illness, medicine, healthcare institutions, and concepts and ideas around health.\*




 I taught undergraduates going into healthcare fields about these issues while I was an adjunct professor, and I think it’s really important for people who become our healthcare providers to have insight into the ways our social, economic, and racial statuses interact with our health. Every sick person is not the same, and appreciating that is necessary before you can provide people high quality care.




 I explain all this just to give some context to my angle on today’s topic — the applications of machine learning in healthcare. I’ve kind of waited to talk about this because it’s such a big topic, but a few recent news reports inspired me to get started. Odds are, I’ll talk about this more down the line.



### 
 On Life and Death



 One of the reasons I find it so hard to talk about using ML in the medical space is because the risks of failure are so catastrophic. If I predict the wrong arrival date for the package of socks you ordered online, the worst case scenario is that you have cold feet for a day or two. If a machine learning model makes a mistake in a healthcare setting, the risks go right up to loss of life or loss of quality of life in a very real way.




> 
>  If a machine learning model makes a mistake in a healthcare setting, the risks go right up to loss of life or loss of quality of life in a very real way.
> 



 Of course, our healthcare providers are already aware of this risk in their day to day work, and learn to cope with it. But by and large, data scientists and machine learning model developers are unfamiliar with thinking about the outcomes of models with these kinds of stakes. When modeling, in the example of a classification model, a substantial part of the task is to estimate the cost of what we call False Positives and False Negatives — essentially, what bad thing will happen when we predict an event that does not actually occur (FP) or we predict that no event will occur but it actually does (FN). In other kinds of models, we also spend time considering the cost of a model making a prediction that is wildly different from the desired value or what really occurs. The common thread is that models ALWAYS have some amount of unavoidable error, even generative AI. As I’ve talked about many times in the past, model outputs are based in some way or another on probabilities, and these leave open some room for error (undesirable behavior) to result.




 But what do the costs of a False Positive or False Negative, or some other kind of error, mean in a healthcare setting? If it wasn’t already obvious, money is only a small part of the potential error from models, in healthcare or even in other industries. Money loss should be a low priority when compared with “loss of life” or “loss of ability to live independently”. While our legal system attempts to assign monetary values to these things, for court cases where damages are allotted, it’s really not the same thing, especially when it’s YOUR life or quality of life in question.



### 
 United Healthcare



[The recent reported example of how United Healthcare](https://www.cbsnews.com/news/unitedhealth-lawsuit-ai-deny-claims-medicare-advantage-health-insurance-denials/) 
 has been using machine learning in their practice brings to the fore how bad things get when “money” is given a higher priority than “life” in healthcare decisionmaking. It doesn’t really have anything much to do with the model, because you can teach a model to prioritize better healthcare outcomes
 *if you want to* 
 .




 Unfortunately, our healthcare system juggles two competing priorities: care quality and profit. I firmly reject the idea that these can coexist peacefully, as they are always in tension, but the American system is based on this sketchy foundation nonetheless. That’s the thing that’s important to keep in mind as we talk about what UHC was (is?) doing and why.




 What UHC (almost universally regarded to be the worst major health insurer in the United States in terms of actually paying for care) was doing is this:



* Person has paid their premiums and done everything they should for coverage to be provided;
* Person becomes elderly and/or ill and needs inpatient care to recover from an illness or injury;
* UHC’s model is provided with general characteristics of the case and the patient, and predicts how long the recovery care might take. This prediction is a substantially shorter period of care for this recovery than the doctor advises;
* UHC trusts the model instead of the doctor and refuses to pay for the longer care period, kicking the patient out of the care facility before they are recovered.



 Many doctors and scholars of the healthcare system talk about
 [how health insurance companies engage in “practicing medicine without a license”](https://www.propublica.org/article/cigna-health-insurance-denials-pxdx-congress-investigation#:~:text=The%20letter%20follows%20an%20investigation,PXDX%20system%2C%20spending%20an%20average) 
 when they second guess doctors’ educated medical opinions about the care patients require, and this falls right in to that kind of behavior. What else should we call it when the UHC staff (with the backing of a model) is changing the course of care for a patient?




 But this is not new, and really, insurers have no need to have a model backing up their choices to second guess doctors. This is commonplace and happens every day in our health insurance system, in the form of things like prior authorizations. Insurers will argue that they have other doctors on staff that are the ones making the final choice, so the “practicing medicine without a license” doesn’t apply, but the obvious incentives for these doctors are on the side of the insurer, not the patient. You can be sure that those doctors never recommend MORE expensive care for patients than their primary doctors do.



### 
 Applying Machine Learning



 So, why is UHC’s behavior news now? And what does it really have to do with machine learning? UHC’s model that determines how long the post-acute care for these elderly patients should be came from a company called naviHealth, which specializes in exactly these cases.
 [From reading their website](https://navihealth.com/) 
 , the best I can tell is that naviHealth finds ways to reduce the time that elderly patients spend in care facilities. There are also some elements around case management they may offer, consulting with patients before they are sent home. One thing they definitely claim on their website is that they can deliver “significant cost savings” for insurers.




 But the point is that this model, “nH Predict”, claimed to be able to tell the optimal length of time for the patient to be allowed to stay in a care setting outside their home, ostensibly for the best care outcomes, while in reality the thresholds of the model were set such that these predictions were NOT aligned with care outcomes, but instead with cost savings alone.




 To put it another way: If you allow a patient to stay in the hospital or rehab facility, but they are ready to come home early and do so, then that’s great. Nobody wants to be in a hospital longer than necessary (have you tried the food?). That’s a cost savings that you may be able to achieve by having high quality care, the case management they describe, and other helpful services, all while the patient gets the care they need. But what UHC did instead was to get the cost savings not by providing these services and getting patients ready to leave the hospital early, but by refusing to pay for patients to be in the hospital, so they were kicked out and sent home whether they were ready or not.




> 
>  What UHC did instead was to get the cost savings not by providing these services and getting patients ready to leave the hospital early, but by refusing to pay for patients to be in the hospital, so they were kicked out and sent home whether they were ready or not.
> 


### 
 How Models Learn About Health



 What I want to make clear is that this wasn’t “AI run amok” — this was human beings making unethical decisions, and using machine learning to hand-wave away responsibility. If you want to kick seniors out of the hospital, with no regard for the consequences to their lives or health, then you can do that if you’re an insurer in the United States today. You don’t need a model to give you permission. But UHC realized, I think, that if they had a model giving these recommendations that the human reviewers could just rubber-stamp, then they had cover, because people assume some amount of independent accuracy from models. After all, surely the model isn’t looking at the price tag for this care!




 But remember that the model is just an attempt to coalesce patterns into mathematical language that can be reproduced, and it doesn’t control what information you give it, or what question you teach it to answer. In the case of creating a model to predict a number of days of inpatient care, here’s how you’d go about it.



* Collect a large dataset of past patient files where someone was injured or sick, went into the hospital, had rehabilitative inpatient care, and had an outcome (either got better, had to go back to hospital, or passed away are what come to mind)
* Turn these files into numerical data. Think of each patient as a row in a spreadsheet, and you start collecting things like the patient’s age, the severity of the initial injury, data about the patient’s past medical history, whether they have any number of other illnesses (diabetes, heart disease, dementia, and so forth). This becomes the training data. Most importantly, you need to include A. how many days of rehab inpatient care they got and B. what the outcome was.
* Now you need to frame the question. One way to shape model training in this case might be: “Among patients with good outcomes, with accounting for all the characteristics of their cases, how many days of rehab did they have?” And then you might compare this with “Among patients with bad outcomes, with accounting for all the characteristics of their cases, how many days of rehab did they have?” This is just one hypothetical way of framing, there could be many other ways to put the question and therefore the training data together.



 What you’ll get for each patient in the end is an estimate of how many days of rehab would be appropriate for a good outcome. It might be that you get a range, or you might get a probability of a good outcome based on a number of days, and if you increase the days to a certain point, then you increase the probability, and if you go past a certain point, then it starts to get risky again.




 Keep in mind that the days of rehab is not independent from everything else going on — you might have infection, or complications, or other illnesses in play that mean a long hospital stay is necessary, not for happy reasons (recovery) but for unfortunate reasons (additional illnesses). So staying in the hospital TOO long is also potentially a bad thing, but because of a reason unrelated to the days of stay. Think of the temporal order to help understand where causation is possibly in play.



### 
 Using the Model’s Results



 So we have a model, and if we tell it the information we have about a patient, then it will give us an estimate of how long the rehab inpatient period might need to be if this person is going to have a good outcome. The really pertinent question here is what we do with that information!




 If we’re UHC, our goal is to save ourselves money. We take a very very low end of that estimate, perhaps even lower than the model’s range of recommendation for a good outcome, and we cut off our willingness to pay for care at that point. That’s how this story appears to have gone, based on reporting.




 If our goals are patient outcomes, however, let’s take a step back and think for a moment. Do we think that patients are staying in the hospital or inpatient rehab for a long time for non-medical reasons? Do we think that doctors are sending their patients to rehab for inappropriate reasons? What might those be? I honestly struggle hard to think of many cases where this would make much sense on the part of a doctor. As I mentioned, who wants to stay in the hospital after their condition is improved? If it does happen, then we should look into ways to change doctor behavior, but not at the expense of people’s quality of care. Perhaps the hospital executives, who are charging the high fees for the inpatient care want the patients to stay longer, but doctors don’t have their salaries tied to the patient’s duration of stay. Doctors’ incentives are for patients to get better.




 What I’m getting at here is that if our goals are strictly for patients to get better, I’m not sure it makes sense at all to have this model involved. Certainly, over-long stays at rehab are not the biggest danger to our patients’ health right now.




 This article is about machine learning, which is what most of my readers come here for, but it’s also about the issues around the economics of healthcare. These issues are important for all Americans to be aware of, because healthcare systems affect us all sooner or later. I also think it is a good exercise for data scientists to think about what it really means to put a model in a production setting, not from the perspective of recall and precision, but from the perspective of how real human lives are affected. You are responsible for what your model is optimized for. You make decisions when building the model that will make the effect of that model on people and society positive or negative, and you can’t just throw up your hands and say “the model did it”.




 Even when your model isn’t going to be making choices about people’s healthcare, it still has some impact on people. (If it doesn’t, why are you building it?) I encourage all practitioners in the field to keep all this in mind as we go about our work.




 \*Examples of the kinds of questions medical sociology cares about might be:



* How do people with chronic illnesses perceive themselves and their place in society?
* How are people’s lives and identities different when they are healthcare providers?
* What are the long term health outcomes for minority or disadvantaged groups, and how and why are they different from majority groups?
* How do environmental issues affect people’s health, and how do these interact with social structures/privilege?



 That’s just to name a few — this area of sociology covers a ton of ground that is very important to people’s lives and well-being.




 See more of my work at
 [www.stephaniekirmer.com](http://www.stephaniekirmer.com) 
 .



### 
 References


* [Congressional Committee, Regulators Question Cigna System That Lets Its Doctors Deny Claims Without Reading Patient Files](https://www.propublica.org/article/cigna-health-insurance-denials-pxdx-congress-investigation#:~:text=The%20letter%20follows%20an%20investigation,PXDX%20system%2C%20spending%20an%20average)
* [UnitedHealth uses faulty AI to deny elderly patients medically necessary coverage, lawsuit claims](https://www.cbsnews.com/news/unitedhealth-lawsuit-ai-deny-claims-medicare-advantage-health-insurance-denials/)
* [Home - naviHealth](https://navihealth.com/)





---



[What Role Should AI Play in Healthcare?](https://towardsdatascience.com/what-role-should-ai-play-in-healthcare-7acaf9131278) 
 was originally published in
 [Towards Data Science](https://towardsdatascience.com) 
 on Medium, where people are continuing the conversation by highlighting and responding to this story.



