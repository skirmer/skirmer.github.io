



---
date: 2025-06-02
featured_image: "https://cdn-images-1.medium.com/max/1024/0*3S0yrbeBxFXP0nxS"
tags: ["ai","machine-learning"]
title: "Evaluating LLMs for Inference, or Lessons from Teaching for Machine Learning"
disable_share: false
---
      


It’s like grading papers, but your student is an LLM

I’ve had some interesting opportunities recently to work on the task of evaluating LLM inference performance, and I think it’s a good topic to discuss in a broader context. Thinking about this issue helps us pinpoint the significant challenges to trying to turn LLMs into reliable, trustworthy tools for even small or highly specialized tasks.

### What We’re Trying to Do

In it’s simplest form, the task of evaluating an LLM is actually very familiar to practitioners in the machine learning field — figure out what defines a successful response, and create a way to measure it quantitatively. However, there’s a wide variation in this task when the model is producing a number or a probability, versus when the model is producing a text.

For one thing, the interpretation of the output is significantly easier with a classification or regression task. For classification, your model is producing a probability of the outcome, and you determine the best threshold of that probability to define the difference between “yes” and “no”. Then, you measure things like accuracy, precision, and recall, which are extremely well established and well defined metrics. For regression, the target outcome is a number, so you can quantify the difference between the model’s predicted number and the target, with similarly well established metrics like RMSE or MSE.

But if you supply a prompt, and an LLM returns a passage of text, how do you define whether that returned passage constitutes a success, or measure how close that passage is to the desired result? What ideal are we comparing this result to, and what characteristics make it closer to the “truth”? While there is a general essence of “human text patterns” that it learns and attempts to replicate, that essence is vague and imprecise a lot of the time. In training, the LLM is being given guidance about general attributes and characteristics the responses should have, but there’s a significant amount of wiggle room in what those responses could look like without it being either negative or positive on the outcome’s scoring.

> But if you supply a prompt, and an LLM returns a passage of text, how do you define whether that returned passage constitutes a success?

In classical machine learning, basically anything that changes about the output will take the result either closer to correct or further away. But an LLM can make changes that are neutral to the result’s acceptability to the human user. What does this mean for evaluation? It means we have to create our own standards and methods for defining performance quality.

### What does success look like?

Whether we are tuning LLMs or building applications using out of the box LLM APIs, we need to come to the problem with a clear idea of what separates an acceptable answer from a failure. It’s like mixing machine learning thinking with grading papers. Fortunately, as a former faculty member, I have experience with both to share.

I always approached grading papers with a rubric, to create as much standardization as possible, minimizing bias or arbitrariness I might be bringing to the effort. Before students began the assignment, I’d write a document describing what the key learning objectives were for the assignment, and explaining how I was going to measure whether mastery of these learning objectives was demonstrated. (I would share this with students before they began to write, for transparency.)

So, for a paper that was meant to analyze and critique a scientific research article (a real assignment I gave students in a research literacy course), these were the learning outcomes:

* The student understands the research question and research design the authors used, and knows what they mean.
* The student understands the concept of bias, and can identify how it occurs in an article.
* The student understands what the researchers found, and what outcomes came from the work.
* The student can interpret the facts and use them to develop their own informed opinions of the work.
* The student can write a coherently organized and grammatically correct paper.

Then, for each of these areas, I created four levels of performance that range from 1 (minimal or no demonstration of the skill) to 4 (excellent mastery of the skill). The sum of these points then is the final score.

For example, the four levels for organized and clear writing are:

1. Paper is disorganized and poorly structured. Paper is difficult to understand.
2. Paper has significant structural problems and is unclear at times.
3. Paper is mostly well organized but has points where information is misplaced or difficult to follow.
4. Paper is smoothly organized, very clear, and easy to follow throughout.

This approach is founded in a pedagogical strategy that educators are taught, to start from the desired outcome (student learning) and work backwards to the tasks, assessments, etc that can get you there.

You should be able to create something similar for the problem you are using an LLM to solve, perhaps using the prompt and generic guidelines. If you can’t determine what defines a successful answer, then I strongly suggest you consider whether an LLM is the right choice for this situation. Letting an LLM go into production without rigorous evaluation is exceedingly dangerous, and creates huge liability and risk to you and your organization. (In truth, even with that evaluation, there is still meaningful risk you’re taking on.)

> If you can’t determine what defines a successful answer, then I strongly suggest you consider whether an LLM is the right choice for this situation.

### Ok, but who’s doing the grading?

If you have your evaluation criteria figured out, this may sound great, but let me tell you, even with a rubric, grading papers is arduous and extremely time consuming. I don’t want to spend all my time doing that for an LLM, and I bet you don’t either. The industry standard method for evaluating LLM performance these days is actually using other LLMs, sort of like as teaching assistants. (There’s also some mechanical assessment that we can do, like running spell-check on a student’s paper before you grade, and I discuss that below.)

