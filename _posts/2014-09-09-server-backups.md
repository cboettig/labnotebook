---
layout: post
published: false

---



## Digital Ocean Snapshots

At $0.02 per gig per month, this looks like this is the cheapest way to make complete backups.

The process is rather manual: we have to `sudo poweroff` the droplet and then trigger the snapshot (the container will come back online after that, though we have to restart the services / active docker containers). We also have to delete old snapshots manually.  Some of this can be automated from the API. DigitalOcean uses redundant storage for these (paying $0.01/month/gigabyte to Amazon Glacier), but at the moment we can't export these images. Snapshots are also handy to deploy to a larger (but not smaller) droplet.

### Digital Ocean Backups

These backups are an automated, always-online alternative to snapshots but must me initialized when the droplet is created and cost more (20% of server cost).

## Manually configuring backups

To have the flexibility to restore individual pieces, to move between machines, etc we need a different approach.

### Container backups

Docker containers, including running containers, should be effectively backed up by either of these approaches to the state we would be in after a power cycle (e.g. we may need to start stopped containers, but not rebuild them from scratch).

Nevertheless we may want to back up containers themselves. For many containers this is trivial (e.g. our ssh container): we can just commit the running container to an image and save that as a tar archive (or equivalently, just export the container to a tarball).

If the containers have a `VOLUME` command in their dockerfile or in their execution however, this is insufficient.  Containers using volumes (such as `sameersbn/gitlab` and `mattgruter/drone`) need [four things](http://serverfault.com/questions/576490/docker-volume-backup-and-restore) to be backed up:

- Dockerfile (or container image, from `save` or `commit`)
- volume
- volume path in container
- name of the container the volume belongs to

A [utility](https://github.com/discordianfish/docker-backup) makes this easier.


### Encrypted backup of filesystem with duplicity



- Compare to S3 ($0.03 /gig/month)
- EBS ($0.12 /gig/month) (really for computing I/O, not storage).



