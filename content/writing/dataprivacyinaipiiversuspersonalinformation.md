



---
date: 2024-07-04
featured_image: "https://cdn-images-1.medium.com/max/1024/0*quXbUvKCJL8DIBXQ"
tags: ["machine-learning","data-privacy","ai"]
title: "Data Privacy in AI: PII versus Personal Information"
disable_share: false
---
      
#### 
 What kind of information does data privacy law actually cover?



 In my continuing series of columns digging deeper into the
 [content of my recent talk at the AI Quality Conference](https://www.stephaniekirmer.com/speaking/aqi_2024/) 
 , today I’m going to talk about how we distinguish the kinds of data that are and are not covered by the data privacy laws that are springing up around the US and globally. Different kinds of data are protected more restrictively, depending on the jurisdictions, so this is important to know if you are using data about individuals for analysis or machine learning. I’ll also talk a bit about how you can turn your protected data into data that is free to be used for more expansive purposes.




> 
> *As always,* 
> ***none***
> *of what I say here is legal advice.* 
> 


### 
 Data Categories


#### 
 PII — Personally Identifiable Information



[This generally refers to one piece of data that, in isolation, can likely be used to identify a specific person](https://nvlpubs.nist.gov/nistpubs/legacy/sp/nistspecialpublication800-122.pdf?__hstc=40977085.07430159d50a3c91e72c280a7921bf0d.1530662400146.1530662400147.1530662400148.1&__hssc=40977085.1.1530662400149&__hsfp=1773666937) 
 . Examples might include an ID number such as that used for social security, driver’s license, or other government ID. Your whole name might also qualify, as might your full street address, a photograph of you, or your telephone number.




 If you’ve ever been involved in human subjects research or worked in industries like healthcare where data security training is required, you may be familiar with the idea of PII because you’ll have lots of contact with this kind of information. However, this is not the full scope of what kind of data is regulated under comprehensive data privacy laws.



#### 
 Personal Data or Personal Information



 The broader scope that you need to be attentive to under modern data privacy regulation is often just called “Personal Information” and includes:



* datapoints that can be combined together to identify a specific person, such as birthdate and surname, or birthdate and zip code.
* datapoints that the individual might feel are sensitive and need to be kept private, which can be combined with other data to be linked to a specific person
* datapoints which could be the basis for illegal treatment such as discrimination, which can be combined with other data to be linked to a specific person



 One key thing to note is that the data must be at the individual level, and
 [there must be some way to connect it back to the single individual for this to be considered legally protected](https://gdpr.eu/article-4-definitions/) 
 . If, for example, you have a dataset and it contains data on 1000 individuals including gender and zip code, that’s not personal data unless there is more data also included that could together be narrowed down to specific individuals. There are likely enough people in any given zip code of a particular gender that you can’t tell exactly which female-identifying person in 60601 you’re talking about.




 However, once you start to have additional data like age/birthdate, profession, race/ethnicity, or more, then you increase the plausibility of pinning down one particular person, and thus your data becomes more dangerous and more likely to be protected under data privacy law.






 Source: Garfinkel, 2015
 <https://nvlpubs.nist.gov/nistpubs/ir/2015/NIST.IR.8053.pdf?uuid=n2tDjSm0DpcTq02f5027>



*As this diagram shows, the risk is higher the easier it is to link the data to an individual.* 




 Also, in most jurisdictions
 [if the data is already public (such as public records of government), that is not protected and can be used without worry about privacy laws.](https://arc.net/l/quote/ynibyhgz) 




 Assorted other categories of data that fall under data privacy rules in this way include:



* Identifiers such as a real name, alias, postal address, unique personal identifier, online identifier, IP address, email address, account name, social security number, driver’s license number, passport number, or other similar identifiers.
* Characteristics of protected classifications under local/federal law such as race, gender, sexual orientation, religion, etc.
* Commercial information, including records of personal property, products or services purchased, obtained, or considered, or other purchasing or consuming histories or tendencies.
* Biometric information.
* Internet or other electronic network activity information, including, but not limited to, browsing history, search history, and information regarding a consumer’s interaction with an Internet Web site, application, or advertisement.
* Geolocation data, meaning latitude and longitude coordinates of where a person has been at any time or is currently.
* Audio, electronic, visual, thermal, olfactory, or similar information.
* Professional or employment-related information, such as title, employment status, years of service, seniority, past employers, or salary/wage.
* Education information, provided that is not publicly available personally identifiable information as defined in FERPA.
* Inferences drawn from any of the information identified in this subdivision to create a profile about a consumer reflecting the consumer’s preferences, characteristics, psychological trends, predispositions, behavior, attitudes, intelligence, abilities, and aptitudes.


### 
 Actions to take



 Based on this, you can see that there’s not always a simple answer to “is datapoint X protected?” — the context matters. Is gender protected data? The smart answer is yes, probably, if it’s contained in a dataset that includes other information as well. If you have rows of data about individuals that contain ONLY gender and nothing else, that’s probably not a risk, but most of the time when we’re doing data work we’re looking at multiple features and if they add up to one distinct individual being identifiable, then you have personal information on your hands.




 So, what to do? There are several good strategies for minimizing your risk when dealing with data about individuals.



#### 
 Minimization



 One sensible tip is to reduce the amount of personal data you’re storing. Every additional characteristic or datapoint you keep about an individual person adds to the chance that the data could be pulled together to identify someone, and thus increases the risk that a data breach could cause your business and your customer serious harm. Only store data you need to use to achieve your objective, not more.



#### 
 Aggregation



 An additional consideration is whether you really need to look at the data at the individual level, or whether you could group the datapoints to a larger grain. Consider the problem or question you are working on, and decide whether individuals are necessarily the unit that interests you. If it might be equally possible to analyze people in groups, this will significantly reduce your risk (assuming you delete any individual data after aggregation is done).



#### 
 Deidentification



 If you know you need to work with the data at the individual level, you can obfuscate as much of your data as possible so that it is impossible to reverse engineer which individual person is represented. Often in my experience this involves using hashing that is irreversible, because this can allow you to retain the relationships between datapoints without those datapoints being human interpretable, so modeling will still work but the data can’t be tracked back to distinct people. There are many other techniques you might use, however, and there are some great resources out there for how you can approach the process of deidentification, including
 [this report from NIST](https://nvlpubs.nist.gov/nistpubs/ir/2015/NIST.IR.8053.pdf?uuid=n2tDjSm0DpcTq02f5027) 
 . I especially recommend developers investigate the techniques available if using multimedia (audio/video/image) data because the deidentification process can be much more complex for those.



#### 
 Risk Assessment



 When you decide that PI or PII is necessary for your project, this constitutes a higher level of risk than the alternatives. Sit down and think about what that risk is from using this data, how you can minimize it through best practices, and what you expect the reward from your project will be. There are some
 [good resources out there to do general risk assessments](https://www.datagrail.io/ai-and-data-privacy/) 
 for AI/ML projects and these can give you guidance. If you can’t convince yourself/your peers that the risk is outweighed by the benefit your model is going to achieve, then this project may not be worth doing.



#### 
 Consent



 If you need to use PI or PII in modeling or analysis, this is not impossible — but you’ll need to make sure you have appropriate consent from the individuals represented in the data to use their information for your purposes. I strongly recommend that ML practitioners get involved with writing the language of consent forms that are provided to customers/users, so that you know exactly what you have authorization to do. Otherwise, you may find yourself with data but without the rights to use it for your project — the worst possible option, as the data being in your possession creates risk without reward!



#### 
 Data Security



 Again, if you decide you need to use PI or PII, you have data security implications to consider — meaning, you should have infrastructure in place to protect this data from breach, hacking, or unauthorized access. Nobody in your organization should have more than necessary access to do their job, so that the number of people who can see the personal data is minimized, reducing risk. Consult with your IT and security teams to get their advice on best practices you can implement, and have a plan if anything should go wrong.



### 
 Conclusion



 Some of what I’ve shared here might be obvious, but I think it’s still valuable to revisit the whole framework of what personal information means as we proceed with machine learning and data science work. I know I sometimes start to see the data as just a resource and lose track of how it really represents individual people, and that’s a dangerous situation because you can forget that risk attaches to personal data.




 The risk is not just to the person whose data is being used, however — there is significant risk to businesses who misuse or sloppily use customer data because of legal frameworks. GDPR and CCPA both contain penalties in the form of substantial fines if businesses carelessly handle personal data. It’s perhaps equally important to consider this an ethical issue. People trust you and your organization with their data, and violating that trust should be avoided at all costs.




 It’s not that you can’t do ML with personal data — you can! You just need to be cautious and take the steps required to minimize risk when you do.



#### 
 Take home points


* Ask yourself is whether this data could be linked to a specific individual, because that will mean it falls under the law’s protections.
* Storing and using personal data incurs risk to you and your organization, so balance that with the benefit you expect from your project.
* Regulations govern how you work with this data, so be careful and talk to your legal team so you’re compliant.



 Good luck out there!




 You can find more of my content at
 [www.stephaniekirmer.com.](http://www.stephaniekirmer.com.) 



### 
 Further Reading



[NIST: Deidentification and Anonymization](https://nvlpubs.nist.gov/nistpubs/ir/2015/NIST.IR.8053.pdf?uuid=n2tDjSm0DpcTq02f5027) 
 , Garfinkel 2015




[NIST: Guide to PII](https://nvlpubs.nist.gov/nistpubs/legacy/sp/nistspecialpublication800-122.pdf?__hstc=40977085.07430159d50a3c91e72c280a7921bf0d.1530662400146.1530662400147.1530662400148.1&__hssc=40977085.1.1530662400149&__hsfp=1773666937) 
 , McCallister et al 2010




 Relevant portion of GDPR:
 <https://gdpr.eu/article-4-definitions/>




 Relevant portion of CCPA:
 <https://oag.ca.gov/privacy/ccpa#sectiona>






---



[Data Privacy in AI: PII versus Personal Information](https://ai.gopubby.com/data-privacy-in-ai-pii-versus-personal-information-80ac237ba7ea) 
 was originally published in
 [AI Advances](https://ai.gopubby.com) 
 on Medium, where people are continuing the conversation by highlighting and responding to this story.



