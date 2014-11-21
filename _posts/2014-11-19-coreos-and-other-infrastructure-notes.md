---
layout: post
category: computing

---


## CoreOS? ##

Security model looks excellent.  Some things not so clear:

- In a single node setup, what happens with updates? Would containers being run directly come down and not go back up automatically? In general, how effective or troublesome is it to run a single, low-demand app on a single node CoreOS rather than, say, an ubuntu image (e.g. just to benefit from the security updates model)? For instance, would an update cause a running app to exit in this scenario? (Say, if the container is launched directly with `docker` and not through `fleet`?) (Documentation merely notes that cluster allocation / fleet algorithm is fastest with between 3 & 9 nodes).  

- If I have a heterogenous cluster with one more powerful compute node, is there a way to direct that certain apps are run on that node and that other apps are not? 

- Looks like one needs a load-balancer to provide a consistent IP for containers that might be running on any node of the cluster?

- [Enabling swap](https://github.com/coreos/docs/issues/52). Works, but is there a way to do this completely in `cloud-config`? 

## Setting up my domain names for DigitalOcean ##


In Dreamhost DNS management: 

- I have my top-level domain registered through Dreamhost, uses dreamhost's nameservers.
- A-level entry for top level domain points to (the new) Github domain IP address
- Have CNAME entries for `www` and `io` pointing to `cboettig.github.io` 

**First step** 

- Add an A-level entry, `server.carlboettiger.info`, pointing to DigitalOcean server IP

Then go over to DigitalOcean panel.

From DigitalOcean DNS management: 

- add new (A level) DNS entry as `server.carlboettiger.info` pointing to DO server IP
- Delete the existing three NS entries `ns1.digitalocean.com` etc.
- Add three new NS entries using `ns1.dreamhost.com` etc

Things should be good to go!




