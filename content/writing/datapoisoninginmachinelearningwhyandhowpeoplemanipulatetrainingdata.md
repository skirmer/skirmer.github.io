



---
date: 2026-01-15
featured_image: "https://cdn-images-1.medium.com/max/1024/0*yzyO665BloKPswmr"
tags: ["ai","cybersecurity","machine-learning"]
title: "Data Poisoning in Machine Learning: Why and How People Manipulate Training Data"
disable_share: false
---
      


Do you know where your data has been?

Data is a sometimes overlooked but hugely vital part of enabling machine learning and therefore AI to function. Generative AI companies are scouring the world for more data constantly because this raw material is required in great volumes for models to be built. Anyone who’s building or tuning a model must first collect a significant amount of data to even begin.

Some conflicting incentives result from this reality, however. Protecting the quality and authenticity of your data is an important component of security, because these raw materials will make or break the machine learning models you are serving to users or customers. Bad actors can strategically insert, mutate, or remove data from your datasets in ways you may not even notice, but which will systematically alter the behavior of your models.

Simultaneously, creators such as artists, musicians, and authors are fighting an ongoing battle against
[rampant copyright violation and IP theft, primarily by generative AI companies](https://www.stephaniekirmer.com/writing/thecomingcopyrightreckoningforgenerativeai/)
that need to find more data to toss into the voracious maw of the training process. These creators are looking for action they can take to prevent or discourage this theft that doesn’t just require being at the mercy of often slow moving courts.

Additionally, as companies do their darndest to replace traditional search engines with AI mediated search, companies whose businesses are founded on being surfaced through search are struggling. How do you access customers and present your desired brand identity to the public if the investments you made in search visibility over past decades are no longer relevant?

All three of these cases point us to one concept — “data poisoning”.

### What Is Data Poisoning?

In short,
[**data poisoning is changing the training data used to produce a machine learning model in some way so that the model behavior is altered.**](https://www.crowdstrike.com/en-us/cybersecurity-101/cyberattacks/data-poisoning/)
The impact is specific to the training process, so once a model artifact is created, the damage is done. The model will be irreparably biased, potentially to the point of being useless, and the only real solution is retraining with clean data.

This phenomenon is a danger for automatic retraining, where human observation is minimal, but also for very well observed training because
[usually the changes to the training data are invisible to the average viewer](https://iacis.org/iis/2025/4_iis_2025_433-442.pdf)
. For example, in one study cited by
[Hartle et al. (2025)](https://iacis.org/iis/2025/4_iis_2025_433-442.pdf)
in relation to poisoned medical misinformation data, “Fifteen clinicians were tasked with determining the poisoned response and the baseline response; the reviewers were unable to determine the difference between the two results… When the concept-specific data was poisoned, at 0.001%, there was a 4.8% increase in harmful content.”

Attempting to reverse-engineer the poisoned data and remove it has largely not been successful. Techniques under the umbrella of
[“machine unlearning”](https://arxiv.org/pdf/2406.17216)
have been attempted, but when we can’t detect the problematic data, it’s difficult for these efforts to make progress. Even when we can detect the data, researchers find that
[removing traces from a model’s architecture is not effective at undoing the damage](https://iacis.org/iis/2025/4_iis_2025_433-442.pdf)
.

Data poisoning can take a lot of different forms, so I’m going to work backwards and discuss three specific motives for data poisoning, how they work, and what their results are:

* Criminal Activity
* Preventing IP Theft
* Marketing

### Criminal Activity

There are a number of reasons criminal actors might want to engage in data poisoning. Many models have access to highly sensitive or valuable data in order to achieve their goals (say, assisting users with interacting with banking software, or
[advising healthcare providers on the best course of treatment for a diagnosis](https://www.nature.com/articles/s41591-024-03445-1)
, etc). If this data could be useful for financial gain, then somebody’s going to try and get their hands on it or alter it for their own purposes.

#### How it Works

Data poisoning can be a bit of a long game, because it requires affecting the training data, but it can still be very stealthy and effective in some situations. I learned a bit about this at the
[IEEE CISOSE conference last July](https://www.stephaniekirmer.com/speaking/ieee_2025/)
, where
[Sofiane Bessaï’s paper](https://ieeexplore.ieee.org/abstract/document/11127238)
was presented discussing how you can possibly identify such cases, in hopes of mitigating the attacks. As they put it, “These attacks introduce imperceptible perturbations into the input data, causing models to make incorrect predictions with high confidence.” This means that the changes to the training data are not obvious at all, and statistical analysis of the training data will have a difficult time revealing these changes. However, by carefully assessing the behavior of the trained model, you have a better chance of reverse-engineering what happened.

Research also indicates that not very much data is required for this kind of attack to work.
[Souly et al. (2025) determined, in fact, that 250 documents was essentially enough](https://arxiv.org/pdf/2510.07192)
to achieve poisoning in numerous different use cases and across varying sizes of training set for text based models.

#### Outcomes

There can be a few different objectives for this kind of attack. For example, if a model is weakened and performance is degraded, a
[cybersecurity model could fail to identify breaches of a network](https://www.sentinelone.com/cybersecurity-101/cybersecurity/data-poisoning/#types-of-data-poisoning-attacks)
. Alternately, the attacker could fraudulent predictions. This can be really effective, because when the output is usually “normal” but rare cases vary from standard model behavior, then the flaw is less likely to be detected, and the model is more likely to be kept in production. As long as the behavior of the model only subtly preferences the attacker’s desired outcome, it can be extremely hard for others to tell that anything’s wrong. Think of something like a model that determines who gets a loan approval, or for how much — if this model offers extravagant loans at ridiculous terms to just a very small subset of people, but for the most part behaves as expected, this could be a very profitable attack.

But data poisoning is not only used for criminal activity - it actually has other purposes as well.

### Preventing IP Theft

When we talk about data poisoning to prevent or penalize IP theft, what we mean is data poisoning not to change the model’s behavior in a particular way, but to try and make the model training fail, if certain content is used without authorization or permission. The goals can be either to make the model fail to learn patterns in certain data, or to make a model entirely unusable due to terrible performance on inference if content used in training is stolen.

#### How it Works

Think about this not as an attack, but as a defense mechanism for the content creators. When creators use techniques like this on their works using tools like
[Nightshade](https://nightshade.cs.uchicago.edu/whatis.html)
, they can
[insert effects that are pretty much imperceptible to the human eye](https://arxiv.org/abs/2310.13828)
, but which will be extremely meaningful to the neural network in the training process. Research indicates this only requires the creator to have access to very few training images to be effective, and isn’t dependent on massive volume.

This isn’t the only option for IP protection in the data poisoning space, however. There is also a tool called
[Glaze](https://glaze.cs.uchicago.edu)
which will prevent the model from reproducing the image’s style, but doesn’t actually interfere with the training generally. Without affecting the images, creators can
[change the way their images are labeled or described](https://link.springer.com/chapter/10.1007/978-3-031-72664-4_1)
in text, because image-text pairs are required to use them for training text to image generative AI models. Some data poisoning can actually
[induce copyright violation](https://arxiv.org/html/2401.04136v1)
as a way to prove that copyrighted content was used in training, which can be instrumental evidence for court cases.

These strategies may work for other media as well.
[AntiFake](https://sites.google.com/view/yu2023antifake)
is a tool that changes soundwaves in a recording to prevent an individual’s voice from being used in model training, like Glaze, preventing a single sample from being learned. It’s also theoretically possible to skew a text generating model by changing language semantics in intentional ways. An LLM learns how words are related to each other in human language patterns, so if a body of text is included in training that purposefully and intentionally violates or manipulates those patterns, it can interfere with the model’s learning approach. If the LLM learns inaccurate patterns in human language, the language it generates will be unconvincing or outright bizarre.

In each case, the desired results are either to make a piece of training data not contribute its characteristics to the model’s underlying architecture, preventing reproduction or mimicry of that data, or to make models behave so unexpectedly or so inappropriately that the model that was trained on this data is not usable so long as the copyrighted material is included in training.

#### Outcomes

Users conducting data poisoning in this scenario are often hoping to be noticed — it’s not a stealth attack, and they aren’t trying to make money by changing model behavior. Instead, they would like the model that’s trained on their IP to be useless, either generally or for copying and reproducing their work. In the end, this would make the theft of their IP or content not profitable to the generative AI company involved.

Many creators would like the economic value of training on poisoned data to become low enough to change industry behavior. Because the effect of poisoning in this form is likely hard to detect until training has happened or at least started, some investment in compute/power/data collection has already been put forth, so finding out the training data is compromised can make that money wasted.

### Marketing

A third application of data poisoning is in the broad area of marketing. It’s a new evolution of what is called search engine optimization, or SEO.

#### SEO

In the case of search engine optimization, marketers would create artificial web pages for search engines to scrape that contain content that was particularly beneficial or complimentary to their client’s brand. Then marketers would create links between these pages that they generated, because search engines would use counts of reference links as part of the algorithm to decide which pages to recommend in search results. By creating more pages that had more interconnected links to each other, if those pages contained material that was beneficial to the customer, search engines would rank these pages higher in relevant search results.

#### How it Works

AI optimization is something similar to this. Instead of creating web content for the attention of search engine algorithms, marketers create content that will be scraped for training data in generative AI model development. This may need to be somewhat high volume, depending on the desired effect, but as we learned when discussing criminal data poisoning, effects on model behavior can often be elicited with less data than you think.

It’s also important to note that creating all this content to feed into the training process is enabled by LLMs as well. It’s cheaper and easier than ever before to generate mountains of text content that seems almost believably human-written, so it’s quite economically viable to generate marketing text at effective scales.

By seeding the training data with targeted content that is beneficial to a customer’s brand, you start to skew the pool of training data in a way that means the model could favor your customer’s brand and/or
[show bias against competitors in subtle ways.](https://www.pnclogos.com/ai-poisoning/)

#### Outcomes

Subtlety is important, because marketers would not want this to necessarily be noticed — it could seem heavy-handed if it’s too obvious, and generative AI model providers might notice and try to remediate it. Instead, a subtle but statistically meaningful preference for one brand over another is sought, and that would start to be revealed in customer and user data when they’re actually using the model.

While this is not necessarily what we might think of as attacking or malicious behavior, it is attempting to skew the results of models against the will of model designers, and that’s contrary to terms of service and acceptable use policies for most generative AI products. However, it can be hard to actually nail down like what the inappropriate activity is here. Marketers are not not forcing researchers to use this data to train an LLM, after all. Generative AI companies are scraping as much of the internet as they can, collecting every webpage they can find in order to fill out the training data available — sometimes that will include this sort of thing. It seems predictable that this kind of behavior would come along sooner or later.

#### When Models Search

Relatedly, major LLMs now also do web search as part of their agentic toolkits, and some
[AIO marketers also work on making sure web based content is tailored to the “preferences” of LLMs that are doing web search](https://seo.ai/blog/llm-seo)
. Through experimentation, it’s sometimes possible to identify what phrasing will make its way through the web search into the LLM’s generated response to the user. This isn’t a training data poisoning strategy, but somewhat more adjacent to prompt engineering or context engineering, since the model is ingesting the search results and using them to formulate output. It has the same effect, though, of making LLM responses to users biased in favor of or against a brand.

### Responding to Data Poisoning

So, if you are training a model using data extracted from sources beyond your control/created by others, how should you avoid data poisoning?

First, don’t steal data for training. Beyond it being the ethically right behavior, you can’t guarantee that the data will not be poisoned — if it’s someone else’s IP and you have no authorization to use it, on one hand, or if malicious actors have gotten their hands on it on the other. You may get lucky and the data may be fine, but you won’t find out until you’ve invested, in all likelihood.

Second, monitor and control data collection, and vet and clean your training data. Even popular open source and free data can still have malicious actors behind it. Take careful steps to clean and analyze your data, and use good data hygiene. Don’t dump slop in your training and expect the process to magically create a good model.

Third, manage and observe your training process. There are tests you can apply to the training data if automatic retraining is happening, and you can also apply scientific techniques to identify whether your model has been poisoned, as I described earlier. This is a developing area of study, so expect these techniques to improve over time, but there are already good ideas out there.

Fourth, test your model in the wild. It’s really difficult to catch misbehavior from generative AI in part because the scope of use cases can be so extensive, but evaluating and testing models on scenarios as close as possible to the real world is important to try. I’ve
[written a few pieces](https://www.stephaniekirmer.com/writing/evaluatingllmsforinferenceorlessonsfromteachingformachinelearning/)
about evaluating LLMs and why this is important— don’t skip evaluation and testing.

Now, I realize that all these solutions have some costs. People use free data or steal others’ IP because paying for all the data used in training LLMs can be insurmountably expensive. I don’t claim to have an answer to this, but “I can’t afford this so I’m going to steal it” really doesn’t hold water in any other areas of our lives, so I don’t think we should start to accept it here. People in the
[broader](https://www.dtaalliance.org/work/data-provenance-standards)
[machine](https://macgence.com/blog/licensed-machine-learning-datasets/)
[learning](https://www.copyright.com/blog/is-the-dataset-youre-using-protected-by-copyright-heres-how-to-find-out/)
community, such as
[the Data Provenance Initiative](https://www.dataprovenance.org)
, are exploring options for creating licensed datasets and finding ways to make data available, which I encourage readers to look into more. The other solutions to data poisoning involve labor and effort as well, but to develop models that meet our needs and expectations, there’s always going to be a tradeoff.

Beyond this, there’s still always some risk if you don’t control the creation of the data or model you’re using. As a general rule, never trust model output blindly, but instead evaluate and test the models you plan to use, especially if someone else trained them. Model behavior is a contested space — various entities have a vested interest in controlling how generative AI models perform and interact with us, so we need to meet the challenges accordingly.

Read more of my work at
[www.stephaniekirmer.com](http://www.stephaniekirmer.com)
.

### Further Reading

<https://www.crowdstrike.com/en-us/cybersecurity-101/cyberattacks/data-poisoning/>

<https://ieeexplore.ieee.org/abstract/document/11127238>

<https://iacis.org/iis/2025/4_iis_2025_433-442.pdf>

<https://www.nature.com/articles/s41591-024-03445-1>

<https://arxiv.org/pdf/2510.07192>

<https://arxiv.org/pdf/2406.17216>

<https://www.pnclogos.com/ai-poisoning/>

<https://www.stephaniekirmer.com/writing/thecomingcopyrightreckoningforgenerativeai/>

<https://seo.ai/blog/llm-seo>

<https://www.stephaniekirmer.com/writing/evaluatingllmsforinferenceorlessonsfromteachingformachinelearning/>

### IP Protection

<https://nightshade.cs.uchicago.edu/whatis.html>

<https://glaze.cs.uchicago.edu>

<https://engineering.washu.edu/news/2023/Defending-your-voice-against-deepfakes.html>

<https://sites.google.com/view/yu2023antifake>

<https://arxiv.org/abs/2310.13828>

<https://link.springer.com/chapter/10.1007/978-3-031-72664-4_1>

<https://arxiv.org/html/2401.04136v1>

<https://aibusinessreport.substack.com/p/how-data-poisoning-works-to-prevent>

### Data Transparency

<https://mitsloan.mit.edu/ideas-made-to-matter/bringing-transparency-to-data-used-to-train-artificial-intelligence>

<https://www.dataprovenance.org>

<https://www.dtaalliance.org/work/data-provenance-standards>

<https://macgence.com/blog/licensed-machine-learning-datasets/>

<https://www.copyright.com/blog/is-the-dataset-youre-using-protected-by-copyright-heres-how-to-find-out/>


