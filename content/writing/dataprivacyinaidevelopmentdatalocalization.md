



---
date: 2024-06-18
featured_image: "https://cdn-images-1.medium.com/max/1024/0*YNnvOyfQcQIsUxRg"
tags: ["data-localization","data-governance","data-engineering","privacy","getting-started"]
title: "Data Privacy in AI Development: Data Localization"
disable_share: false
---
      
#### 
 Why should you care where your data lives?



 In the process of writing my talk for the AI Quality Conference coming up on June 25 in San Francisco (
 [tickets still available](https://www.aiqualityconference.com/) 
 !) I have come across many topics that deserve more time than the brief mentions I will be able to give in my talk. In order to give everyone more detail and explain the topics better, I’m starting a small series of columns about things related to developing machine learning and AI while still being careful about data privacy and security. Today I’m going to start with
 **data localization** 
 .




 Before I begin, we should clarify what is covered by data privacy and security regulation. In short, this is applicable to “personal data”. But what counts as
 **personal data** 
 ? This depends on the jurisdiction, but it usually includes PII (name, phone number, etc.) PLUS data that could be combined together to make someone identifiable (zip code, birthday, gender, race, political affiliation, religion, and so on). This includes photos, video or audio recordings of someone, details about their computer or browser, search history, biometrics, and much more.
 [GDPR’s rules about this are explained here](https://gdpr.eu/eu-gdpr-personal-data/) 
 .




 With that covered, let’s dig in to data localization and what it has to do with us as machine learning developers.



### 
 What’s Data Localization?



 Glad you asked! Data localization is essentially the question of what geographic place your data is stored in — if you localize your data, you are keeping it where it was created. (This is also sometimes known as “data residency”, and the opposite is “data portability”.) If your dataset is on AWS S3 in us-east-1, your data is actually living, physically (inasmuch as data lives anywhere), in the United States, somewhere in Northern Virginia. To get more precise, AWS has several specific data centers in Northern Virginia, and you can get their exact addresses online. But for most of us, knowing the general area at this grain is sufficient.



### 
 Why should I care where the datacenter is? Isn’t the cloud just ‘everywhere’?



 There are good reasons to know where your data lives. For one thing, there can be real physical speed implications for loading/writing data to the cloud depending on how far you and your computer are from the region where the datacenter is located. But this is likely not a huge deal unless you’re doing crazy high-speed computations.




 A more important reason to care (and the reason this is a part of data privacy), is that data privacy laws around the world (as well as your contracts with clients and consent forms filled out by your customers) have rules about data localization. Regulation on data localization involves requiring personal data about citizens or residents of a place to be stored on servers in that same place.




 General caveats:



* It doesn’t always apply to all kinds of data (financial data is more often covered)
* It doesn’t always apply to all kinds of businesses (tech companies are more often covered)
* It may be triggered by a government request, or it might be automatic (see Vietnam)
* Sometimes there are ways you can get consent to move the data, sometimes not
* Sometimes you just need to initially store the data in country, and then you can move it around later (see Russia)
* Sometimes you can store it outside the country of origin but there are limits on where else it can go (see EU)



 In addition, private companies sometimes impose data localization requirements in contracts, potentially to comply with these laws, or to reduce the risk of data breach or surveillance by other governments on the data.




 This means, literally, that you may be legally limited on the locations of data centers where you can store certain data, primarily based on who the data is about, or who the original owner of the data was.



### 
 Example



 It may be easier to understand this with a concrete (simplified) example.



* You run a website where people can make purchases. You collect data during these purchases, such as credit card details, address, name, IP address, and some other things. Your consent banner/fine print doesn’t say anything about data localization.
* You get customers from Russia, India, and the United Arab Emirates.
* Unless you got explicit consent, all of the personal data from these visitors are subject to different data localization rules.



 What does this mean for you? All this data needs to be processed differently.



* The data from Russian customers needs to be initially stored in a Russian-based server, and then
 [may be transferred depending on the applicable rules](https://assets.kpmg.com/content/dam/kpmg/be/pdf/2018/09/ADV-factsheet-localisation-of-russian-personnal-data-uk-LR.pdf) 
 .
* The data from EU customers can be stored in countries that have sufficient data security laws (notably, not Russia).
* The UAE customer data needs to be stored in the UAE because you didn’t get consent from these customers to store it elsewhere.



 This creates obvious problems for data engineering, since you need separate pipelines for all of the data. It’s also a challenge for modeling and training — how do you construct a dataset to actually use?



### 
 Get consent



 If you had gotten consent from the UAE customers to move data, you’d probably be ok. Data engineering would still have to pipe the data from Russian customers through a special path, but you could combine the data for training. However, because you didn’t, you’re stuck! Make sure that you know what permissions and authorizations your consent tool includes, so you don’t get in this mess.



### 
 On the fly combination



 Assuming it’s too late to do that, another solution is to have a compute platform that loads from different databases at time of training, combines the dataset in the moment, and trains the model without ever writing any of the data to disk in a single place. The general consensus (NOT LEGAL ADVICE) is that models are not themselves personal data, and thus not subject to the legal rules. But this takes work and infrastructure, so get your dev-ops hat on.




 If you have extremely large data volumes, this can become computationally expensive very fast. If you generate features based on this data but personal data about cases is still interpretable, then you can’t save everything together in one place, but will either need to save de-identified/aggregated features separately, or write them back to the original region, or just recalculate them every time on the fly. All of these are tough challenges.



### 
 De-identify and/or aggregate



 Fortunately, there’s another option. Once you have aggregated, summarized, or thoroughly (irreversibly) de-identified the data, it loses the personal data protections and you can then work with it more easily. This is a strong incentive for you not to be storing personal data that is identifiable! (Plus, this reduces your risk of data breaches and being hacked.) Once the data is no longer legally protected because it’s no longer high risk, you can do what you want and carry on with your work, saving the data where you like. Extract non-identifiable features and dispense with identifiable data if you possibly can.




 However, deciding when the data is sufficiently aggregated or de-identified so that localization laws are no longer applicable can sometimes be a tough call, because as I described above, many kinds of demographic data are personal because in combination with other datapoints they could create identifiability. We are often accustomed to thinking that when PII (full names, SSNs, etc) are removed, then the data is fine to use as we like. This is not how the law sees it in many jurisdictions! Consult your legal department and be conscientious about what constitutes risk. Ideally, the safest thing is when the data is no longer
 *personal data* 
 , e.g. not including names, demographics, addresses, phone numbers, and so on at the individual level or in unhashed, human readable plaintext. THIS IS NOT LEGAL ADVICE. TALK TO YOUR LEGAL DEPARTMENT.




 We are very used to being able to take our data wherever and manipulate it and run calculations and then store the data — on laptops, or S3 or GCS, or wherever you want, but as we collect more personal data about people, and more data privacy laws take effect all around the world, we need to be more careful what we do.



### 
 FAQ


#### 
 What if you don’t know where the data originated?



 This is a tough situation. If you have some personal data about people and no idea where it came from or where those people were located (and probably also no idea what consent forms they filled out), I think the safe solution is to treat it like this data is sensitive, de-identify the heck out of it, aggregate it if that works for your use case, and make sure it wouldn’t be considered personal or sensitive data under data privacy laws. But if that’s not an option because of how you need to use the data, then it’s time to talk to lawyers.



#### 
 What if your company can’t afford datacenters all over the world?



 More or less, this is the same answer. Ideally, you’d get your consent solution in order, but barring that, I’d recommend finding ways to de-identify data immediately upon receiving it from a customer or user. When data comes in from a user, hash that stuff so that it is not reversible, and use that. Be extra cautious about demographics or other sensitive personal data, but definitely deidentify the PII right off. If you never store data that is sensitive or potentially could be reverse engineered to identify someone, then you don’t need to worry about localization. THIS IS NOT LEGAL ADVICE. TALK TO YOUR LEGAL DEPARTMENT.



#### 
 Why do countries make these laws?



 There are a few reasons, some better than others. First, if the data is actually stored in country, then you have something of a business presence there (or your data storage provider does) so it’s a lot easier for them to have jurisdiction to penalize you if you misuse their citizens’ data. Second, this supports economic development of the tech sector in whatever country, because someone needs to provide the power, cooling, staffing, construction, and so on to the data centers. Third,
 [unfortunately some countries have surveillance regimes on their own citizens](https://www.techpolicy.press/the-human-rights-costs-of-data-localization-around-the-world/) 
 , and having data centers in country makes it easier for totalitarian governments to access this data.



#### 
 What can I do to make this hurt less as a data scientist?



 Plan ahead! Work with your company’s relevant parties to make sure the initial data processing is compliant while still getting you the data you need. And make sure you’re in the loop about the consent that customers are giving, and what permissions it enables. If you still find yourself in possession of data with localization rules, then you need to either find a way to manage this data so that it is never saved to a disk that is in the wrong location, or deidentify and/or aggregate the data in a way so that it is no longer sensitive, so the data privacy regulations no longer apply.



#### 
 What are some of the major data localization laws I need to know about?



 Here are some highlights, but this is not comprehensive because there are many such laws and new ones coming along all the time. (Again, none of this is legal advice):



* **India** 
 : DPDP (Digital Personal Data Protection) is the national data privacy regulation.
 [This law is not as restrictive as some](https://iapp.org/resources/article/operational-impacts-of-indias-dpdpa-part5/) 
 , but individual agencies within the Indian government are permitted to make more restrictive policies about specific kinds of data. The Federal Reserve Bank of India is one example, and they
 [impose data localization rules](https://m.rbi.org.in/Scripts/FAQView.aspx?Id=130) 
 more restrictive than the national law. Financial companies like American Express have been fined for storing data on Indian financial transactions on servers outside of India.
* **China** 
 : PIPL is their national data privacy regulation, and the data localization rules are a bit complex. It applies to entities that
 [“provide products or services to individuals in China” and/or “analyze and assess the conduct of natural persons in China”](https://fpf.org/wp-content/uploads/2022/02/Demystifying-Data-Localization-Report.pdf) 
 so that’s pretty broad. If the data is what the law considers “important” or “information that identifies or can identify natural persons”, then there is a good chance is subject to data localization. As always, this is not legal advice, and you should ask your legal department.
* **Russia** 
 : Russia has had data localization laws for some time, and many companies including Facebook and Twitter have been fined for violations.
 [“Article 18(5) of the Data Localization Law requires that Russian and foreign data operators that collect personal data of Russian citizens, including over the internet, initially record, store, arrange, update, and extract that data using Russian databases.”](https://www.morganlewis.com/-/media/files/publication/outside-publication/article/2021/data-localization-laws-russian-federation.pdf) 
 There are more laws that also apply (see link for details).
 [After the initial collection and storage of the data on a Russian server, then the data
 *can* 
 be transferred elsewhere.](https://assets.kpmg.com/content/dam/kpmg/be/pdf/2018/09/ADV-factsheet-localisation-of-russian-personnal-data-uk-LR.pdf)
* **Vietnam** 
 : Their
 [2018 law](https://www.tilleke.com/insights/decree-53-provides-long-awaited-guidance-on-implementation-of-vietnams-cybersecurity-law/) 
 requires that certain data be stored in country for 24 months,
 [upon request by the government](https://www.trade.gov/market-intelligence/vietnam-cybersecurity-data-localization-requirements) 
 . This applies to domestic companies and certain foreign companies in sectors around e-commerce, social networking, and other digital services. In addition, any transfer of data to a third party requires customer consent.
* **EU** 
 (GDPR): The EU sets some specific rules about certain countries where their citizens’ data cannot be stored (Russia, for example) due to concerns about state surveillance and data privacy.
* [**UAE**](https://www.pwc.com/m1/en/services/consulting/documents/uae-data-privacy-handbook.pdf)
 : For most data, you must get consent from the subject to transfer their data outside the UAE. In some select cases, this is not sufficient — for example, payment processing data must be kept inside the UAE.
* **Japan** 
 :
 [Data subjects must consent](https://withpersona.com/blog/data-residency-laws-international-guide) 
 to their data being transferred out of country, unless the other country is part of a specific data sharing agreement with Japan.



 There are other potential considerations, such as the size of your company (some places have less restrictive rules for small companies, some don’t), so none of this should be taken as the conclusive answer for your business.



### 
 Conclusion



 If you made it this far, thanks! I know this can get dry, but I’ll reward you with a story. I once worked at a company where we had data localization provisions in contracts (not the law, but another business setting these rules), so any data generated in the EU needed to be in the EU, but we had already set up data storage for North America in the US.




 For a variety of reasons, this meant that a new replica database containing just the EU stuff was created, based in the EU, and we kept these two versions of the entire Snowflake database in parallel. As you may expect, this was a nightmare, because if you created a new table, or changed fields, or basically did anything in the database, you had to remember to duplicate the work on the other. Naturally, most folks did not remember to do this, so the two databases diverged drastically, to the point where the schemas were significantly different. So we all had endless conditional code for queries and work that extracted data so we’d have the right column names, types, table names, etc depending on which database you were pulling from, so we could do “on the fly” combination without saving data to the wrong place. (Don’t even get me started on the duplicate dashboards for BI purposes.) I don’t recommend it!




 These regulations pose a real challenge for data scientists in many sectors, but it’s important to keep up on your legal obligations and protect your work and your company from liabilities. Have you encountered localization challenges? Comment on this article if you’ve found solutions that I didn’t mention.



### 
 Further Reading



<https://www.techpolicy.press/the-human-rights-costs-of-data-localization-around-the-world/>




[What is considered personal data under the EU GDPR? - GDPR.eu](https://gdpr.eu/eu-gdpr-personal-data/) 




<https://carnegieendowment.org/research/2023/10/understanding-indias-new-data-protection-law?lang=en>




<https://irglobal.com/article/all-about-data-localisation-in-india-2/#:~:text=The%20RBI%20ordered%20all%20payment,to%20abide%20by%20this%20instruction>
 .




<https://m.rbi.org.in/Scripts/FAQView.aspx?Id=130>



<https://medium.com/media/6b155f9f2cbb74afade05b0c758f1fc0/href>
<https://medium.com/media/185127450c5b8a05a96713dfaf813d45/href>
<https://medium.com/media/4dce900edb5a81e37d1325c19d673557/href>

[Decree 53 Provides Long-Awaited Guidance on Implementation of Vietnam's Cybersecurity Law](https://www.tilleke.com/insights/decree-53-provides-long-awaited-guidance-on-implementation-of-vietnams-cybersecurity-law/) 



<https://medium.com/media/ae5bc4b9f9dfb8b84423d73be5346091/href>



---



[Data Privacy in AI Development: Data Localization](https://towardsdatascience.com/data-privacy-in-ai-development-data-localization-50df725bfa1c) 
 was originally published in
 [Towards Data Science](https://towardsdatascience.com) 
 on Medium, where people are continuing the conversation by highlighting and responding to this story.



