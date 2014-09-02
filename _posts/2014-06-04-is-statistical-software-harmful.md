---
title: "Is statistical software harmful?"
layout: post
category: open-science
tags:
- blog
- R

---

Ben Bolker has an excellent post on this complex issue over [at Dynamic Ecology](http://dynamicecology.wordpress.com/2014/06/04/guest-post-is-statistical-software-harmful), which got me thinking about writing my own thoughts on the topic in reply.


---------

Google recently announced that it will be making it's own self-driving cars, rather than modifying those of others.  [Cars that won't have steering wheels and pedals](http://www.automotive.com/news/1405-google-envisions-self-driving-cars-with-no-steering-wheel/).  Just a button that says "stop."  What does this tell us about the future of user-friendly complex statistical software?

Ben quotes prominent statisticians voicing fears that echo common concerns about self-driving cars:

> Andrew Gelman attributes to Brad Efron the idea that “recommending that scientists use Bayes' theorem is like giving the neighbourhood kids the key to your F-16″.

I think it is particularly interesting and instructive that the quote Gelman attributes to Efron is about a mathematical theorem rather than about software (e.g. Bayes Theorem, not WinBUGS).  Even relatively simple statistical concepts like $p$ values can cause plenty of confusion, statistical package or no. The concerns are not unique to software, so the solutions cannot come through limiting access to software.

I am very wary of the suggestion that we should address concerns of appropriate application by raising barriers to access.  Those arguments have been made about knowledge of all forms, from access to publications, to raw data, to things as basic as education and democratic voting.

There are many good reasons for not creating a statistical software implementation of a new method, but I argue here that fear of misuse just is not one of them.

1) _The barriers created by not having a convenient software implementation are not an appropriate filter to keep out people who can miss-interpret or miss-use the software.  As you know, a fundamentally different skillset is required to program a published algorithm (say, MCMC), than to correctly interpret the statistical consequences._

We must be wary of a different kind of statistical machismo, in which we use the ability to implement a method by one's self as a proxy for interpreting it correctly.

1a) One immediate corollary of (1) is that: _Like it or not, someone is going to build a method that is "easy to use", e.g. remove the programming barriers._

1b) The second corollary is that: _individuals with excellent understanding of the proper interpretation / statistics will frequently make mistakes in the computational implementation._

Both mistakes will happen.  And both are much more formidable problems in the complex methodology of today than when computer was a job description.

So, what do we do?  I think we should abandon the [false dichotomy between "usability" and "correctness."](http://www.r-bloggers.com/what-is-correctness-for-statistical-software/). Just because software that is easy to use is easy to misuse, does not imply that decreasing usability increases correctness. I think that is a dangerous fallacy.

A software implementation should aim first to remove the programming barriers rather than statistical knowledge barriers.  Best practices such as modularity and documentation should make it easy for users and developers to understand and build upon it.  I agree with Ben that software error messages are poor teachers.  I agree that a tool cannot be foolproof, no tool ever has been.

Someone does not misuse a piece of software merely because they do not understand it.  Misuse comes from mistakenly thinking you understand it.  The premise that most researchers will use something they do not understand just because it is easy to use is distasteful.

Kevin Slavin gives [a fantastic Ted talk](http://www.ted.com/talks/kevin_slavin_how_algorithms_shape_our_world) on the ubiquitous role of algorithms in today's world.  His conclusion is neither one of panacea or doom, but rather that we seek to understand and characterize them, learn their strengths and weaknesses like a naturalist studies a new species.

More widespread adoption of software such as BUGS & relatives has indeed increased the amount of misuse and false conclusions.  But it has also dramatically increased awareness of issues ranging from computational aspects peculiar to particular implementations to general understanding and discourse about Bayesian methods.  Like Kevin, I don't think we can escape the algorithms, but  I do think we can learn to understand and live with them.

