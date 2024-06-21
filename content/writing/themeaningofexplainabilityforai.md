



---
date: 2024-06-04
featured_image: "https://cdn-images-1.medium.com/max/1024/0*J4AEtoSIun9dPlWB"
tags: ["artificial-intelligence","ethics","machine-learning","xai","editors-pick"]
title: "The Meaning of Explainability for AI"
disable_share: false
---
      
#### 
 Do we still care about how our machine learning does what it does?



 Today I want to get a bit philosophical and talk about how explainability and risk intersect in machine learning.



### 
 What do we mean by Explainability?



 In short,
 [explainability](https://www.researchgate.net/profile/Kai-Heinrich-3/publication/344357897_White_Grey_Black_Effects_of_XAI_Augmentation_on_the_Confidence_in_AI-based_Decision_Support_Systems/links/5f6ba89392851c14bc922907/White-Grey-Black-Effects-of-XAI-Augmentation-on-the-Confidence-in-AI-based-Decision-Support-Systems.pdf) 
 in machine learning is the idea that you could explain to a human user (not necessarily a technically savvy one) how a model is making its decisions. A decision tree is an example of an easily explainable (sometimes called “white box”) model, where you can point to “The model divides the data between houses whose acreage is more than one or less than or equal to one” and so on. Other kinds of more complex model can be “gray box” or “black box” — increasingly difficult leading to impossible for a human user to understand out of the gate.



### 
 The Old School



 A foundational lesson in my machine learning education was always that our relationship to models (which were usually boosted tree style models) should be, at most, “Trust, but verify”. When you train a model, don’t take the initial predictions at face value, but spend some serious time kicking the tires. Test the model’s behavior on very weird outliers, even when they’re unlikely to happen in the wild. Plot the tree itself, if it’s shallow enough. Use techniques like feature importance, Shapley values, and
 [LIME](https://arxiv.org/abs/1602.04938) 
 to test that the model is making its inferences using features that correspond to your knowledge of the subject matter and logic. Were feature splits in a given tree aligned with what you know about the subject matter? When modeling physical phenomena, you can also compare your model’s behavior with what we know scientifically about how things work. Don’t just trust your model to be approaching the issues the right way, but check.




> 
>  Don’t just trust your model to be approaching the issues the right way, but check.
> 


### 
 Enter Neural Networks



 As the relevance of neural networks has exploded, the biggest tradeoff that we have had to consider is that this kind of explainability becomes incredibly difficult, and changes significantly, because of the way the architecture works.




 Neural network models apply functions to the input data at each intermediate layer, mutating the data in myriad ways before finally passing data back out to the target values in the final layer. The effect of this is that, unlike splits of a tree based model, the intermediate layers between input and output are frequently not reasonably human interpretable. You may be able to find a specific node in some intermediate layer and look at how its value influences the output, but linking this back to real, concrete inputs that a human can understand will usually fail because of how abstracted the layers of even a simple NN are.




 This is easily illustrated by the “husky vs wolf” problem. A convolutional neural network was trained to distinguish between photos of huskies and wolves, but upon investigation, it was discovered that the model was making choices based on the color of the background. Training photos of huskies were less likely to be in snowy settings than wolves, so any time the model received an image with a snowy background, it predicted a wolf would be present. The model was using information that the humans involved had not thought about, and developed its internal logic based on the wrong characteristics.




 This means that the traditional tests of “is this model ‘thinking’ about the problem in a way that aligns with physical or intuited reality?” become obsolete. We can’t tell how the model is making its choices in that same way, but instead we end up relying more on trial-and-error approaches. There are systematic experimental strategies for this, essentially testing a model against many counterfactuals to determine what kinds and degrees of variation in an input will produce changes in an output, but this is necessarily arduous and compute intensive.




> 
>  We can’t tell how the model is making its choices in that same way, but instead we end up relying more on trial-and-error approaches.
> 



 I don’t mean to argue that efforts to understand in some part how neural networks do what they do are hopeless. Many scholars are very interested in
 [explainable AI, known as XAI in the literature](https://arxiv.org/pdf/2404.09554) 
 . The variations in the kinds of model available today mean that there are many approaches that we can and should pursue. Attention mechanisms are one technological advancement that help us understand what parts of an input the model is paying closest attention to/being driven by, which can be helpful.
 [Anthropic just released a very interesting report digging into interpretability for Claude, attempting to understand what words, phrases, or images spark the strongest activation for LLMs depending on the prompts using sparse autoencoders.](https://transformer-circuits.pub/2024/scaling-monosemanticity/index.html) 
 Tools I described above,
 [including Shapley](https://skirene.medium.com/demystifying-neural-nets-with-shapley-values-cca29c836089) 
[and LIME](https://github.com/marcotcr/lime/blob/master/doc/notebooks/Tutorial%20-%20images%20-%20Pytorch.ipynb) 
 , can be applied to some varieties of neural networks too, such as CNNs, although the results can be challenging to interpret. But the more we add complexity, by definition, the harder it will be for a human viewer or user to understand and interpret how the model is working.



### 
 Considering Randomness



 An additional element that is important here is to recognize that many neural networks incorporate randomness, so you can’t always rely on the model to return the same output when it sees the same input. In particular, generative AI models intentionally may generate different outputs from the same input, so that they seem more “human” or creative — we can increase or decrease the extremity of this variation by
 [tuning the “temperature”](https://medium.com/@harshit158/softmax-temperature-5492e4007f71#:~:text=Temperature%20is%20a%20hyperparameter%20of%20LSTMs%20(and%20neural%20networks%20generally,the%20logits%20before%20applying%20softmax.) 
 . This means that sometimes our model will choose to return not the most probabilistically desirable output, but something “surprising”, which enhances the creativity of the results.




 In these circumstances, we can still do some amount of the trial-and-error approach to try and develop our understanding of what the model is doing and why, but it becomes exponentially more complex. Instead of the only change to the equation being a different input, now we have changes in the input plus an unknown variability due to randomness. Did your change of input change the response, or was that the result of randomness? It’s often impossible to truly know.




> 
>  Did your change of input change the response, or was that the result of randomness?
> 


### 
 Real World Implications



 So, where does this leave us? Why do we want to know how the model did its inference in the first place? Why does that matter to us as machine learning developers and users of models?




 If we build machine learning that will help us make choices and shape people’s behaviors, then the accountability for results needs to fall on us. Sometimes model predictions go through a human mediator before they are applied to our world, but increasingly we’re seeing models being set loose and inferences in production being used with no further review. The general public has more unmediated access to machine learning models of huge complexity than ever before.




 To me, therefore, understanding how and why the model does what it does is due diligence just like testing to make sure a manufactured toy doesn’t have lead paint on it, or a piece of machinery won’t snap under normal use and break someone’s hand. It’s a lot harder to test that, but ensuring I’m not releasing a product into the world that makes life worse is a moral stance I’m committed to. If you are building a machine learning model, you are responsible for what that model does and what effect that model has on people and the world. As a result, to feel really confident that your model is safe to use, you need some level of understanding about how and why it returns the outputs it does.




> 
>  If you are building a machine learning model, you are responsible for what that model does and what effect that model has on people and the world.
> 



 As an aside, readers might remember from
 [my article about the EU AI Act](https://medium.com/towards-data-science/uncovering-the-eu-ai-act-22b10f946174) 
 that there are requirements that model predictions be subject to human oversight and that they not make decisions with discriminatory effect based on protected characteristics. So even if you don’t feel compelled by the moral argument, for many of us there is a legal motivation as well.




 Even when we use neural networks, we can still use tools to better understand how our model is making choices — we just need to take the time and do the work to get there.



### 
 But, Progress?



 Philosophically, we could (and people do) argue that advancements in machine learning past a basic level of sophistication require giving up our desire to understand it all. This may be true! But we shouldn’t ignore the tradeoffs this creates and the risks we accept. Best case, your generative AI model will mainly do what you expect (perhaps if you keep the temperature in check, and your model is very uncreative) and not do a whole lot of unexpected stuff, or worst case you unleash a disaster because the model reacts in ways you had no idea would happen. This could mean you look silly, or it could mean the end of your business, or it could mean real physical harm to people. When you accept that model explainability is unachievable, these are the kind of risks you are taking on your own shoulders. You can’t say “oh, models gonna model” when you built this thing and made the conscious decision to release it or use its predictions.




 Various tech companies both large and small have accepted that generative AI will sometimes produce incorrect, dangerous, discriminatory, and otherwise harmful results, and decided that this is worth it for the perceived benefits — we know this because generative AI models that routinely behave in undesirable ways have been released to the general public. Personally, it bothers me that the tech industry has chosen, without any clear consideration or conversation, to subject the public to that kind of risk, but the genie is out of the bottle.



### 
 Now what?



 To me, it seems like pursuing XAI and trying to get it up to speed with the advancement of generative AI is a noble goal, but I don’t think we’re going to see a point where most people can easily understand how these models do what they do, just because the architectures are so complicated and challenging. As a result, I think we also need to implement risk mitigation, ensuring that those responsible for the increasingly sophisticated models that are affecting our lives on a daily basis are accountable for these products and their safety. Because the outcomes are so often unpredictable, we need frameworks to protect our communities from the worst case scenarios.




 We shouldn’t regard all risk as untenable, but we need to be clear-eyed about the fact that risk exists, and that the challenges of explainability for the cutting edge of AI mean that risk of machine learning is harder to measure and anticipate than ever before. The only responsible choice is to balance this risk against the real benefits these models generate (not taking as a given the projected or promised benefits of some future version), and make thoughtful decisions accordingly.




 Read more of my work at
 [www.stephaniekirmer.com](http://www.stephaniekirmer.com) 
 .



### 
 Further Reading


* [Scaling Monosemanticity: Extracting Interpretable Features from Claude 3 Sonnet](https://transformer-circuits.pub/2024/scaling-monosemanticity/index.html) 
 (May 21, 2024, Anthropic team)
* [Explainable Generative AI: A Survey, Conceptualization, and Research Agenda](https://arxiv.org/pdf/2404.09554) 
 (April 15, 2024; Johannes Schneider) — this one is a really accessible read, I recommend it.
* [An analysis of explainability methods for convolutional neural networks](https://www.sciencedirect.com/science/article/pii/S0952197622005966) 
 (January 2023, Von der Haar et al)
* [Explainable Convolutional Neural Networks: A Taxonomy, Review, and Future Directions](https://dl.acm.org/doi/full/10.1145/3563691) 
 (Feb 2, 2023; Ibrahim et al)
* [Google’s AI tells users to add glue to their pizza, eat rocks and make chlorine gas](https://www.livescience.com/technology/artificial-intelligence/googles-ai-tells-users-to-add-glue-to-their-pizza-eat-rocks-and-make-chlorine-gas) 
 (May 23, 2024)





---



[The Meaning of Explainability for AI](https://towardsdatascience.com/the-meaning-of-explainability-for-ai-d8ae809c97fa) 
 was originally published in
 [Towards Data Science](https://towardsdatascience.com) 
 on Medium, where people are continuing the conversation by highlighting and responding to this story.



