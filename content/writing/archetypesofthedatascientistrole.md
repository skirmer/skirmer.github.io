



---
date: 2023-08-23
featured_image: "https://cdn-images-1.medium.com/max/1024/0*28sDO1eOfk3IT8nc"
tags: ["data-science","careers","career-advice","editors-pick","data-analysis"]
title: "Archetypes of the Data Scientist Role"
disable_share: false
---
      
#### 
 Data science roles can be very different, and job postings are not always clear. What hat do you want to wear?



 After the positive responses to
 [my recent post in Towards Data Science about Machine Learning Engineers](https://towardsdatascience.com/machine-learning-engineers-what-do-they-actually-do-e666081c3181) 
 , I thought I would write a bit about what I think are the real categories of roles for data science practitioners in the job market. While I was previously talking about the candidates, e.g. what their qualification expectations and realities might be, today I want to talk about what the actual job is day to day.




 That is to say, these are what I think people actually are hiring data science professionals to do, whether they admit it or not. I am going to explain what the job really does, as opposed to what the claims might be in the job description, and where in a business org chart (roughly) you might be located.



### 
 Why Does This Matter?



 Data scientists looking for jobs, no matter where we are in our careers, have to read between the lines when we review postings and job descriptions. There’s going to be a lot of fluff and euphemism in a job description, and it can be hard to tell what the role really would be like day to day, and what skills you will need to be successful.




 It’s also important to know what the tasks will look like so you can tell if this is what you want to spend your time doing! You probably have parts of the broad field of data science you like more than others, and things you want to learn more or get into more deeply. If you end up in the wrong role, you can find your career going somewhere you don’t want to be.




 I want this article to help you read between those job posting lines, and to know what the job really is going to be before you spend time applying and interviewing. It’s also important to know, as you read between the lines, whether the role being advertised is really manageable for one person to do successfully. As I describe later, sometimes companies try to hire one data scientist to do many jobs, and it’s not sustainable or pleasant for the person who gets hired for that role.




> 
>  Data scientists looking for jobs, no matter where we are in our careers, have to read between the lines when we review postings and job descriptions. … If you end up in the wrong role, you can find your career going somewhere you don’t want to be.
> 


### 
 Caveats



 Before we crack on, I have just a few warnings/notes for the reader.



* I have spent most of my career in medium-sized to very small tech companies, and don’t have personal experience in Big Tech. I consulted friends who do have such experience to get their feedback for this, so I hope my generalizations more or less apply anywhere. I’m probably wrong.
* All of these are generalizations. While I do think these ideas are true, there are
 *jokes* 
 in here. Please don’t take everything absolutely seriously, but recognize that I’m having a little laugh at the expense of our weird field.
* I’m going to mention this again later, but remember these are archetypes, not “the exact text of someone’s job description.” Archetypes are useful for us to group things, but there will be exceptions, amalgamations, and other edge cases in real life.



 Now, let’s get on with it and start talking about the archetypes of data scientists!



### 
 The Analytics Guru



 I’m starting with the most underrated and under-appreciated role- analytics. You are there to help the company figure out whether they are meeting goals, and whether stuff is working the way it should. This is incredibly important and super nebulous and hard to actually do. There are a ton of possible things you could be doing day to day, such as building dashboards, analyzing things like sales and product success, and potentially also looking at things like internal performance (think turnover and stuff). Some people will think your job is just “make me a dashboard” but even if you do dashboarding, you’ll spend a lot of time thinking about what should be measured in the dashboard, whether it should exist at all, and how you can calculate metrics that will actually align with goals.




 In a prior decade, you might have been called things like Operations Analyst or BI Specialist (or sometimes even now you might be called this). You are expected to handle a lot of weird data from weird sources, and you also use a LOT of SQL. You will not be doing much machine learning unless it is stuff like NLP on feedback responses. If you’re analyzing product effectiveness, you will do a lot of A/B testing. You might be in the marketing department or in a standalone analytics department, but everyone from all over the business is probably going to be up in your grill asking for “the numbers” for stuff a lot.



### 
 The Feature Builder



 You, on the other hand, are here to make the product better, ideally, with some sort of DS/ML wizardry. Your executives probably want to be able to say your product contains AI, even if you just have a recommendation engine surfacing suggestions in the product, or sorting your search results. If you are lucky you might get to build innovative features and add cool stuff to the product — but if you don’t do well starting from an empty page and a vague mandate, this may not be the right place for you.




 You need to learn about the customers and industry so you can build stuff that is useful, not just cool. You should listen to what customers say and talk to departments that are customer facing, but often times people in this role won’t. (This is a bad choice.) You might be doing your own A/B testing, or that might fall on The Analytics Guru. You definitely need the Analytics Guru (or overlap with them) when it comes to evaluating whether the stuff you built was any good. You work in Python. You are probably in the product department, but you talk to engineering a lot.



### 
 The Infra Builder



 Somewhat related, I think this is more appropriately called ML Engineer — you will be asked to make the pipes that take a new model and stick it into the product so that the search results are ordered by relevance or the new widget is surfaced for the appropriate people or whatever. Sometimes you’ll have your hands in the workings of a model itself, but not that often (unless it breaks and you get paged — you’re the most likely kind of data scientist to have an on-call rotation shift.) Scaling and parallelization are going to be important to you, and you need to develop a deep fascination with latency and lag, so get used to that.




 Your daily toolkit includes Docker, whatever language the product is written in, and Python, because you are taking whatever The Feature Builder makes and plugging it into the product. Some kind of observability tool is also high in your bookmarks. You probably are in an engineering department, or maybe devops.



### 
 The Internal Only



 This is not that common until you get to big companies, but you are a person who is building ML tools for other internal departments at your company to use. It isn’t that different from The Feature Builder except that the models you make are just for use inside your business, to make things work better. Your customers are the other people who work at your company, not outside people who pay your company money for goods/services. As a result, you don’t need to know that much about the external customers, but you will know the company org chart pretty well.




 To succeed, find out what annoying repetitive stuff your colleagues have to do and automate it/train a model to do it for them. If you do, you will be very popular. Sometimes stuff you create will get open sourced and eventually could turn into products, like Airflow or H3. You probably are in engineering.



### 
 The Researcher



 A rare breed, you are someone hired to do pure research. Maybe you are going to write scholarly articles and raise the profile of your company, or something like that, but they are not expecting this role to earn its own keep. This role probably falls under the CEO’s special projects or something like that. You will get tossed ideas that someone reads about online that seem cool, and get asked to figure out what it’s all about, and how your company can do something in that space. You get tagged in all the slack conversations about LLMs.
 [This is the only possible role in this entire post that
 *might* 
 justifiably look for a Ph.D.](https://medium.com/towards-data-science/your-data-scientist-does-not-need-a-stem-ph-d-7f2206f43871) 



### 
 The Solutions Engineer



 Instead of building data science features for your company, you’ll be building them for your customers. This includes data science consulting gigs, although companies that build and sell software related to data science are also where this role is commonly found. If your customers need specialized DS/ML talent to make best use of your product, then it’s likely the company will have some of these roles.




 Expect to get brought in to customer calls when they’re trying to sell somebody on the AI whiz-bang elements of your product or services, because Sales isn’t comfortable answering technical questions. You have a pretty diverse tech stack skill set because your customers can rock up with all kinds of weird stuff for you to help with/build, which can actually be really fun. You need to understand the industry, like The Feature Builder, and you have to be able to be polished and patient with customers. Because you spend time interacting with customers, you may be in the customer success or sales departments.




 And finally we come to..



### 
 The Everything to Everyone



 This is the role that seems to combine assorted pieces of all these jobs, often in haphazard ways, and either the hiring manager doesn’t realize this is three or four jobs or they are hoping they can convince someone to do all that for just one salary. The salary is probably too low for what you’ll be asked to do. This is common in organizations without an existing data science function, who are hiring their first DS person. It can be an opportunity to learn a ton by doing, but there’s likely not going to be anyone more technically skilled around to teach you, so your Google/StackOverflow/other searching skills need to be top notch. If you don’t love teaching yourself new stuff, this role can be difficult and isolating. As a friend of mine said, “You’ll be the best at the company at what you do, but that doesn’t mean you’re good at those things.” Because of the lack of mentorship/people to help you out, burnout is a real risk.



### 
 But really…



 To be clear, most DS/ML jobs will contain parts of maybe two of these roles, or more. Remember that I told you above that these are archetypes, not “my job description”. (Literally, my own job doesn’t fit into just one of these categories.)




> 
>  To be clear, most DS/ML jobs will contain parts of maybe two of these roles, or more.
> 



 Examples of two-way splits:



* Product analytics data scientist: The Analytics Guru crossed with The Feature Builder. Build features, do all your own analysis, and also do analysis of other features/stuff people are building.
* Full stack machine learning data scientist: The Feature Builder and The Infra Builder. You’re building the model as well as the pipes that serve that model to the world.



 If you are getting up into a whole lot of three or more different archetypes in one single role, then I’d argue it’s too spread out. One person can’t successfully be The Analytics Guru, The Feature Builder, and The Infra Builder, for example- that’s just too many plates to keep spinning. The smaller the company, the more likely you will end up having to wear extra hats, but recognize that these are different functions and you can get spread too thin.



### 
 A Few More Notes Before We Go



 I think as you rise in seniority in your DS/ML career you end up taking on more roles and the boundaries of “what’s my job” get fuzzier and grayer. You develop expertise and experience that can be useful in lots of different parts of the business, and people will call to get your thoughts about stuff.




 In addition, I didn’t really talk about strategy or planning anywhere in here, but as your seniority increases you’ll be more involved in all of that sort of thing too. Even as an individual contributor, your experience has value — you probably have seen something like whatever idea or problem is currently on the table before. You should give your opinions about how to tackle it, even if people in charge go a different way. This is just part of the job at more senior levels.




> 
>  I didn’t really talk about strategy or planning anywhere in here, but as your seniority increases you’ll be more involved in all of that sort of thing too.
> 



 I hope this helps folks who are on the market or students who are breaking in to the field have a clearer sense of what you’re getting into. If you find a really egregious example of The Everything to Everyone in the wild, on a job board, send it to me or post a link in a comment here. Maybe I can make a post in the future about the worst examples and dissect them for all of our amusement!




*You can find more of my work at* 
[*www.stephaniekirmer.com*](https://www.stephaniekirmer.com/)
*.* 






---



[Archetypes of the Data Scientist Role](https://towardsdatascience.com/archetypes-of-the-data-scientist-role-1b078966fb2) 
 was originally published in
 [Towards Data Science](https://towardsdatascience.com) 
 on Medium, where people are continuing the conversation by highlighting and responding to this story.



