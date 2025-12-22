



---
date: 2025-12-15
featured_image: "https://cdn-images-1.medium.com/max/1024/0*6f4Yz6FMmrHnFgTe"
tags: ["user-experience","ai","llm"]
title: "Understanding the Generative AI User"
disable_share: false
---
      

#### What do regular technology users think (and know) about AI?

I’ve been involved in some interesting conversations recently about designing LLM based tools for end users, and one of the important product design questions that this brings up is “what do people know about AI?” This matters because, as any product designer will tell you, you need to understand the user in order to successfully build something for them to use. Imagine if you were building a website and you assumed all the visitors would be fluent in Mandarin, so you wrote the site in that language, but then it turned out your users all spoke Spanish. It’s like that, because while your site might be amazing, you have constructed it with a fatally flawed assumption and made it significantly less likely to succeed as a result.

So, when we build LLM based tools for users, we have to step back and look at how those users conceive of LLMs. For example:

* They may not really know anything about how LLMs work
* They may not realize that there are LLMs underpinning tools they already use
* They may have unrealistic expectations for the capabilities of an LLM, because of their experiences with very robustly featured agents
* They may have a sense of mistrust or hostility to the LLM technology
* They may have varying levels of trust or confidence in what an LLM says based on particular past experiences
* They may expect deterministic results even though LLMs don’t provide that

User research is a spectacularly important part of product design, and I think it’s a real mistake to skip that step when we are building LLM based tools. We can’t assume we know how our particular audience has experienced LLMs in the past, and we particularly can’t assume that our own experiences are representative of theirs.

### User Profiles