This is the kind of evaluation I’ve been working on a lot in my day job lately. Using tools like
[DeepEval](https://deepeval.com/)
, we can pass the response from an LLM into a pipeline along with the rubric questions we want to ask (and levels for scoring if desired), structuring evaluation precisely according to the criteria that matter to us. (I personally have had good luck with
[DeepEval’s DAG framework](https://deepeval.com/docs/metrics-dag)
.)

### Things an LLM Can’t Judge

Now, even if we can employ an LLM for evaluation, it’s important to highlight things that the LLM can’t be expected to do or accurately assess, centrally the truthfulness or accuracy of facts. As I’ve been known to say often, LLMs have no framework for telling fact from fiction, they are only capable of understanding language in the abstract. You can ask an LLM if something is true, but you can’t trust the answer. It might accidentally get it right, but it’s equally possible the LLM will confidently tell you the opposite of the truth. Truth is a concept that is not trained into LLMs. So, if it’s crucial for your project that answers be factually accurate, you need to incorporate other tooling to generate the facts, such as RAG using curated, verified documents, but
**never**
rely on an LLM alone for this.

However, if you’ve got a task like document summarization, or something else that’s suitable for an LLM, this should give you a good technique to start your evaluation with.

#### LLMs all the way down

If you’re like me, you may now think “ok, we can have an LLM evaluate how another LLM performs on certain tasks. But how do we know the teaching assistant LLM is any good? Do we need to evaluate that?” And this is a very sensible question —
**yes, you do need to evaluate that**
. My recommendation for this is to create some passages of “ground truth” answers that you have written by hand, yourself, to the specifications of your initial prompt, and create a validation dataset that way.

Just like with any other validation dataset, this needs to be somewhat sizable, and representative of what the model might encounter in the wild, so you can achieve confidence with your testing. It’s important to include different passages with different kinds of errors and mistakes that you are testing for — so, going back to the example above, some passages that are organized and clear, and some that aren’t, so you can be sure your evaluation model can tell the difference.

Fortunately, because in the evaluation pipeline we can assign quantification to the performance, we can test this in a much more traditional way, by running the evaluation and comparing to an answer key. This does mean that you have to spend some significant amount of time creating the validation data, but it’s better than grading all those answers from your production model yourself!

#### Additional Assessing

Besides these kinds of LLM based assessment, I am a big believer in building out additional tests that don’t rely on an LLM. For example, if I’m running prompts that ask an LLM to produce URLs to support its assertions, I know for a fact that LLMs hallucinate URLs all the time! Some percentage of all the URLs it gives me are certain to be fake. One simple strategy to measure this and try to mitigate it is to use regular expressions to scrape URLs from the output, and actually run a request to that URL to see what the response is. This won’t be completely sufficient, because the URL might not contain the desired information, but at least you can differentiate the URLs that are hallucinated from the ones that are real.

#### Other Validation Approaches

Ok, let’s take stock of where we are. We have our first LLM, which I’ll call “task LLM”, and our evaluator LLM, and we’ve created a rubric that the evaluator LLM will use to review the task LLM’s output.

We’ve also created a validation dataset that we can use to confirm that the evaluator LLM performs within acceptable bounds. But, we can actually also use validation data to assess the task LLM’s behavior.

One way of doing that is to get the output from the task LLM and ask the evaluator LLM to compare that output with a validation sample based on the same prompt. If your validation sample is meant to be high quality, ask if the task LLM results are of equal quality, or ask the evaluator LLM to describe the differences between the two (on the criteria you care about).

This can help you learn about flaws in the task LLM’s behavior, which could lead to ideas for prompt improvement, tightening instructions, or other ways to make things work better.

### Ok, I’ve evaluated my LLM

By now, you’ve got a pretty good idea what your LLM performance looks like. What if the task LLM sucks at the task? What if you’re getting terrible responses that don’t meet your criteria at all? Well, you have a few options.

#### Change the model

There are lots of LLMs out there, so go try different ones if you’re concerned about the performance. They are not all the same, and some perform much better on certain tasks than others — the difference can be quite surprising. You might also discover that different agent pipeline tools would be useful as well. (
[Langchain has tons of integrations!](https://python.langchain.com/docs/integrations/providers/)
)

#### Change the prompt

Are you sure you’re giving the model enough information to know what you want from it? Investigate what exactly is being marked wrong by your evaluation LLM, and see if there are common themes. Making your prompt more specific, or adding additional context, or even adding example results, can all help with this kind of issue.

#### Change the problem

Finally, if no matter what you do, the model/s just cannot do the task, then it may be time to reconsider what you’re attempting to do here. Is there some way to split the task into smaller pieces, and implement an agent framework? Meaning, can you run several separate prompts and get the results all together and process them that way?

Also, don’t be afraid to consider that an LLM is simply the wrong tool to solve the problem you are facing. In my opinion, single LLMs are only useful for a relatively narrow set of problems relating to human language, although you can expand this usefulness somewhat by combining them with other applications in agents.

### Continuous monitoring

Once you’ve reached a point where you know how well the model can perform on a task, and that standard is sufficient for your project, you are not done! Don’t fool yourself into thinking you can just set it and forget it. Like with any machine learning model, continuous monitoring and evaluation is absolutely vital. Your evaluation LLM should be deployed alongside your task LLM in order to produce regular metrics about how well the task is being performed, in case something changes in your input data, and to give you visibility into what, if any, unusual and rare mistakes the LLM might make.

### Conclusion

Once we get to the end here, I want to emphasize the point I made earlier — consider whether the LLM is the solution to the problem you’re working on, and make sure you are using only what’s really going to be beneficial. It’s easy to get into a place where you have a hammer and every problem looks like a nail, especially at a moment like this where LLMs and “AI” are everywhere. However, if you actually take the evaluation problem seriously and test your use case, it’s often going to clarify whether the LLM is going to be able to help or not. As I’ve described in other articles, using LLM technology has a massive environmental and social cost, so we all have to consider the tradeoffs that come with using this tool in our work. There are reasonable applications, but we also should remain realistic about the externalities. Good luck!

Read more of my work at
[www.stephaniekirmer.com](http://www.stephaniekirmer.com)

### Further Reading

* [DAG (Deep Acyclic Graph) | DeepEval - The Open-Source LLM Evaluation Framework](https://deepeval.com/docs/metrics-dag)
* [Providers | 🦜️🔗 LangChain](https://python.langchain.com/docs/integrations/providers/)


