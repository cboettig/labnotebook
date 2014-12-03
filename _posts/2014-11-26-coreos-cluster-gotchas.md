---
layout: post
category: computing
tags:
- infrastructure
---


Overall impression is that CoreOS is a promising way to easily set up a highly available
cluster (e.g. when most important thing is that a service stays up when a node goes down)
since it can migrate a containerized app to a new machine rather than having to already
have the same app running on all machines.  Either way a load-balancer needs to handle 
the addressing, which is do-able but somewhat tricky.

Less useful in the role of a simple server; as admin on the base system is somewhat more 
limited (e.g. network stats, NFS sharing, etc), and more pointedly I seem to continually
run afoul of stability issues in Fleet when cluster changes size, with no way to recover
without destroying and relaunching the entire cluster.

The most compelling features for me, the automated updating and the 
restarting containers on system reboot, can be replicated rather straight
forwardly on a normal distribution.

Fleet cannot pick a leader in a cluster of size 2 (no majority)
and fails when CoreOS loses a majority.  A cluster of size 3
can replace 1 node, but if 2 nodes fail, the cluster is hosed.  See
[optimal cluster size](https://coreos.com/docs/cluster-management/scaling/etcd-optimal-cluster-size/)
and [etcd/issues/863](https://github.com/coreos/etcd/issues/863#issuecomment-60523183).
Rescaling may assign the new node a new address, and the majority must
approve the new peer.  If there's not a majority available (e.g. cluster
goes from 3 to 1) you're stuck.

In the etcd > 0.5.0 (alpha channel now methinks) some recovery is
possible, see: [etcd/issues/1242](https://github.com/coreos/etcd/issues/1242)


On Amazon, CoreOS provides ability to launch an AWS auto-scaling group
as a CloudFormation configuration, which can set a minimum cluster size
and always restart when a node goes down.  Setting the minumum below
3 results in an invalid cluster (failed etcd connection due to lacking
majority) and needs to be destroyed.  Need to destroy the autoscaling
group, cannot simply remove instances (since they will be regenerated).
Also remember to adjust the security groups to set outside access for
the appropriate service ports.

Persistant URL address is challenging when nodes keep changing.  If one
node is guarenteed to be up, we can have it run the nginx load balancer
to redirect to the other nodes (using toml nginx templates).


----

### CoreOS & Docker part ways? ###

Update: and [now it seems CoreOS isn't happy with Docker and seeks to invent their own runtime](https://coreos.com/blog/rocket/)... time will
tell if it gets critical mass to be viable, but doesn't seem like it is well aligned with my own
use cases of quickly deploying basic services (RStudio, Gitlab, Drone, Docker Registry).

Also, lots of competition/ecosystem for container orchistration alternatives to fleet/CoreOS, though
the use case for many of these isn't entirely clear for my needs.  In particular, see:

- [Amazon's container service](http://aws.amazon.com/ecs/)
- [Google's container service](https://github.com/GoogleCloudPlatform/kubernetes)
- and of course, Docker's own fig.org. 

Again all seem to emphasize more the stable, complex service model in the cloud and aren't really necesary for the portable research software dev model.  