There happens to be some good research on this topic to help guide us, fortunately. Some archetypes of user perspectives can be found in the Four-Persona Framework developed by
[Cassandra Jones-VanMieghem, Amanda Papandreou, and Levi Dolan at Indiana University School of Medicine](https://scholarworks.indianapolis.iu.edu/items/4a9b51db-c34f-49e1-901e-76be1ca5eb2d)
.

They propose (in the context of medicine, but I think it has generalizability) these four categories:

#### Unconscious User (Don’t know/Don’t care)

* A user who doesn’t really think about AI and doesn’t see it as relevant to their life would fall in this category. They would naturally have limited understanding of the underlying technology and would not have much curiosity to find out more.

#### Avoidant User (AI is Dangerous)

* This user has an overall negative perspective about AI and would come to the solution with high skepticism and mistrust. For this user, any AI product offering could have a very detrimental effect on the brand relationship.

#### AI Enthusiast (AI is Always Beneficial)

* This user has high expectations for AI — they are enthusiastic about AI but their expectations may be unrealistic. Users who expect AI to take over all drudgery or to be able to answer any question with perfect accuracy might fit here.

#### Informed AI User (Empowered)

* This user has a realistic perspective, and likely has a generally high level of information literacy. They may use a “trust but verify” strategy where citations and evidence for assertions from an LLM are important to them. As the authors indicate, this user only calls on AI when it’s useful for a particular task.

Building on this framework, I’d argue that excessively optimistic and excessively pessimistic viewpoints are both often based in some deficiency of knowledge about the technology, but they don’t represent the same kind of user at all. The combination of information level and sentiment (both the strength and the qualitative nature) together creates the user profile. My interpretation is a bit different from what the authors suggest, which is that the Enthusiasts are well informed, because I’d actually argue that unrealistic expectation of the capabilities of AI is often grounded in a lack of knowledge or unbalanced information consumption.

This gives us a lot to think about when it comes to designing new LLM solutions. At times, product developers can fall into the trap of assuming the information level is the only axis, and forgetting that sentiment socially about this technology varies widely and can have just as much influence on how a user receives and experiences these products.

### Why This Happens

It’s worth thinking a bit about the reasons for this broad spectrum of user profiles, and of sentiment in particular. Many other technologies we use regularly don’t inspire as much polarization. LLMs and other generative AI are relatively new to us, so that is certainly part of the issue, but there are qualitative aspects of generative AI that are particularly distinctive and may have an impact on how people respond.

[Pinski and Benlian](https://www.sciencedirect.com/science/article/pii/S2949882124000227)
have some interesting work on this subject, noting that key characteristics of generative AI can disrupt the ways that human-computer interaction researchers have come to expect these relationships to work — I highly recommend reading their article.

#### **Nondeterminism**

As computation has become part of our daily lives over the past decades, we have been able to rely on some amount of reproducibility. When you click a key or push a button, the response from the computer will be the same every time, more or less. This imparts a sense of trustworthiness, where we know that if we learn the correct patterns to achieve our goals we can rely on those patterns to be consistent. Generative AI breaks this contract, because of the nondeterministic nature of the outputs. The average layperson using technology has little experience with the concept of the same keystroke or request returning unexpected and always different results, and this understandably breaks the trust they might otherwise have. The nondeterminism is for a very good reason, of course, and once you understand the technology this is just another characteristic of the technology to work with, but at a less informed stage it could be problematic.

#### **Inscrutability**

This is just another word for “black box”, really. The nature of neural networks that underly much of generative AI is that even those of us who work directly with the technology don’t have the ability to fully explain why a model “does what it does”. We can’t consolidate and explain every neuron’s weighting in every layer of the network, because it’s simply too complex and has too many variables. There are of course many useful explainable AI solutions that can help us understand the levers that are making an impact on a single prediction, but a broader explanation of the workings of these technologies just isn’t realistic. This means that we have to accept some level of unknowability, which, for scientists and curious laypeople alike, can be very difficult to accept.

#### **Autonomy**

The growing push to make generative AI part of semi-autonomous agents seems to be driving us to have these tools operate with less and less oversight, and less control by human users. In some cases, this can be quite useful, but it can also create anxiety. Given what we already know about these tools being nondeterministic and not explainable on a broad scale, autonomy can feel dangerous. If we don’t always know what the model will do, and we don’t fully grasp why it does what it does, some users could be forgiven for saying that this doesn’t feel like a safe technology to allow to operate without supervision. We are constantly working on developing evaluation and testing strategies to try and prevent unwanted behavior, but a certain amount of risk is unavoidable, as is true with any probabilistic technology. On the opposite side, some of the autonomy of generative AI can create situations where users don’t recognize AI’s involvement in a given task at all. It can silently work behind the scenes, and a user could have no awareness of its presence. This is part of the much larger area of concern where AI output becomes indistinguishable from material created organically by humans.

### What this means for product

This doesn’t mean that building products and tools that involve generative AI is a nonstarter, of course. It means, as I often say, that we should take a careful look at whether generative AI is a good fit for the problem or task in front of us, and make sure we’ve considered the risks as well as the possible rewards. This is always the first step — make sure that AI is the right choice and that you’re willing to accept the risks that come with using it.

After that, here’s what I recommend for product designers:

* **Conduct rigorous user research**
  . Find out what the distributions of the user profiles described above are in your user base, and plan how the product you’re constructing will accommodate them. If you have a significant portion of Avoidant users, plan an informational strategy to smooth the way for adoption, and consider rolling things out slowly to avoid a shock to the user base. On the other hand, if you have a lot of Enthusiast users, make sure you’re clear about the boundaries of functionality your tool will provide, so that you don’t get a “your AI sucks” kind of reaction. If people expect magical results from generative AI and you can’t provide that, because there are important safety, security, and functional limitations you must abide by, then this will be a problem for your user experience.
* **Build for your users**
  : This might sound obvious, but essentially I’m saying that your user research should deeply influence not just the look and feel of your generative AI product but the actual construction and functionality of it. You should come at the engineering tasks with an evidence-based view of what this product needs to be capable of and the different ways your users may approach it.
* **Prioritize education**
  . As I have already mentioned, educating your users about whatever the solution you’re providing happens to be is going to be important, regardless of whether they’re positive or negative coming in. Sometimes we assume that people will “just get it” and we can skip over this step, but it’s a mistake. You have to set expectations realistically and preemptively answer questions that might come from a skeptical audience to ensure a positive user experience.
* **Don’t force it**
  . Lately we are finding that software products we have used happily in the past are adding generative AI functionality and making it mandatory.
  [I’ve written before about how the market forces and AI industry patterns are making this happen](https://www.stephaniekirmer.com/writing/canwesavetheaieconomy/)
  , but that doesn’t make it less damaging. You should be prepared for some group of users, however small, to want to refuse to use a generative AI tool. This might be because of critical sentiment, or security regulation, or just lack of interest, but respecting this is the right choice to preserve and protect your organization’s good name and relationship with that user. If your solution is useful, worthwhile, well-tested, and well-communicated, you may be able to increase adoption of the tool over time, but forcing it on people will not help.

### Conclusion

When it comes down to it, a lot of these lessons are good advice for all kinds of technical product design work. However, I want to emphasize how much generative AI changes about how users interact with technology, and the significant shift it represents for our expectations. As a result, it’s more important than ever that we take a really close look at the user and their starting point, before launching products like this out into the world. As many organizations and companies are learning the hard way, a new product is a chance to make an impression, but that impression could be terrible just as easily as it could be good. Your opportunities to impress are significant, but so also are your opportunities to ruin your relationship with users, crush their trust in you, and set yourself up with serious damage control work to do. So, be careful and conscientious at the start! Good luck!

Read more of my work at
[www.stephaniekirmer.com.](http://www.stephaniekirmer.com.)

### Further Reading

<https://scholarworks.indianapolis.iu.edu/items/4a9b51db-c34f-49e1-901e-76be1ca5eb2d>

<https://www.sciencedirect.com/science/article/pii/S2949882124000227>

<https://www.nature.com/articles/s41746-022-00737-z>

<https://www.researchgate.net/profile/Muhammad-Ashraf-Faheem/publication/386330933_Building_Trust_with_Generative_AI_Chatbots_Exploring_Explainability_Privacy_and_User_Acceptance/links/674d7838a7fbc259f1a5c5b9/Building-Trust-with-Generative-AI-Chatbots-Exploring-Explainability-Privacy-and-User-Acceptance.pdf>

<https://www.tandfonline.com/doi/full/10.1080/10447318.2024.2401249#d1e231>

<https://www.stephaniekirmer.com/writing/canwesavetheaieconomy/>


