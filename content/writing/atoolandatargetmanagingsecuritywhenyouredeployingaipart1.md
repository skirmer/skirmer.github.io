



---
date: 2026-11-16
featured_image: "/images/atoolandatargetmanagingsecuritywhenyouredeployingaipart1/1d49c1925e40.jpg"
tags: ["machine-learning","cybersecurity","ai"]
title: "A Tool and a Target: Managing Security When You’re Deploying AI, Part 1"
summary: "AI is turning into the hottest topic in cybersecurity.CISOs everywhere tell pollsters and interviewers how concerned they are about various ways that AI may be making their organizations more vulnerable and less safe. AI can be the target of attacks…"
disable_share: false
---
    

![](/images/atoolandatargetmanagingsecuritywhenyouredeployingaipart1/1d49c1925e40.jpg)
Photo by
[Ries Bosch](https://unsplash.com/@ries_bosch?utm_source=medium&utm_medium=referral)
on
[Unsplash](https://unsplash.com?utm_source=medium&utm_medium=referral)

AI is turning into the hottest topic in cybersecurity.
[CISOs everywhere tell pollsters and interviewers how concerned they are about various ways that AI may be making their organizations more vulnerable and less safe](https://www.a16z.news/p/the-new-security-agenda)
. AI can be the target of attacks, or it can be a tool to accelerate and enable attackers. It can also just present an opportunity for unintended errors to be introduced, leading to unforeseen risk.

However, LLMs and LLM agent systems are simultaneously becoming more and more integrated into myriad business tasks. Those of us in the machine learning/AI engineering field are being tasked with building these systems for many different use cases across industries.

For example, these can be useful for:

* making internal data or documents easier to find and search
* letting users submit support tickets through a chatbot
* Contract and legal document review support
* Incident triage and response for outages
* Autonomous compliance monitoring
* HR tasks in areas such as onboarding, benefits, and payroll
* Accounting, including reporting, expense management, and reconciliation
* Customer service and customer relationship management (CRM)
* Sales automation and access to customer records
* Business intelligence and analytics
* IT administration and infrastructure management
* Cybersecurity operations, including threat detection and automated remediation

… and the list goes on, and on, and on.

As you might imagine, lots of these tasks mean AI is accessing the most sensitive and valuable business data you have. In our pursuit of business efficiencies, we’re putting a lot of trust in AI applications and tools. The question is: how we should be structuring governance and making development choices, in order to make our AI usage as safe as possible?

In the next two months, I’m going to be sharing some notes about the scenarios organizations need to be watching out for when it comes to security in AI development, deployment, and implementation. For this first part, we’ll be discussing how normally benign agents can be repurposed by bad actors as tools for unsavory activity.

### AI as Tooling

AI is keenly susceptible to being used or hijacked for malicious cybersecurity activities. Kind of like a very friendly guard dog, AI can actually unwittingly but eagerly open the door for people who pose a danger to your organization, so you need to have protections in place ahead of time.

#### Data Access and Knowledge Base Curation

Internal AI tools can help your teams find the data they need to do their work much faster, but recognize that this goes for attackers too. For example, if you are building AI tools internally to help your staff find files and access data swiftly, an internal threat actor looking for ways to collect and exfiltrate data can equally be aided in their efforts by the AI tool, and all they need is a set of compromised credentials to do it. That data could reveal internal architecture, serving a reconnaissance purpose, or it could uncover sensitive data that has monetary value to a hacker.

Managing the data that your AI agents have access to is key to minimizing this kind of risk. Data retrieval with RAG or other similar techniques usually requires data to be summarized and consolidated before it is returned. When Bob asks “What is the history of the Jenkins account?” that might involve multiple documents with varying kinds of information — contracts, call recordings, invoices, internal Slack messages or emails, and so on.

These data elements have different degrees of sensitivity, however. Maybe the internal communications weren’t meant for everyone to see, and if Susan made this request, you would not want that information to be part of the response, but because Bob is a VP, he can see them. You might be getting the picture now that the user permissions are different for every document, so you need to have these specified at the document level.

Make no mistake, determining the correct access permissions for every piece of data available to the model can be deeply challenging. If your LLM accesses five items from your knowledge base in order to produce an answer to a question, you need to ensure that your pre-filtering system will observe the distinct access permissions of each of the five. You can’t just rely on the LLM to differentiate the permissions, through instructions, because it’s too likely to fail. The only way to be sure access is properly protected is by setting the guardrails upstream. If one file is considered more sensitive than the rest, and is beyond the access permissions of the user, the
**LLM must not receive that from the knowledge base**
when that user is asking, or it might use it when consolidating information to return to the user. This is an architectural challenge for designing information retrieval LLM systems that is sometimes overlooked, but is actually very important. It’s tempting to just dump all your files into the knowledge base and let the LLM sort it out, but you are setting yourself up for a serious access breach eventually.

#### Defining Sensitivity

As I’ve already alluded to, you need to know what data should be visible to whom before you can properly defend your information. Some data might become more sensitive in combination with other elements. For example, if the agent has access to staffing schedules for projects and the budgets for those projects, a user might be able to ask the LLM to reverse engineer estimated salaries for the staff members. This highlights the importance of considering carefully each data element and document the LLM will have access to, instead of just dumping an entire wiki or a whole shared drive into the LLM’s knowledge base without curating it. Managing documents well is a real key to solving these kinds of issues. Any documents that your agent accesses should be stored alongside the relevant metadata, which makes clear what the document’s sensitivity is and what access different users should be given.

As mentioned above, external attackers can access data via AI to use for reconnaissance, as well. Documents and data that might not be particularly sensitive for internal users could be extremely effective ways for the attacker to get familiar with the system and its structure, making the attack faster and potentially more damaging.

#### Excess Permission

Now, assuming you’ve got your data catalogued and curated, we need to consider the user permissions. Envision a user who doesn’t have access to the most sensitive data, on purpose. We’ve already discussed how they could get information that is outside their access from an AI agent, but there’s also a risk around actions. For example, if Bob reaches out to the internal IT agent that has the capability to take system or network actions, and asks for permissions to be changed on a particular file, he (or an attacker pretending to be Bob) could extend their access beyond what you intended. Similarly, changing user permissions is a routine part of IT responsibilities, but you know that this capability should be limited to a very small set of administrators.

It may be tempting to let your agent help with such tasks, to take work off the plate of your system administrators, but significant protection has to be involved from day one. Just like with data access, agentic actions need to have permissions checks built in, so the agent doesn’t do something the user wouldn’t be empowered to do themselves. An agent might have permission to execute scripts, interact with APIs, or manage deployment pipelines, and those capabilities could provide indirect access to systems that the user couldn’t otherwise reach.

To mitigate this, ideally you don’t want to just trust the agent to behave according to instructions, but have firmer guard rails. When a user with read only permissions uses the agent, tools and skills that involve writing data should be disabled. Don’t just trust the agent to not call those capabilities because the instructions say so, but take the opportunity (perhaps temptation) away. Beyond that, there are some actions that you will decide are just too dangerous to be left to any agent, and human review must be required. Deciding where that line is depends on your business and your risk tolerance, but you need to make that decision and implement the guardrails accordingly.

There are also some very good
[architectural techniques for the design of your LLM agents](https://arxiv.org/html/2506.08837v3)
that can be helpful in reducing risk, and this reinforces the importance of having security as a first class consideration in the development process.

#### Prompt Injection/Agent Manipulation

Even the most well-prompted and tuned LLM has some capacity to be manipulated. In fact, attempting to manipulate model behavior by providing malicious instructions in prompting is a well established technique for attacking deployed LLMs and agents. Prompt injection, where instructions are passed in an obfuscated way that is hard for humans to detect or interpret, but is very easy for LLMs to understand, can lead to assorted kinds of LLM behavior that you would not expect.

Even when the user doesn’t mean to do anything wrong, or an attacker can’t directly access your agent, an unwitting user can pass doctored data or a fraudulent document to an AI agent without careful vetting, and that object could contain malicious instructions the LLM would act upon.

If models are not carefully structured and heavily tested, models are at high risk of releasing sensitive data and/or taking inappropriate actions. This again is why I encourage you to make permissions upstream settings, instead of just relying on your agent to make the right decisions. Take manipulative actions off the table wherever possible, so that even if your agent is confused or fooled, it can’t do major harm.

You can reduce this kind of risk by making your agent’s workflow for ingesting documents and data very cautious. New files and data should be viewed as insecure until proven otherwise, and scanning/checking uploaded materials is important. You should also perform testing on your own, essentially red-teaming your agent. Try to find the boundaries where the agent performance degrades, especially lengthy exchanges where the prompt instructions can be overwhelmed by the volumes of conversation material.

#### Introducing Vulnerability

Finally, a brief note: AI is an integral part of software development work today, and your dev teams are certainly employing it in their daily workflows. However, sloppy AI development practices can lead to vulnerabilities or security flaws being introduced into your codebases without anyone’s knowledge, and without any malicious intention. This can take the form of AI generated code containing unexpected security flaws, configuration or infrastructure setup mistakes, or the speed of development resulting in insufficient testing, among other things. While this isn’t exactly a case of AI being used as a tool for malicious intentions, it’s adjacent and worth keeping in mind. Ensure that code being produced with AI tools is tested and validated thoroughly to make sure security vulnerabilities are not being introduced by accident.

Next month, I will continue on by discussing ways that AI can become a target of bad actors in cybersecurity, and how we can protect systems and prepare ourselves to respond in the case of disaster.

Read more of my work at
[www.stephaniekirmer.com](http://www.stephaniekirmer.com)
.

### Further Reading

<https://www.a16z.news/p/the-new-security-agenda>

An example of prompt injection manipulating tool selection:
<https://arxiv.org/abs/2504.19793>

* [Ignore Previous Prompt: Attack Techniques For Language Models](https://arxiv.org/abs/2211.09527)
* [Design Patterns for Securing LLM Agentsagainst Prompt Injections](https://arxiv.org/html/2506.08837v3)
* [Bypassing LLM Guardrails: An Empirical Analysis of Evasion Attacks against Prompt Injection and Jailbreak Detection Systems](https://aclanthology.org/2025.llmsec-1.8/)

![](/images/atoolandatargetmanagingsecuritywhenyouredeployingaipart1/a188f8ef3531.jpg)
