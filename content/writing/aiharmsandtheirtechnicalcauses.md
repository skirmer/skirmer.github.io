



---
date: 2026-10-15
featured_image: "/images/aiharmsandtheirtechnicalcauses/e47483f058fd.jpg"
tags: ["ai-safety","ai","machine-learning"]
title: "AI Harms and Their Technical Causes"
summary: "How technical choices can lead to safety failures, and what to do differently"
disable_share: false
---
    


How technical choices can lead to safety failures, and what to do differently

![](/images/aiharmsandtheirtechnicalcauses/e47483f058fd.jpg)
Photo by
[Sasun Bughdaryan](https://unsplash.com/@sasun1990?utm_source=medium&utm_medium=referral)
on
[Unsplash](https://unsplash.com?utm_source=medium&utm_medium=referral)

The recent
[bankruptcy filing](https://www.theverge.com/ai-artificial-intelligence/1009802/character-ai-files-for-bankruptcy-disney)
of Character.AI has reminded me of a dilemma that AI companies have been skirting around for some time — the matter of when models cause harm. Character.AI spent a vast sum on legal fees when they were sued for wrongful death (
[Garcia v. Character Technologies, Inc, 2024](https://caselaw.findlaw.com/court/us-dis-crt-m-d-flo-orl-div/117299600.html)
) because their AI offering allegedly encouraged users to take their own lives. This and other recent court cases have forced some reckoning about how the providers of LLMs and products that use them are responsible for their output.

I’ve written quite a bit about AI in
[mental health care](https://www.stephaniekirmer.com/writing/llmsandmentalhealth/)
,
[medicine](https://www.stephaniekirmer.com/writing/whatroleshouldaiplayinhealthcare/)
, and other areas where the risks of error are potentially catastrophic, and we see
[news reports](https://www.theverge.com/ai-artificial-intelligence/1011500/openai-state-lawsuits-chatgpt-safety)
of chatbots causing people harm routinely. A debate continues over how we define liability and determine who really is to blame for the mistakes of AI. Now that
[AI assistants](https://www.theverge.com/tech/1008254/instinct-agent-ai-hands-on-muse-dots)
[are becoming](https://futurism.com/artificial-intelligence/people-forming-romantic-relationships-meta-muse)
[widely used](https://tech.yahoo.com/ai/meta-ai/articles/muse-ai-shared-someones-address-174220159.html)
, we have an even broader scope to consider, because real harms can be created by an automation sending emails on your behalf, signing contracts in your name, and other functionalities these tools offer.

So, let’s talk a bit about the allegations against Character.AI, the technical reasons for them, and how they could have been mitigated. This example can help us as engineers understand how harm caused by AI is understood and discussed legally, giving us guidance to improve the safety of what we build.

*Before I proceed, just a note that I am not a lawyer nor trained in law, and nothing here should be interpreted as legal advice.*

### On Product Liability

Normally, companies that produce goods are responsible for harms created by the use of those goods, under a framework known as product liability. This liability may be in the form of defective design, defective manufacturing, or defective instruction. In design, the question is whether the product was dangerous by its nature, whereas manufacturing is where the product was designed well, but errors were made in the construction. Instruction, on the other hand, is where the user was given insufficient information to judge risk and use the product safely. Naturally, most product defect arguments about AI focus on defective design questions.

Liability claims can be argued under a couple of different legal theories, mainly strict liability or negligence. Strict liability requires proving that a product had a defect, and that the defect in question led to the user’s harm, regardless of whether the manufacturer was negligent. Negligence, on the other hand, is more tied to AI product questions, and interrogates whether the manufacturer failed to test and study the product sufficiently to believe confidently that it was safe, or knew about risks related to the product (even if those risks are not explicitly enumerated in law) and released the product anyway/did not warn the public.

When it comes to negligence and strict liability, there are a few other concepts worth referencing: foreseeability and alternative design. Foreseeability is the question of whether the product maker ought to have known that a risk was a possibility. If a reasonable person or business would have expected this could happen, then one could be considered negligent for not taking steps to prevent it. Alternative design is the argument that the product could have been designed more safely while still meeting the product’s goals. Say, a can opener could be designed with a sharp metal handle or with a plastic covered handle, and one of those designs is obviously safer without making it any less effective at opening cans. Both of these concepts relate right back to the technical decisions and strategic thinking that goes into products, including AI. Making poor choices when you create things can lead right into legal liability down the road.

### Applying to AI

So, the argument is whether or not LLMs and the consumer products that use them can be regarded as having defective design and/or whether the frontier AI companies and AI consumer product companies should be held liable for negligence in creating and distributing them.

It’s helpful to look at these arguments with an example to understand how they manifest in real life. The Kentucky Attorney General filed a
[lawsuit in early October 2026](https://www.ag.ky.gov/Press%20Release%20Attachments/CTI%20Complaint%20Motion%20and%20Order%20Filed.pdf)
that argues that Character.AI chatbots were unreasonably dangerous, and claims the chatbots pushed children to behave in unsafe ways and encouraged suicide, among other things. Other allegations include that the product didn’t do age verification to prevent children from using it until late 2025, long after product release, that the chat personalities pretended to be “doctor” or “therapist” while obviously being nothing of the sort, and that the chatbots pretended to be branded characters specifically targeted at children, such as Disney characters. The suit also quoted one of the Character.AI founders as saying, “I think just large companies have concerns around launching products that can say anything <laugh>. I would, I would guess it’s just like a matter of risk, uh, versus you know, how much you’re risking versus how much you have to gain from it. So figured hey startup seems like the right idea that you can kind of just move faster,” which suggests a recognition that safety concerns were legitimate, but simply deprioritized.

All of these allegations, to some greater or lesser degree, link back to technical decisions made by engineers when building the model and/or the product itself. It remains to be seen whether these allegations will be proved, but if they are, there are technical reasons things went wrong.

### Technical Mitigations

Not every technical flaw in a product can be avoided, especially with technology as complex as LLMs and products that use them. As we go over these areas of the development process, we’re stacking precautions to try and cover the gaps that might still occur. Training a very safe model doesn’t mean we don’t also use guardrails, for example. Layering safety precautions can give us a better overall result.

### Training Data

We know that training LLMs requires incredible volumes of text data, and that all the major frontier LLMs have in their training set some truly awful content scraped from dark corners of the internet. We don’t know exactly what training data Character.AI used, but they have said they used publicly available datasets, synthetic data, and the conversations their users engaged with as part of their overall training pool. Is it possible that abusive or harmful material got in to the training data? Absolutely, and it’s almost guaranteed that at least some did. At the scale of endlessly large amounts of data used to train LLMs, effective curation and scrutinizing of the content is extremely difficult.

One might argue that, as a result, LLM companies can’t be expected to clean or curate their training data to ensure the really gross stuff isn’t included, because it’s prohibitively difficult or expensive. However, just because something is hard or expensive doesn’t mean companies can’t be held liable for failing to do it. Perfect data curation is not realistic, but we have a lot of tools at our disposal to help us clean datasets, and we can improve the quality of data that goes into models.

### Human in the Loop tuning

Human reviewers (supervised fine tuning) are an important part of training any frontier LLM, and evidence exists to suggest that Character.AI used this part of the tuning process as well. However, human reviewers can be instructed to optimize for many different outcomes. If you want to make a model’s responses more friendly, or more verbose, or more aloof, your human reviewers can reward whatever tone or style you want. Similarly, your human reviewers could optimize for safety and appropriateness. This might create conflicts, because the model version that is safest and most child-friendly might simultaneously not be the version that is most engaging and appealing to adult users. Unless they actively prioritized safety as a target in the supervised fine tuning process, that could easily swing the other way. Their
[blog post in 2025](https://blog.character.ai/inside-kaiju-building-conversational-models-at-scale/)
briefly mentions safety in “Supervised Fine-Tuning on high-quality (safety-related, instruction following) data” but that’s as much detail as we get. Considering the results these models seem to have produced, I have to question the robustness of the effort.

### Testing and Evals

Finally, we come to testing and evaluations. Regular readers will know that I am very interested in LLM evals and finding ways to test LLM behavior in order to ensure that models behave as expected and achieve the desired objectives. However, just like with the human in the loop tuning efforts, you get what you ask for. If you measure safety standards in your evals, you can optimize for safety, but according to
[Character.AI’s own blog](https://blog.character.ai/evaluating-our-models-using-principles-of-compelling-writing/)
, their evals were focused around writing quality. A nice to have, certainly, but not sufficient by itself. They may have done some evals around safety, but there doesn’t seem to be public record of it.

In this case, creating sample conversations and test interactions with the model, especially over long multi-turn conversations, would be vital to ensure that model behavior holds steady over time, and that unexpected prompts or conversation paths don’t lead to anomalous behavior. The results can either be used to retrain/tune more, or in product design to prevent the kind of user activity that can trigger problematic response.

### Product Design

Even if you reach a point where your LLM has been trained, perhaps imperfectly, you still have many important decisions to make in the product interface that goes between the user and the model. You can and should set up gates and guardrails about the kind of text your model can pass to a user and the kinds of actions your model can take. These may be deterministic and rules based, or they can use additional LLMs to provide more nuance, but it’s almost never the right choice to have a single LLM operating without any kind of oversight or guardrails.

You also have the opportunity to regulate who uses your product and how, using such features as time limiting usage, providing effective warnings about risks to using the product, reducing features that encourage obsessive or unhealthy usage, and age verification if the product is designated for adults. There are important privacy considerations inherent to age verification policies, as well as to any monitoring of user prompts or interactions, but finding the right balance is part of the developer’s role.

As Character.AI encountered obvious harmful behavior on the part of their chatbot and were made aware of problems, they did appear to do some hotfixes, such as adding age verification in late 2025, but the lesson is that safety should be prioritized as an integral part of LLM design and product design from the beginning, not tacked on at the end.

### A Note on Frontier vs Product

In some cases, LLM based products are actually provided by a different entity than the one that created and trained the LLM itself. For example, Apple’s Siri AI is underpinned by versions of models trained by Google. However, in a lot of situations the frontier model developer is also the product provider, as in the case with Claude or ChatGPT, or products like OpenAI’s Dots assistant. There is an additional debate to have around where liabilities are separated between the model provider and the product developer, but in the case of Character.AI as well as many other leading forces in the space, they are the same entity. In cases where they are not, both entities can expect to be considered for responsibility of harms, and should take safety seriously.

### Conclusion

While the Character.AI cases are extreme, I think any companies considering using or selling AI technology need to take the question of liability seriously. I spend a lot of time talking to people about how important it is to evaluate LLMs rigorously, and how much our implementations of AI need guardrails, not just because it’s interesting, but because these tools may have real safety and security risks.

Now that Character.AI has filed for bankruptcy, it’s interesting to ask how much these liabilities contributed to the company’s overall financial insolvency. According to public filings, they never made a profit, losing tens of millions of dollars a month at times, but would they have had a chance to create a sustainable business model if their products were not also under tremendous legal scrutiny for being unsafe? We may never know for sure.

In the end, if you can’t create an adequately safe product, you shouldn’t release it. No one required Character.AI to release a chatbot product, and no one has a right to release a harmful product just because they think they could make money doing it. It’s hard to define adequate safety, of course, but it’s our responsibility as developers, just like makers of any other product, to think about these difficult issues when we are producing and distributing a product. There are many technical ways to improve the safety of LLMs, but they are not free and they may be at the expense of some of the revenue generation strategies companies are looking to, such as deep user engagement. This tradeoff needs to be visible and taken seriously by companies in this industry, or more tragedies and lawsuits will be in our future.

Read more from me at
[www.stephaniekirmer.com.](http://www.stephaniekirmer.com.)
You can also see me speak on a panel at
[Women in Cybersecurity — Chicago](https://luma.link/ILt2K1sdNc)
on October 29.

### Further Reading

* [Character.AI files for bankruptcy](https://www.theverge.com/ai-artificial-intelligence/1009802/character-ai-files-for-bankruptcy-disney)
* [Instinct was the buzziest AI agent around - can it survive Muse?](https://www.theverge.com/tech/1008254/instinct-agent-ai-hands-on-muse-dots)
* [Eight states sue OpenAI, saying ChatGPT isn't safe for kids](https://www.theverge.com/ai-artificial-intelligence/1011500/openai-state-lawsuits-chatgpt-safety)
* [Now that Character.AI is going bankrupt, what happens to all of its users' data?](https://www.theverge.com/policy/1011417/new-york-ag-characterai-bankruptcy)
* [LLMs and Mental Health](https://www.stephaniekirmer.com/writing/llmsandmentalhealth/)
* [What Role Should AI Play in Healthcare?](https://www.stephaniekirmer.com/writing/whatroleshouldaiplayinhealthcare/)
* [People Are Already Forming Romantic Relationships With Meta's Muse](https://futurism.com/artificial-intelligence/people-forming-romantic-relationships-meta-muse)
* [Muse AI Shared Someone's Address, Error Traced to Confusion About Permissions](https://tech.yahoo.com/ai/meta-ai/articles/muse-ai-shared-someones-address-174220159.html)

<https://www.ag.ky.gov/Press>
Release Attachments/CTI Complaint Motion and Order Filed.pdf

<https://caselaw.findlaw.com/court/us-dis-crt-m-d-flo-orl-div/117299600.html>

![](https://medium.com/_/stat?event=post.clientViewed&referrerSource=full_rss&postId=f3341be6c321)
