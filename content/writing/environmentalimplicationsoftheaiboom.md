



---
date: 2024-05-02
featured_image: "https://cdn-images-1.medium.com/max/1024/0*_rbwGnlkJJ3-boc1"
tags: ["environment","artificial-intelligence","machine-learning","editors-pick","energy"]
title: "Environmental Implications of the AI Boom"
disable_share: false
---
      
#### 
 The digital world can’t exist without the natural resources to run it. What are the costs of the tech we’re using to build and run AI?



 There’s a core concept in machine learning that I often tell laypeople about to help clarify the philosophy behind what I do. That concept is the idea that the world changes around every machine learning model, often
 *because* 
 of the model, so the world the model is trying to emulate and predict is always in the past, never the present or the future. The model is, in some ways, predicting the future — that’s how we often think of it — but in many other ways, the model is actually attempting to bring us back to the past.




 I like to talk about this because the philosophy around machine learning helps give us real perspective as machine learning practitioners as well as the users and subjects of machine learning. Regular readers will know I often say that “machine learning is us” — meaning, we produce the data, do the training, and consume and apply the output of models. Models are trying to follow our instructions, using raw materials we have provided to them, and we have immense, nearly complete control over how that happens and what the consequences will be.




 Another aspect of this concept that I find useful is the reminder that models are not isolated in the digital world, but in fact are heavily intertwined with the analog, physical world. After all, if your model isn’t affecting the world around us, that sparks the question of why your model exists in the first place. If we really get down to it, the digital world is only separate from the physical world in a limited, artificial sense, that of how we as users/developers interact with it.




 This last point is what I want to talk about today — how does the physical world shape and inform machine learning, and how does ML/AI in turn affect the physical world? In my last article, I promised that I would talk about how the limitations of resources in the physical world intersect with machine learning and AI, and that’s where we’re going.



