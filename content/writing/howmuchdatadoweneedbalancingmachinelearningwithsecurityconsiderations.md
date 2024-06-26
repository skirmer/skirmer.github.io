



---
date: 2023-12-15
featured_image: "https://cdn-images-1.medium.com/max/1024/0*8z5DtqlKGJzY1tTM"
tags: ["data-engineering","data-science","notes-from-industry","machine-learning","data-security"]
title: "How Much Data Do We Need? Balancing Machine Learning with Security Considerations"
disable_share: false
---
      

 For a data scientist, there’s no such thing as too much data. But when we take a broader look at the organizational context, we have to balance our goals with other considerations.



### 
 Data Science vs Security/IT: A Battle for the Ages



 Acquiring and keeping data is the focus of a huge amount of our mental energy as data scientists. If you ask a data scientist “Can we solve this problem?” the first question most of us will ask is “Do you have data?” followed by “How much data do you have?” We want to collect data because it is the prerequisite for most of the kinds of work we want to do, in order to produce valuable models and beneficial results. We love to dig around in that data, learn what is really in there and what it means, find out how it was generated or collected, and learn generalizable conclusions from it.




 Taking a hard look at data privacy puts our habits and choices in a different context, however. Data scientists’ instincts and desires often work in tension with the needs of data privacy and security. Anyone who’s fought to get access to a database or data warehouse in order to build a model can relate. It can feel like there are wildly over-cautious barriers being thrown up in the way of us doing our jobs. After all, isn’t the reason we have the data to learn from it and model it? Even the best of us sometimes demonize the parts of our organization whose primary goals are in the privacy and security area and conflict with our wishes to splash around in the data lake.




 In reality, data scientists are not always the heroes and IT and security teams are not the villains. We are both working on important goals and can both get a little bit of tunnel vision in that pursuit. It helps to look at the perspectives of both roles to understand the tension in place and the competing interests.




**The Data Science Perspective** 




 From the data science angle, having large volumes of data is frequently necessary to meet the goals of our work. To build a generalizable model, you need to have many, many examples of the kinds of data that your model will need to respond to in production. Hundreds of thousands or millions of cases is not an outrageous amount to look for, by any means. However, to really make this work, data scientists must spend a lot of time and energy interrogating that data. Having a whole lot of data is great, but if you don’t know what it really represents and its provenance, the battle to do effective data science will be very uphill.




**The Security Angle** 




 If we take the security-forward perspective, on the other hand, we have to admit that the larger the quantities of data we have — particularly if there are multiple systems of storage or processes influencing the data — the larger the risk of data breach. Essentially, the more data we have, the more the chance that some of it goes missing or gets accessed by someone inappropriately. In addition, more people having access to data means more opportunities for breach or data loss, because human beings are the biggest risk vector in the technology space. We’re the weak link in the chain.




 What does all this mean? I would argue that it leads us to need a middle ground. For one thing, the more data we have lying around, the lower the likelihood that we have actually done the work to understand it deeply, or that we even could with the time and tools at our disposal. If we just hoard everything indiscriminately, we actually put ourselves in a position where we can’t even understand all the data and we are simultaneously at peak risk of breach. If we store nothing, or not enough, we make it impossible to access the incredible value data science has to offer.




 So, we need to figure out where this middle ground lives. Best practices in data engineering and data retention do exist, but we have to make a lot of spur of the moment decisions too. Having principles around how we think about data retention and usage are important to help guide us in these situations.



### 
 Institutional Considerations



 While I am on this topic of data management, I should mention—I recently started a new role! I am the first senior machine learning engineer at DataGrail, a company that provides a suite of B2B services helping companies secure and manage their customer data. This has naturally put the questions of data storage and privacy to the front of my mind, and made me think about the experiences I’ve had across my own career in companies of varying maturity levels and how they handled data.




 It’s so easy for a company to become a data hoarder. You begin with a shortage of data, and you’re flying blind, collecting data about transactions, business activities, etc. as you go to help inform decisions and strategy. You may not be doing machine learning yet, but you can see the future potential, and you want to prepare the scene. It seems not only reasonable but vital to collect your data and store it! So, you set up data systems and start filling up those tables or topics.




 This isn’t sustainable, though — not forever anyway. After a few years go by you can end up with huge volumes of data. Maybe you need to scale up to a cloud storage provider like Snowflake or AWS to keep up and make all this data accessible at the pace you need. You’re using the data, of course! Maybe you have begun a machine learning program, or even just advanced analytics and BI, but this is making a huge difference to your business’s effectiveness if done well. But even so, you’re going to start having to think about the cost of the infrastructure, not to mention probably hiring data engineering staff to help manage the beast.




 Unfortunately, you have also started to acquire data that you don’t have a good handle on anymore. Documentation may be falling out of date, if it ever existed at all, and the staff who helped build out the original systems years ago could be turning over. What does this table mean? What is the provenance of that column? Data that isn’t interpretable generates little value if any, because you can’t effectively learn from data you don’t understand.




 At this point you have decisions to make. How are you going to strategically plan for the future of your data systems? You probably need to attend to data architecture to try and keep costs from skyrocketing, but what about data retention? Do you keep all data forever? If not, what do you cut and when? Remember, however, that retaining a pretty large volume of data is a non-negotiable requirement if your business will have effective machine learning and/or analytics functions supporting your decisionmaking and products. “Throw it all out and avoid any of this nonsense” is not an option.




 At the same time, you need to be thinking about the regulatory and legal frameworks that apply to having all this data. What are you going to do if a customer asks you to delete all the data you have about them, as some jurisdictions allow? Many organizations don’t take this seriously until they’re already late to the party. If you’re going to be on top of it, and you didn’t start from day 1, you have the tough task ahead of retrofitting your data architecture to handle the regulatory requirements this data is subject to.



### 
 An aside about regulation



 The growth in data security regulations in recent years has increased the challenges of the scenario I describe for businesses. In some ways, it was our own doing — numerous data breaches, lax security, and opaque consent policies by assorted companies over recent years have led to public demand for better, and government filled the gap. It appears that brand trust and safety weren’t enough motivation on their own to get many businesses to tighten up the ship where data protection was concerned. If laws were necessary to ensure that our personal data and sensitive records are protected conscientiously, then I for one am all for it.




 However, in my data scientist hat, I have to acknowledge the tension that I started with in this column. I want all the data, and I want to be able to dig around in it unrestrained, because that’s how I do my job effectively. But, I also am a customer and a citizen and I want MY data to be carefully protected. I know that the promise and power of machine learning depends on data being available to use, but it naturally feels a little less clear when you consider that it’s data about you and your habits that is feeding the progress. I find this role a bit easier to embody than “security” per se, because I’m not a trained data security professional, but I don’t need to be to have a strong sense of what my preferences as a consumer would be.




 My advice is that we keep our consumer/security hats and our data scientist hats both close at hand. We have to maintain a balance between accumulating data for machine learning and limiting our data retention for customer privacy and data security. There’s no silver bullet answer to “how much should we keep?”, so the only choice is to juggle both interests in every decision we make about data storage.




 I will be taking a brief break from my column for the holidays and will return in mid January with my next piece.




 See more of my work at
 [www.stephaniekirmer.com](http://www.stephaniekirmer.com/) 
 .






---



[How Much Data Do We Need? Balancing Machine Learning with Security Considerations](https://towardsdatascience.com/how-much-data-do-we-need-balancing-machine-learning-with-security-considerations-a26911f211f6) 
 was originally published in
 [Towards Data Science](https://towardsdatascience.com) 
 on Medium, where people are continuing the conversation by highlighting and responding to this story.



