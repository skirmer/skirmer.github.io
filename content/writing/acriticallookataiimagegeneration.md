



---
date: 2024-10-17
featured_image: "https://cdn-images-1.medium.com/max/1024/0*S3fgL8Miz_wL83B1"
tags: ["photography","society","thoughts-and-theory","art","generative-ai-tools"]
title: "A Critical Look at AI Image Generation"
disable_share: false
---
      
#### 
 What does image generative AI really tell us about our world?



 I recently had the opportunity to provide analysis on
 [an interesting project](https://bit.ly/genaiSK) 
 , and I had more to say than could be included in that single piece, so today I’m going to discuss some more of my thoughts about it.




 The approach the researchers took with this project involved providing a series of prompts to different generative AI image generation tools: Stable Diffusion, Midjourney, YandexART, and ERNIE-ViLG (by Baidu). The prompts were particularly framed around different generations — Baby Boomers, Gen X, Millennials, and Gen Z, and requested images of these groups in different contexts, such as “with family”, “on vacation”, or “at work”.




 While the results were very interesting, and perhaps revealed some insights about visual representation, I think we should also take note of what this cannot tell us, or what the limitations are. I’m going to divide up my discussion into the aesthetics (what the pictures look like) and representation (what is actually shown in the images), with a few side tracks into how these images come to exist in the first place, because that’s really important to both topics.



### 
 Introduction



 Before I start, though, a quick overview of these image generator models. They’re created by taking giant datasets of images (photographs, artwork, etc) paired with short text descriptions, and the goal is to get the model to learn the relationships between words and the appearance of the images, such that when given a word the model can create an image that matches, more or less. There’s a lot more detail under the hood, and the models (like other generative AI) have a built in degree of randomness that allows for variations and surprises.




 When you use one of these hosted models, you give a text prompt and an image is returned. However, it’s important to note that your prompt is not the ONLY thing the model gets. There are also built in instructions, which I call pre-prompting instructions sometimes, and these can have an effect on what the output is. Examples might be telling the model to refuse to create certain kinds of offensive images, or to reject prompts using offensive language.



### 
 Training Data



 An important framing point here is that the training data, those big sets of images that are paired with text blurbs, is what the model is trying to replicate. So, we should ask more questions about the training data, and where it comes from. To train models like these, the volume of image data required is extraordinary. Midjourney was trained on
 <https://laion.ai/>
 , whose larger dataset has 5 billion image-text pairs across multiple languages, and we can assume the other models had similar volumes of content. This means that engineers can’t be TOO picky about which images are used for training, because they basically need everything they can get their hands on.




 Ok, so where do we get images? How are they generated? Well, we create our own and post them on social media by the bucketload, so that’s necessarily going to be a chunk of it. (It’s also easy to get a hold of, from these platforms.) Media and advertising also create tons of images, from movies to commercials to magazines and beyond. Many other images are never going to be accessible to these models, like your grandma’s photo album that no one has digitized, but the ones that are available to train are largely from these two buckets: independent/individual creators and media/ads.




 So, what do you actually get when you use one of these models?



### 
 Aesthetics



 One thing you’ll notice if you try out these different image generators is the stylistic distinctions between them, and the internal consistency of styles. I think this is really fascinating, because they feel like they almost have personalities! Midjourney is dark and moody, with shadowy elements, while Stable Diffusion is bright and hyper-saturated, with very high contrast. ERNIE-ViLG seems to lean towards a cartoonish style, also with very high contrast and textures appearing rubbery or highly filtered. YandexART has washed out coloring, with often featureless or very blurred backgrounds and the appearance of spotlighting (it reminds me of a family photo taken at a department store in some cases). A number of different elements may be responsible for each model’s trademark style.




 As I’ve mentioned, pre-prompting instructions are applied in addition to whatever input the user gives. These may indicate specific aesthetic components that the outputs should always have, such as stylistic choices like the color tones, brightness, and contrast, or they may instruct the model not to follow objectionable instructions, among other things. This forms a way for the model provider to implement some limits and guardrails on the tool, preventing abuse, but can also create aesthetic continuity.




 The process of fine tuning with reinforcement learning may also affect style, where human observers are making judgments about the outputs that are provided back to the model for learning. The human observers will have been trained and given instructions about what kinds of features of the output images to approve of/accept and which kinds should be rejected or down-scored, and this may involve giving higher ratings to certain kinds of visuals.




 The type of training data also has an impact. We know some of the massive datasets that are employed for training the models, but there is probably more we don’t know, so we have to infer from what the models produce. If the model is producing high-contrast, brightly colored images, there’s a good chance the training data included a lot of images with those characteristics.




 As we analyze the outputs of the different models, however, it’s important to keep in mind that these styles are probably a combination of pre-prompting instructions, the training data, and the human fine tuning.




 Beyond the visual appeal/style of the images, what’s actually in them?



### 
 Representation


#### 
 Limitations



 What the models will have the capability to do is going to be limited by the reality of how they’re trained. These models are trained on images from the past — some the very recent past, but some much further back. For example, consider: as we move forward in time, younger generations will have images of their entire lives online, but for older groups, images from their youth or young adulthood are not available digitally in large quantities (or high quality) for training data, so we may never see them presented by these models as young people. It’s very visible in this project: For Gen Z and Millennials, in this data we see that the models struggle to “age” the subjects in the output appropriately to the actual age ranges of the generation today. Both groups seem to look more or less the same age in most cases, with Gen Z sometimes shown (in prompts related to schooling, for example) as actual children. In contrast, Boomers and Gen X are shown primarily in middle age or old age, because the training data that exists is unlikely to have scanned copies of photographs from their younger years, from the 1960s-1990s. This makes perfect sense if you think in the context of the training data.




> 
>  [A]s we move forward in time, younger generations will have images of their entire lives online, but for older groups, images from their youth or young adulthood are not available digitally for training data, so we may never see them presented by these models as young people.
> 


#### 
 Identity



 With this in mind, I’d argue that what we can get from these images, if we investigate them, is some impression of A. how different age groups present themselves in imagery, particularly selfies for the younger sets, and B. how media representation looks for these groups. (It’s hard to break these apart sometimes, because media and youth culture are so dialectical.)




 The training data didn’t come out of nowhere — human beings chose to create, share, label, and curate the images, so those people’s choices are coloring everything about them. The models are getting the image of these generations that someone has chosen to portray, and in all cases these portrayals have a reason and intention behind it.




 A teen or twentysomething taking a selfie and posting it online (so that it is accessible to become training data for these models) probably took ten, or twenty, or fifty before choosing which one to post to Instagram. At the same time, a professional photographer choosing a model to shoot for an ad campaign has many considerations in play, including the product, the audience, the brand identity, and more. Because professional advertising isn’t free of racism, sexism, ageism, or any of the other -isms, these images won’t be either, and as a result, the image output of these models comes with that same baggage. Looking at the images, you can see many more phenotypes resembling people of color among Millennial and Gen Z for certain models (Midjourney and Yandex in particular), but hardly any of those phenotypes among Gen X and Boomers in the same models. This may be at least partly because advertisers targeting certain groups choose representation of race and ethnicity (as well as age) among models that they believe will appeal to them and be relatable, and they’re presupposing that Boomers and Gen X are more likely to purchase if the models are older and white. These are the images that get created, and then end up in the training data, so that’s what the models learn to produce.




 The point I want to make is that these are not free of influence from culture and society — whether that influence is good or bad. The training data came from human creations, so the model is bringing along all the social baggage that those humans had.




> 
> *The point I want to make is that these are not free of influence from culture and society — whether that influence is good or bad. The training data came from human creations, so the model is bringing along all the social baggage that those humans had.* 
> 



 Because of this reality, I think that asking whether we can learn about generations from the images that models produce is kind of the wrong question, or at least a misguided premise. We might incidentally learn something about the people whose creations are in the training set, which may include selfies, but we’re much more likely to learn about the broader society, in the form of people taking pictures of others as well as themselves, the media, and commercialism. Some (or even a lot) of what we’re getting, especially for the older groups who don’t contribute as much self-generated visual media online, is at best perceptions of that group from advertising and media, which we know has inherent flaws.




 Is there
 *anything* 
 to be gained about generational understanding from these images? Perhaps. I’d say that this project can potentially help us see how generational identities are being filtered through media, although I wonder if it is the most convenient or easy way to do that analysis. After all, we could go to the source — although the aggregation that these models conduct may be academically interesting. It also may be more useful for younger generations, because more of the training data is self-produced, but even then I still think we should remember that we imbue our own biases and agendas into the images we put out into the world about ourselves.




 As an aside, there is a knee-jerk impulse among some commentators to demand some sort of whitewashing of the things that models like this create— that’s how we get
 [models that will create images of Nazi soldiers of various racial and ethnic appearances](https://www.theverge.com/2024/2/21/24079371/google-ai-gemini-generative-inaccurate-historical) 
 .
 [As I’ve written before](https://medium.com/towards-data-science/seeing-our-reflection-in-llms-7b9505e901fd) 
 , this is largely a way to avoid dealing with the realities about our society that models feed back to us. We don’t like the way the mirror looks, so we paint over the glass instead of considering our own face.




 Of course, that’s not completely true either —
 *all* 
 of our norms and culture are not going to be represented in the model’s output, only that which we commit to images and feed in to the training data. We’re seeing some slice of our society, but not the whole thing in a truly warts-and-all fashion. So, we must set our expectations realistically based on what these models are and how they are created. We are not getting a pristine picture of our lives in these models, because the photos we take (and the ones we don’t take, or don’t share), and the images media creates and disseminates, are not free of bias or objective. It’s the same reason we shouldn’t judge ourselves and our lives against the images our friends post on Instagram — that’s not a complete and accurate picture of their life either. Unless we implement a massive campaign of photography and image labeling that pursues accuracy and equal representation, for use in training data, we are not going to be able to change the way this system works.



### 
 Conclusion



 Getting to spend time with these ideas has been really interesting for me, and I hope the analysis is helpful for those of you who use these kinds of models regularly. There are lots of issues with using generative AI image generating models, from the
 [environmental](https://medium.com/towards-data-science/environmental-implications-of-the-ai-boom-279300a24184) 
 to the
 [economic](https://medium.com/towards-data-science/the-coming-copyright-reckoning-for-generative-ai-b7fe0963c58f) 
 , but I think understanding what they are (and aren’t) and what they really do is critical if you choose to use the models in your day to day.




 Read more from me at
 [www.stephaniekirmer.com](http://www.stephaniekirmer.com) 
 .



### 
 Further Reading



[Seeing Our Reflection in LLMs](https://towardsdatascience.com/seeing-our-reflection-in-llms-7b9505e901fd) 




<https://www.theverge.com/2024/2/21/24079371/google-ai-gemini-generative-inaccurate-historical>




 The project:
 <https://bit.ly/genaiSK>






---



[A Critical Look at AI Image Generation](https://medium.com/towards-data-science/a-critical-look-at-ai-image-generation-45001f410147) 
 was originally published in
 [TDS Archive](https://medium.com/towards-data-science) 
 on Medium, where people are continuing the conversation by highlighting and responding to this story.



