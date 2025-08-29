



---
date: 2025-07-30
featured_image: "https://cdn-images-1.medium.com/max/1024/0*S_bWLoVkylYEiDyp"
tags: ["ai","mental-health"]
title: "LLMs and Mental Health"
disable_share: false
---
      


Are LLMs good or bad for our mental health? It’s more complicated than that.

Readers who are paying close attention to the media coverage of AI, particularly LLMs, will probably have heard about a few cases and trends around how people’s mental health can be affected by use or overuse of such technologies. In fact, the field of mental and behavioral health is rapidly exploring the ways that LLMs might be both useful and dangerous, in the mental health of the general population and in the diagnostic and treatment space.

This is a complex space, and there’s a ton of research on the topic, so today I’m bringing a bit of an overview of some major issues, and I’ll point you to other articles that can provide deeper dives into these themes. (I have tried as much as possible to link to articles that are free and available to the public.)

*There is a lot to know about other areas of AI outside LLMs in this space, and for those looking to get a broader scope, I recommend*
[*the NIH review of literature*](https://pmc.ncbi.nlm.nih.gov/articles/PMC12017374/)
*by Cruz-Gonzales et al.*

### Understanding the LLM

Before we begin, I’d like to recap a bit about how LLM chatbots work and what they are doing, in order to contextualize the discussion.

A single Large Language Model chatbot receives a text prompt from the user and produces a response based on probability of word relevance and context. It learns the relationships between words and phrases (as well as grammar, punctuation, etc) in language through the training process, during which it is exposed to enormous volumes of human-produced language, including written texts and transcripts of spoken language. It calculates, based on the text of the prompt it can ingest (which can be quite lengthy, in modern LLMs) what the statistical likelihood is that a word or phrase is the best output, as learned through training. It will usually choose the most statistically likely next text, but sometimes will choose a less probable word or phrase in order to reduce the robotic nature of the language.

In addition, modern LLM chatbots, like some forms of ChatGPT, have access to other models and components. This means that when a prompt is received, an orchestration component might determine which model/s are needed to produce an answer, and these can work in concert. For example, ChatGPT can sometimes do realtime searches of the internet for information if the prompt seems to justify it. Some models also do multi-modal work, so a prompt could result in the orchestrator invoking an image-generating model as well as a text-generating model, returning a generated image and some text to accompany it. This can also work with audio or video generation models. In essence, the prompt is triggering logic to determine which of the available components are relevant to the question, then invoking those and combining their responses to create one single answer.

However, the key to remember is that under the surface, all the language generating models are using the probabilistic method to choose the words of responses, based on the patterns and lessons learned from training text they were exposed to. They do not have checks for accuracy or truth of statements they make, and they have limited guardrails to prevent dangerous statements or interactions, which is very important to recognize.

To add to this, in order for an LLM to be mosthelpful in the mental health space, it needs to be fine tuned, and cannot just be a general purpose LLM like ChatGPT or Claude. So the above technology is our starting point, but much more effort needs to go into ensuring the LLM has exposure to specific literature, and data related to mental health before it can be used in diagnostic or therapeutic work. (
[Lawrence](https://mental.jmir.org/2024/1/e59479/)
) Some papers I mention below study general purpose LLMs while others involve specifically tuned ones, although in commercial LLMs the characteristics of that tuning are opaque and rarely available for researchers. I think it’s realistic to look at both types of model, because general purpose versions are how the general public accesses LLMs most of the time. More highly specific trained LLMs for psychiatric applications are slowly being developed, but creating a high quality and safe tool of this sort takes a lot of time, data, and work.

> In order for an LLM to be most helpful in the mental health space, it needs to be fine tuned, and cannot just be a general purpose LLM like ChatGPT or Claude.

With that framework, let’s talk a little about some of the ways that LLMs may get involved in the mental health space.

### Symptoms and Onset

Psychiatric problems are not rare or unusual. Worldwide, half of us will have some experience of mental health problems during our lives, and at any given moment, one out of eight people is actually dealing with such symptoms. (
[Lawrence](https://mental.jmir.org/2024/1/e59479/)
) However, most data about the occurrence and prevalence of mental illness predates the development of LLMs as a widespread technology.

Recently there have been some media reports about the ways that some people’s mental health may be affected by use of the technology. In some extreme anecdotes, people seem to be developing
[delusional](https://futurism.com/commitment-jail-chatgpt-psychosis)
or
[psychotic](https://futurism.com/chatgpt-mental-health-crises)
[crises](https://www.psychologytoday.com/us/blog/dancing-with-the-devil/202506/how-emotional-manipulation-causes-chatgpt-psychosis)
based on what they talk to the LLM chatbots about. These include things like dangerous conspiracy theories, believing themselves or the chatbot to be God, and paranoia about the people around them. There is also evidence of depression and anxiety being worsened by certain AI usage, particularly when social engagement and human interaction is reduced, with LLM use as a substitute. (
[Obradovich](https://www.nature.com/articles/s44277-024-00010-z)
) This can even escalate to violence, including at least
[one case where a teenager has died by suicide](https://apnews.com/article/chatbot-ai-lawsuit-suicide-teen-artificial-intelligence-9d48adc572100822fdbc3c90d1456bd0)
with toxic encouragement from a chatbot.

One of the more dangerous parts of this is the dynamic interaction between the symptomatic person and the chatbot — this can make it difficult for loved ones or professionals to help the individual, because they have what they perceive to be continuous outside reinforcement of their disordered beliefs and symptoms. LLM use can discourage a person from choosing to get help or seek treatment from reliable sources.

It’s important that we not overstate the risk of this kind of phenomenon, however. It happens, clearly, and this should be taken seriously, but it’s not happening to the vast majority of users. Much scholarship on mental illness suggests that there’s a combination of biochemical and/or genetic predisposition to certain disorders or symptoms that can be exacerbated by environmental stimuli. If, as it seems, LLM usage in may be one of those environmental stimuli, this deserves research and attention. Even if most people will not experience anything like the severe mental health issues we are seeing anecdotally, some will, so that danger needs to be acknowledged.

### Mental Health Care

When it comes to the actual diagnosis and treatment of mental illness, there is a lot of research available surveying the landscape. It’s important to acknowledge that, like with other areas of healthcare, this is a high risk space to apply LLMs or AI, and we need to take great care to minimize the potential for harm before anything is deployed.

There is some urgency to the discussion, though, because lack of access to mental health care is a profound epidemic, particularly in the United States. This is mainly due to shortages of trained providers and high cost of quality care, often not covered sufficiently by what insurance is available. So we have to determine if AI based technologies can help us mitigate this problem of access, while at the same time minimizing risk or hazards to patient care.

### Behind the Scenes

To begin with, an LLM could provide support to psychiatric practitioners without ever interacting directly with a patient. Many doctors of all kinds already use LLMs in this way, analyzing records, getting ‘second opinion’ kind of input, and so on. Mental health is a bit more challenging because diagnosis is more nuanced and subjective, and rarely has a single test or diagnostic that can confirm or disprove a hypothesis. If an LLM is very carefully tuned, it may be possible for it to provide useful assistance to a provider in diagnosing an illness or crafting a treatment plan, but LLMs are well known to make mistakes and generate incorrect information, even when well trained, so this can’t be adopted as a blanket substitute for professional training, experience, and skill. (
[Obradovich](https://www.nature.com/articles/s44277-024-00010-z)
)

There are also real concerns about data privacy and patient confidentiality in the use of LLMs, because the majority of widely used ones are owned and operated by private, for-profit enterprises, and many have very opaque policies around how user data is handled and transmitted. Preventing data provided to LLMs from falling into the wrong hands or being used for unapproved or unethical purposes is a serious challenge for anyone in the healthcare field who may want to use the technology, and is not a solved problem at this point. This applies to all the application possibilities I discuss below, as well as the simple doctor-LLM interactions.

> There are also real concerns about data privacy and patient confidentiality in the use of LLMs, because the majority of widely used ones are owned and operated by private, for-profit enterprises, and many have very opaque policies around how user data is handled and transmitted.

### Patient Interactions

However, if we do want to pursue direct patient-LLM interaction, we should proceed with caution. Effective mental health care depends tremendously on trust and relationship building, and not all patients are going to be willing or able to trust the technology, for often good reasons. Substantial societal backlash against the use of LLMs in many spaces is already evident, and we can expect that some people would not want to engage with an LLM as a substitute for or augmentation of therapy with a person.

Even if a patient does agree to use an LLM, they need to have appropriate information about what the LLM does and how it works, in order to process and understand the information they get from it. We’re still discovering how different individuals feel about talking with LLMs — not just whether they are willing to use them, but whether they can develop trust (and whether such trust is a good idea), how honest they will be, and whether they will be appropriately skeptical of a chatbot’s output. Patients being excessively credulous of a technology like this can be extremely dangerous, especially given the variability of LLM outputs and quality.

However, for those who find LLMs a suitable option, there are a few ways that they could be incorporated into the clinical experience.

#### Diagnosis

Can an LLM make diagnoses at the same or better quality than human therapists? Some research does seem to demonstrate that LLMs can match the performance of human clinicians in very specific, controlled diagnostic tasks, although evidence is limited and studies are not large. When interactions are more open-ended and more ambiguity is introduced, LLMs appear to struggle.

Part of the reason for this is simply LLM capability. When a practitioner is making a diagnosis, there is a tremendous amount of nuance that must be incorporated. While language gives us great insight into someone’s thought processes and condition, there is more information that needs to be accumulated for accurate and effective diagnosis, such as tone of voice, body language, and self care. A multimodal model could incorporate this data, but unfortunately, much research only limits their analysis to the verbal or written diagnostic instruments, and overlooks this detail. I would regard this as a real opportunity for future ML development, if the data to do it can be acquired. Many of the standardized diagnostic surveys used in regular mental health practice in fact contain multiple components of the clinician’s subjective assessment of the patient’s affect, tone, and physical presentation, so excluding these characteristics will limit diagnostic effectiveness.

> While language gives us great insight into someone’s thought processes and condition, there is more information that needs to be accumulated for accurate and effective diagnosis, such as tone of voice, body language, and self care.

Bias is also an important detail to consider. LLMs are trained on a broad pool of content, from all kinds of creators and sources. This content will contain, explicitly or implicitly, the patterns of bias and discrimination that are present in our broader society. As a result, LLMs also return results with bias at times. Clinicians are responsible for minimizing bias in their interactions with patients, in order to help them as much as possible and abide by ethical standards of their professions. If you use a diagnostic tool that outputs information with unsupported prejudices, that needs to be curated and eliminated.

There’s every reason to think that increased capability and further research may make LLMs and multimodal models more helpful in the diagnostic task, though. In particular, a practitioner may find it helpful to incorporate an LLM when identifying the differential diagnosis, trying to consider all possibilities in a particular situation. But this can’t be the entire process, and clinical expertise has to be the primary reliance.

#### Treatment

As I’ve already mentioned, there is an important distinction between an LLM that is one tool as part of a therapeutic plan managed by a qualified professional, and an LLM used as a substitute for professional expertise. This is true in treatment as well as diagnosis. Based on the quality and capabilities of LLMs, and the research I’ve read as part of writing this article, I could not recommend anyone engage with an LLM for therapy without the close monitoring of a professional therapist — the technology is just not ready for such use for several reasons. The
[American Psychiatric Association](https://www.apa.org/practice/artificial-intelligence-mental-health-care)
concurs, and their recommendations for acceptable use of AI in practice specifically do not include any kind of independent application of LLMs.

One particular article by
[Moore et al](https://dl.acm.org/doi/pdf/10.1145/3715275.3732039)
really stands out, because they tested both general purpose LLMs and LLM tools marketed as therapy or counseling/wellness offerings, and found some alarming results. LLMs as substitutes for therapists perform poorly in numerous scenarios, which could create real risks for patients. In particular, severe mental health problems and crises seem to be the cases where an LLM is least successful, potentially because these are less common situations and thus the training data will have less exposure to these circumstances. The same paper’s original study found that many of the most general purpose modern LLMs provide at times horrifyingly inappropriate responses to prompts that indicate clear mental health problems or emergencies, and in fact commercially available LLMs designed and marketed for mental health were even worse. It’s not clear whether these commercial chatbots were actually produced with any care or conscientiousness towards the mental health application, but given the lack of regulation around such tools, have been made available to use anyway. Regardless, LLMs cannot be held responsible for their statements, and cannot be held to an ethical standard in the way human providers can. This should give us all pause about any kind of AI technology being left to its own devices when dealing with people in serious need of help and support.

> LLMs cannot be held responsible for their statements, and cannot be held to an ethical standard in the way human providers can.

There are likely to be particular cases where an LLM can help people — say, reminders about self care behaviors or medications, or encouragement of positive choices — but therapy is actually a very complicated practice, and can take many forms. Different diagnoses and symptoms call for different treatment approaches, and currently evidence is poor for LLMs being able to provide assistance particularly in severe and crisis cases. LLMs have a known tendency to be sycophantic or attempt to agree with or please the user above all other considerations. When a patient uses an LLM chatbot for mental health care, the chatbot needs to be able to disagree with and challenge unhealthy thought patterns or ideas, including delusional thinking. This can be contradictory with the way LLMs are trained using human feedback.

### Clinicians

Given this information, what should mental health care providers do? Well, most professional organizations have advice about how to use or not use AI, and they tend to recommend a conservative approach, limiting the use of LLMs in the patient-facing setting, but encouraging exploration for administrative or data-coordinating tasks. To my mind, this is a reasonable approach at this stage of the technology’s development, and perhaps more importantly, at this stage of our understanding and literacy around AI.

If an LLM technology is part of the treatment plan, this requires the clinician to be equipped to use it effectively and carefully, to prevent damaging information from being passed to the patient. Psychiatric professionals who do want to use it will need to build skills in LLM usage and understand the technology to get optimal outcomes and abide by their ethical responsibilities. The clinician must be prepared to monitor the LLM’s responses to the patient, as guard rails to ensure appropriate practices.

> If an LLM technology is part of the treatment plan, this requires the clinician to be equipped to use it effectively and carefully, to prevent damaging information from being passed to the patient.

Another thing to be aware of is the staleness problem. LLMs have access to quality information in their training corpuses, but as scholarship progresses, some of the information they have may become obsolete or become contraindicated. Practitioners will have to know that this can occur, and monitor to prevent false information or outdated ideas being shared with the patient.

As I noted earlier, there are also serious data privacy, HIPAA, and patient confidentiality considerations when using an LLM in any kind of clinical setting. If you don’t feel equipped to evaluate whether data you give to an LLM is being securely protected, or don’t know how it might be used, this is a red flag.

### Regulation

Finally, I want to talk a bit about regulation of LLMs for mental health uses. AI tools designed for the medical sphere can be HIPAA certified, giving you some confidence that they are safe where data security is concerned, if used correctly. However, in the United States,
[regulation of LLMs marketed as “therapy” is minimal if it exists at all](https://www.apaservices.org/practice/business/technology/artificial-intelligence-chatbots-therapists)
, and this can be very dangerous. Apps are available offering “therapy” from LLMs with zero human oversight, and as
[Moore’s](https://dl.acm.org/doi/pdf/10.1145/3715275.3732039)
research noted, many of them are worse than even general use LLMs at actually meeting the standard of care. It’s important to be extra cautious about the research we trust in this space because many for-profit providers of such chatbots are putting out information supporting their products that may or may not be unbiased.

[States may be starting to develop regulation](https://scholarship.law.tamu.edu/lawreview/vol12/iss2/10/)
, but this is likely to be piecemeal, similar to data privacy regulation in this country. Because there is minimal accountability for these tools, and as I discussed at the beginning of this article, some people may be at risk of developing unhealthy interactions with LLMs at the best of times, I think it’s important that we implement real regulation around LLMs being marketed as mental health solutions. This should include quality of care benchmarks, as well as existing data privacy and HIPAA protections.

### Conclusion

This article has already gotten long, but I want to make clear that this is just scraping the surface of topics and issues where AI/LLMs and mental health may cross paths. Some other areas that readers may want to pursue more include:

* **Provider training and education**
  . Can AI be useful in helping therapists learn their profession and improve their skills, or is the explosion of LLMs in education going to reduce their qualification? (
  [Lawrence](https://mental.jmir.org/2024/1/e59479/)
  )
* **Loneliness and socialization**
  . Some people are finding that LLMs can fill gaps when they have a lack of human connection, but this can be a dangerous path actually reducing people’s social interactions, which is a risk factor for depression and other illnesses. (
  [Obradovich](https://www.nature.com/articles/s44277-024-00010-z)
  )
* **Reducing stigma for patients**
  . While I’ve noted that LLMs do contain the seeds of stigma through training data, is this more or less than actual clinicians? Do some people feel less hesitant and less judged when interacting with a chatbot? (
  [Lawrence](https://mental.jmir.org/2024/1/e59479/)
  )
* **Mental health misinformation**
  . LLMs are used to generate all manner of “AI slop” online, and a significant portion of this falls under the category of harmful misinformation. One study looked specifically at whether AI generated mental health misinformation was a serious hazard. (
  [Nguyen](https://ojs.aaai.org/index.php/ICWSM/article/view/35875/38029)
  )
* **Economic impact**
  . This is somewhat tangential, but economic downturns and financial strains are the kind of stressors that can turn a predisposition to mental health problems into a full blown symptomatic episode. Are we going to see population level mental health deterioration from economic stress created by AI-related job losses? (
  [Obradovich](https://www.nature.com/articles/s44277-024-00010-z)
  )

There are certainly more- I encourage those readers who are interested to take a closer look at the articles I’ve linked above and below.

For machine learning professionals, there are
[significant opportunities](https://pmc.ncbi.nlm.nih.gov/articles/PMC12017374/)
for us to help improve the state of AI where it’s applied to mental health, as the technology right now has severe limitations. However, I want to emphasize that this can’t be technology built in a vacuum. Technology in mental health care (and medicine in general) has to be better, safer, and more tested than many other areas where we use AI today, because the risks and the costs of failure are so very high. The ethical and efficacy concerns I’ve described here all need to be part of the development process for any AI, including LLMs, that we might create for these use cases.

Read more of my work at
[www.stephaniekirmer.com.](http://www.stephaniekirmer.com.)

### Further Reading

* <https://link.springer.com/chapter/10.1007/978-3-031-34960-7_22>
* <https://ojs.aaai.org/index.php/ICWSM/article/view/35875/38029>
* <https://pmc.ncbi.nlm.nih.gov/articles/PMC12017374/>

#### Symptoms

* <https://apnews.com/article/chatbot-ai-lawsuit-suicide-teen-artificial-intelligence-9d48adc572100822fdbc3c90d1456bd0>
* <https://futurism.com/commitment-jail-chatgpt-psychosis>
* <https://futurism.com/chatgpt-mental-health-crises>
* <https://www.psychologytoday.com/us/blog/dancing-with-the-devil/202506/how-emotional-manipulation-causes-chatgpt-psychosis>
* <https://www.rollingstone.com/culture/culture-features/ai-spiritual-delusions-destroying-human-relationships-1235330175/>
* <https://pmc.ncbi.nlm.nih.gov/articles/PMC10690520/>

#### Diagnosis & Treatment

* <https://arxiv.org/abs/2308.01834>
* <https://pmc.ncbi.nlm.nih.gov/articles/PMC7274446/>
* <https://www.counseling.org/resources/research-reports/artificial-intelligence-counseling/assessment-diagnosis>
* Moore et al. “Expressing stigma and inappropriate responses prevents LLMs from safely replacing mental health providers.”
  <https://dl.acm.org/doi/pdf/10.1145/3715275.3732039>
* <https://www.nature.com/articles/s44277-024-00010-z>
* <https://hai.stanford.edu/news/exploring-the-dangers-of-ai-in-mental-health-care>
* <https://mental.jmir.org/2024/1/e59479/>
* <https://arxiv.org/abs/2503.01903>
* <https://mental.jmir.org/2024/1/e58493>

#### Clinical Recommendations/Regulation

* <https://www.apa.org/practice/artificial-intelligence-mental-health-care>
* <https://www.apaservices.org/practice/business/technology/artificial-intelligence-chatbots-therapists>
* <https://www.counseling.org/resources/research-reports/artificial-intelligence-counseling/assessment-diagnosis>
* <https://www.mentalhealthparitypartners.com/2025/07/16/balancing-innovation/>
* <https://scholarship.law.tamu.edu/lawreview/vol12/iss2/10/>