### 
 AI Needs the Physical World



 This is probably obvious if you think about it for a moment. There’s a joke that goes around about how we can defeat the sentient robot overlords by just turning them off, or unplugging the computers. But jokes aside, this has a real kernel of truth. Those of us who work in machine learning and AI, and computing generally, have complete dependence for our industry’s existence on natural resources, such as mined metals, electricity, and others. This has some commonalities with a
 [piece I wrote last year about how human labor is required for machine learning to exist](https://towardsdatascience.com/how-human-labor-enables-machine-learning-367feee8bc91) 
 , but today we’re going to go a different direction and talk about two key areas that we ought to appreciate more as vital to our work — mining/manufacturing and energy, mainly in the form of electricity.




 If you go out looking for it, there is an abundance of research and journalism about both of these areas, not only in direct relation to AI, but relating to earlier technological booms such as cryptocurrency, which shares a great deal with AI in terms of its resource usage. I’m going to give a general discussion of each area, with citations for further reading so that you can explore the details and get to the source of the scholarship. It is hard, however, to find research that takes into account the last 18 months’ boom in AI, so I expect that some of this research is underestimating the impact of the new technologies in the generative AI space.



### 
 Mining and Manufacturing



 What goes in to making a GPU chip? We know these chips are instrumental in the development of modern machine learning models, and Nvidia, the largest producer of these chips today, has ridden the crypto boom and AI craze to a place among the most valuable companies in existence. Their stock price went from the $130 a share at the start of 2021 to $877.35 a share in April 2024 as I write this sentence, giving them a reported market capitalization of
 [over $2 trillion.](https://www.marketwatch.com/investing/stock/nvda) 
[In Q3 of 2023, they sold over 500,000 chips, for over $10 billion](https://www.pcgamer.com/nvidia-sells-half-a-million-ai-chips-in-just-three-months-netting-dollar10-billion-plus/) 
 .
 [Estimates put their total 2023 sales of H100s at 1.5 million,](https://finance.yahoo.com/news/nvidia-50-billion-reasons-why-155759405.html?guccounter=1&guce_referrer=aHR0cHM6Ly93d3cuZ29vZ2xlLmNvbS8&guce_referrer_sig=AQAAAD-rp8_k5CKr4n-jT3NU6rog4qWTAOxWof2syroLJ3beWh1PooQlDO72qrqWrFg9RdkQyfpPYpDD2UExTsHZoO_FceXbj3GNXJZeUJnRpylxc6SAzuCzeGhF76HgjbTrRGJ9p9P2vvAr8P6kC1LsKiT-73jhjnUgETkel4cP7osz) 
 and 2024 is easily expected to beat that figure.




 GPU chips involve a number of different
 [specialty raw materials that are somewhat rare and hard to acquire, including tungsten, palladium, cobalt, and tantalum.](http://www.designlife-cycle.com/nvidia-gpu) 
 Other elements might be easier to acquire but have significant health and safety risks, such as mercury and lead. Mining these elements and compounds has significant environmental impacts, including emissions and environmental damage to the areas where mining takes place. Even the best mining operations change the ecosystem in severe ways. This is in addition to the risk of what are called “Conflict Minerals”, or minerals that are mined in situations of human exploitation, child labor, or slavery. (Credit where it is due: Nvidia has been very vocal about avoiding use of such minerals,
 [calling out the Democratic Republic of Congo in particular](https://images.nvidia.com/content/includes/gcr/pdf/nvidia-responsible-minerals-policy.pdf) 
 .)




 In addition, after the raw materials are mined, all of these materials have to be processed extremely carefully to produce the tiny, highly powerful chips that run complex computations. Workers have to take on
 [significant health risks when working with heavy metals](https://www.osha.gov/semiconductors) 
 like
 [lead and mercury](https://www.osha.gov/toxic-metals) 
 , as we know from industrial history over the last 150+ years. Nvidia’s chips are made largely in factories in Taiwan run by a company called Taiwan Semiconductor Manufacturing Company, or TSMC. Because
 [Nvidia doesn’t actually own or run](https://www.designlife-cycle.com/nvidia-gpu) 
 factories, Nvidia is able to bypass criticism about manufacturing conditions or emissions, and data is difficult to come by. The power required to do this manufacturing is also not on Nvidia’s books. As an aside:
 [TSMC has reached the maximum of their capacity and is working on increasing it. In parallel, NVIDIA is planning to begin working with Intel on manufacturing capacity in the coming year.](https://www.tomshardware.com/pc-components/gpus/nvidia-reportedly-selects-intel-foundry-services-for-chip-packaging-production-could-produce-over-300000-h100-gpus-per-month#:~:text=Nvidia%20reportedly%20selects%20Intel%20Foundry,GPUs%20per%20month%20%7C%20Tom's%20Hardware) 




 After a chip is produced, it can have a lifespan of usefulness that can be significant —3–5 years if maintained well — however, Nvidia is constantly producing new, more powerful, more efficient chips (2 million a year is a lot!) so a chip’s lifespan may be limited by obsolescence as well as wear and tear. When a chip is no longer useful, it goes into the pipeline of what is called “
 [e-waste](https://www3.weforum.org/docs/WEF_A_New_Circular_Vision_for_Electronics.pdf) 
 ”. Theoretically, many of the rare metals in a chip ought to have some recycling value, but as you might expect, chip recycling is a very specialized and challenging technological task, and only about 20% of all e-waste gets recycled, including much less complex things like phones and other hardware. The recycling process also requires workers to disassemble equipment, again coming into contact with the heavy metals and other elements that are involved in manufacturing to begin with.




 If a chip is not recycled, on the other hand, it is
 [likely dumped in a landfill or incinerated, leaching those heavy metals into the environment via water, air, or both](https://www.mdpi.com/1660-4601/18/16/8488) 
 . This happens in developing countries, and often directly affects areas where people reside.




 Most research on the carbon footprint of machine learning, and its general environmental impact, has been in relation to power consumption, however. So let’s take a look in that direction.



### 
 Electricity



 Once we have the hardware necessary to do the work, the elephant in the room with AI is definitely electricity consumption. Training large language models consumes extraordinary amounts of electricity, but serving and deploying LLMs and other advanced machine learning models is also an electricity sinkhole.




 In the case of training, one research paper suggests that training GPT-3, with 175 billion parameters, runs around
 [1,300 megawatt hours](https://www.theverge.com/24066646/ai-electricity-energy-watts-generative-consumption?source=post_page-----16ed5b6877aa--------------------------------) 
 (MWh) or 1,300,000 KWh of electricity. Contrast this with GPT-4, which uses 1.76
 *trillion* 
 parameters, and where the estimated power consumption of training was between
 [51,772,500 and 62,318,750 KWh of electricity](https://towardsdatascience.com/the-carbon-footprint-of-gpt-4-d6c676eb21ae) 
 . For context, an average American home uses just over 10,000 KWh per year. On the conservative end, then, training GPT-4 once could power almost 5,000 American homes for a year. (This is not considering all the power consumed by preliminary analyses or tests that almost certainly were required to prepare the data and get ready to train.)




 Given that the power usage between GPT-3 and GPT-4 training went up approximately 40x, we have to be concerned about the future electrical consumption involved in next versions of these models, as well as the consumption for training models that generate video, image, or audio content.




 Past the training process, which only needs to happen once in the life of a model, there’s the rapidly growing electricity consumption of inference tasks, namely the cost of every time you ask Chat-GPT a question or try to generate a funny image with an AI tool. This
 [power is absorbed by data centers](https://e360.yale.edu/features/artificial-intelligence-climate-energy-emissions) 
 where the models are running so that they can serve results around the globe. The International Energy Agency
 [predicted that data centers alone would consume 1,000 terawatts in 2026](https://iea.blob.core.windows.net/assets/6b2fd954-2017-408e-bf08-952fdd62118a/Electricity2024-Analysisandforecastto2026.pdf) 
 , roughly the power usage of Japan.




 Major players in the AI industry are clearly aware of the fact that this kind of
 [growth in electricity consumption is unsustainable](https://apple.news/AlpimrKJDSlO3j7WYIsWHfQ) 
 . Estimates are that data centers consume between .5% and 2% of all global electricity usage, and potentially could be
 [25% of US electricity usage by 2030](https://apple.news/Ai_OU0hg3Qv6mebb1mq7cNQ) 
 .




 Electrical infrastructure in the United States is not in good condition — we are trying to add more renewable power to our grid, of course, but we’re deservedly not known as a country that manages our public infrastructure well.
 [Texas residents in particular](https://www.eenews.net/articles/texas-grid-has-gone-3-years-without-a-crisis-will-it-last/) 
 know the fragility of our electrical systems, but across the
 [US climate change in the form of increased extreme weather conditions causes power outages](https://www.cfr.org/backgrounder/how-does-us-power-grid-work) 
 at a growing rate.




 Whether investments in electricity infrastructure have a chance of meeting the skyrocketing demand wrought by AI tools is still to be seen, and since government action is necessary to get there, it’s reasonable to be pessimistic.




 In the meantime, even if we do manage to produce electricity at the necessary rates, until renewable and emission-free sources of electricity are scalable, we’re adding meaningfully to the carbon emissions output of the globe by using these AI tools.
 [At a rough estimate of 0.86 pounds of carbon emissions per KWh of power](https://www.eia.gov/tools/faqs/faq.php?id=74&t=11) 
 , training GPT-4 output over 20,000 metric tons of carbon into the atmosphere. (In contrast, the average American emits 13 metric tons per year.)



### 
 Ok, So What?



 As you might expect, I’m not out here arguing that we should quit doing machine learning because the work consumes natural resources. I think that workers who make our lives possible deserve significant workplace safety precautions and compensation commensurate with the risk, and I think renewable sources of electricity should be a huge priority as we face down preventable, human caused climate change.




 But I talk about all this because knowing how much our work depends upon the physical world, natural resources, and the earth should make us humbler and make us appreciate what we have. When you conduct training or inference, or use Chat-GPT or Dall-E, you are not the endpoint of the process. Your actions have downstream consequences, and it’s important to recognize that and make informed decisions accordingly. You might be renting seconds or hours of use of someone else’s GPU, but that still uses power, and causes wear on that GPU that will eventually need to be disposed of. Part of being ethical world citizens is thinking about your choices and considering your effect on other people.




 In addition, if you are interested in finding out more about the carbon footprint of your own modeling efforts, there’s a tool for that:
 <https://www.green-algorithms.org/>




 Read more of my work at
 [www.stephaniekirmer.com.](http://www.stephaniekirmer.com.) 






---



[Environmental Implications of the AI Boom](https://towardsdatascience.com/environmental-implications-of-the-ai-boom-279300a24184) 
 was originally published in
 [Towards Data Science](https://towardsdatascience.com) 
 on Medium, where people are continuing the conversation by highlighting and responding to this story.



