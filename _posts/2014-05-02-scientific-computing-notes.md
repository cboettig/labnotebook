---
layout: post
category: computation
tags:
- cloud-computing

---

In my experience EC2 is good for some things but not for others.  Consequently having some funding allocated for it would be great, but it would still be necessary to have other resources as well.  I've found EC2 very good for running some reasonably portable analysis where you temporarily want some extra processors or memory.  On the other hand, I've had some frustrations with it as well.  You don't have a persistent development environment unless you explicitly make and maintain a machine image, which means installing any software dependencies from scratch; sometimes a particular nuisance when you aren't familiar with the architecture.  So this adds more overhead on your time relative to administering your own machine, and much more than a university cluster with a human administrator. Obviously the latter is much more costly, but seems to scale well at least where I've seen that in universities.

Costs for maintaining a persistent image (e.g. for a web server), and costs for large data storage on things like S3 still seem a bit high, though actually the Berkeley cloud service listed on it's IST site looks competitive.  EC2 isn't a great option for tasks that require more processors than can be fit with shared memory on a single node, where the architecture of a cluster is better for things that use MPI.  Lastly, I want to think about what environment will be most accessible to my students and postdocs. While surely it's good for them to learn their way around computing environments, at some point the barriers to enter or keep current with some of the cloud platforms in particular become a distraction from the research.


-----

- See Glenn Lockwood on [MPI setup](http://glennklockwood.blogspot.com/2013/04/quick-mpi-cluster-setup-on-amazon-ec2.html) and [MPI benchmarks](http://glennklockwood.blogspot.com/2013/04/mpi-benchmarks-amazon-ec2-cluster.html) on EC2.
