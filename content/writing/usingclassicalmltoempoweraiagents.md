



---
date: 2026-07-15
featured_image: "/images/usingclassicalmltoempoweraiagents/d0fe3fdc75f5.jpg"
tags: ["artificial-intelligence","machine-learning"]
title: "Using Classical ML to Empower AI Agents"
summary: "When people ask me what I’m doing these days at work, I feel like they are sometimes surprised when I say “building CatBoost classifiers” or “fitting isolation forests”. But this is in fact what I spend a good chunk of…"
disable_share: false
---
    

![](/images/usingclassicalmltoempoweraiagents/d0fe3fdc75f5.jpg)
Photo by
[Maik Winnecke](https://unsplash.com/@maik_wi?utm_source=medium&utm_medium=referral)
on
[Unsplash](https://unsplash.com?utm_source=medium&utm_medium=referral)

When people ask me what I’m doing these days at work, I feel like they are sometimes surprised when I say “building CatBoost classifiers” or “fitting isolation forests”. But this is in fact what I spend a good chunk of my time doing. My company’s product is a sophisticated agentic AI platform, but I don’t do much prompt engineering in my day to day.

If you had asked me a year or two ago, I would have been seriously concerned about the future of classical ML work in the machine learning field, because we were getting so deep in a paradigm of using LLMs to handle things, whether they did a good job or not. However, it turns out that
[agentic AI needs classical ML much more than we probably thought](https://arxiv.org/pdf/2602.14295)
.

For a quick recap in case readers are unfamiliar:

* An AI Agent means combining LLMs and other software tooling together to create workflows with minimal or no human intervention -
  [orchestration of any number of models or tools](https://towardsdatascience.com/ai-agents-explained-what-is-a-react-loop-and-how-does-it-work/)
  .
* The LLM is usually the interface between human users and all the other software tools, including tasks like translating human prompts to computer language. The LLM also interprets tool outputs and chooses which tools to call at appropriate moments.
* This enables much more functionality than an LLM by itself, because as I’ve talked about here many times, an LLM is just a token generating model, predicting the next word or phrase in a passage based on its context
* Aside from autonomous agents, combining an LLM interface with other tools is required to do a huge number of the things we think colloquially of LLM chatbots doing. ChatGPT, Gemini, and Claude do this kind of thing, chaining together the LLM interface with things like data retrieval, web search, mathematics calculators, etc.

As you can see, a key aspect of the whole agentic AI ecosystem is tooling — your agent needs to have access to tools in order to effectively complete tasks outside of the core LLM functions.

These tools can take all kinds of forms- a lot of them today in the business setting are data retrieval and organizing tools, graph databases, RAG knowledge bases, query construction and validation, and so on.

### Why Classical ML

However, I want to remind you that classical ML models can also be really valuable tools for your agent. Take it a step further than just calling rudimentary tooling, and give your AI agent models to use! For example, consider an agent designed for real estate analysis. If you want to find out the appropriate market price for a property, give your agent the address. It can use one API retrieval tool to retrieve details about the property, then pass those formatted details to a regression model that generates a price estimate.

Of course, you could theoretically ask the LLM to just estimate the values itself. However, this is questionable and even risky for a number of reasons.

* **Accuracy**
  : An LLM is particularly bad for any task where you need to calculate a meaningful number — it’s guessing, not making an empirical evidence based calculation. A well trained classical ML model is going to be vastly more accurate and trustworthy.
* **Interpretability**
  : You have minimal interpretability and explainability from the LLM guessing. We know that LLMs tend to be a black box, and this severely restricts your ability to assess the path that it took to get to the estimate you received. With a classical ML model you can identify the decisions made to get to your inference, and validate these against your subject matter expertise.
* **Cost**
  : Running an LLM gets expensive very fast (see my articles from the last several months about token costs). If you have a lot of cases to run on, the token prices will become meaningful quickly. Running a classifier or a regression model is incredibly lightweight and cheap, even at high volumes. Additionally, in an LLM you don’t control the cost of each call, and token usage and spend can increase — we’re seeing that across the tech industry already.
* **Precision**
  : You don’t control the training or tuning of the LLM (unless you’re fine tuning a foundation model). You might trust the generic LLM to do the job, but you’re taking a big risk, and as mentioned above, validating the work is exceedingly difficult. On the other side, fine tuning a foundation model could be effective, but it requires much more data and more specialized skill than just training a regression or a classifier, while still leaving you with interpretability problems.
* **Control of your data**
  : Your data may be leaving your controlled environment and being accessed by a third party LLM model provider, which can create risk.
* **Control of infrastructure**
  : With an LLM, you don’t have any authority over infrastructure management, so third party downtime creates risk to your business.

Of course, constructing a classical model does require different skills than just setting an LLM on a task. You need to understand your data well, be prepared to complete feature engineering with subject matter expertise, and you need to have sufficient compute and data to train the model. If you have no labeled data, you’ll be limited to unsupervised learning or perhaps bootstrapping your own labels. Fortunately, there’s a wealth of content out there about how to build these models, as well as how to evaluate them rigorously and monitor after deployment.

### Hooking up your model to your agent

You might be convinced to give this a try, but before you start, there are a few architectural choices to consider as well. How will your model and your agent interact?

### Direct Calls

Perhaps the quickest way to get running is just by letting the agent have the model as a tool to call directly. This is the form of my real estate research tool example:
[the agent can hit a model for just in time inference based on a prompt](https://towardsdatascience.com/tool-calling-explained-how-ai-agents-decide-what-to-do-next/)
. To set this up, your AI agent must be equipped to format its requests to the classical model correctly. Your agent must understand what this model is for, when to call it and when to use something else. This means clearly documenting the model’s purpose and capabilities, but if you’re already building agentic AI this is a familiar task.

On the output, your model response needs to be structured in such a way that the AI agent can process it effectively. Simply returning a numeric result may not do the job, because the agent will need contextual information to interpret it and make the best use of it. For my models, I often use f-strings to construct text descriptions as part of the inference, indicating, for example, what the most important features from the model were, what the probability of the result is, and so on. Just returning a probability limits the ability of your agent to interpret the output and produce a helpful response for the end user.

### Database Access

Another option is to make the model not a direct tool of the agent, but a provider of context data. You can pre-calculate the inferences by running your classical ML model as a scheduled job, and store these inferences in whatever data storage solution your agent has access to. Instead of the agent making an initial inference call directly to a model API, it’s writing a query and passing it to your database.

If you have a finite set of cases that you could potentially need the inference completed for, this can be a good solution. For example, if you have 500 individuals in your database, and your agent is meant to retrieve financial health information about them, you could use a credit scoring model and pre-calculate their creditworthiness for the agent to retrieve at runtime along with any other data it collects. Depending on your model infrastructure, this may reduce latency and repetition, by effectively caching results.

This approach creates different requirements for the call and retrieval than direct tool calling. If you’re pre-calculating the inferences and just making those available to your agent via database, your agent will need to know that these results exist. If it’s unaware of the table or the content being available, it won’t use them when appropriate. You might already have the infrastructure for telling the agent what the database contains in your prompt engineering, if your agent is calling to the database for other information, so reusing that can save you from duplicating efforts. If not, your agent may need specific tools that it can use to review the database metadata.

On the results format side, requirements are similar to the direct tool access case. Having a text based description of the results is a good choice, because the agent needs to be able to interpret what it retrieves, regardless of the source.

### Conclusion

Classical ML models were the cutting edge capabilities across many different industries for over a decade before LLMs came on the scene, giving people insights into data that they could not have otherwise achieved. This power shouldn’t be discarded, but instead can be combined with the capacities of LLMs. We can take advantage of the LLM’s strengths, converting human language into computer language, stringing together different tool calls, and retrieving results from those tools, and still use classical models within this framework to do the work for which an LLM is not appropriate.

The barrier to entry is the skill set of creating high quality classical ML models, which is unfortunately not as glamorous as some of the AI related work these days. It’s worth the effort, though, because of the advantages: accuracy, precision, interpretability, cost, and control. I recommend that practitioners brush up on their skills with tools like XGBoost, LightGBM, and scikit-learn, to see these results for yourselves.

Read more of my work at
[www.stephaniekirmer.com.](http://www.stephaniekirmer.com.)

### Further Reading

<https://arxiv.org/pdf/2602.14295>

<https://github.com/Tejas-TA/predikit>

<https://arxiv.org/pdf/2506.20430>

* [Python Package Introduction - xgboost 3.3.0 documentation](https://xgboost.readthedocs.io/en/stable/python/python_intro.html)
* [Python-package Introduction - LightGBM 4.6.0.99 documentation](https://lightgbm.readthedocs.io/en/latest/Python-Intro.html)
* [Tutorials |](https://catboost.ai/docs/en/concepts/tutorials)
* [Getting Started](https://scikit-learn.org/stable/getting_started.html)
* [Learn Intermediate Machine Learning Tutorials](https://www.kaggle.com/learn/intermediate-machine-learning)

<https://towardsdatascience.com/tool-calling-explained-how-ai-agents-decide-what-to-do-next/>

<https://towardsdatascience.com/ai-agents-explained-what-is-a-react-loop-and-how-does-it-work/>

![](/images/usingclassicalmltoempoweraiagents/45a75080e349.jpg)
