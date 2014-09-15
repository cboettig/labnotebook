---
layout: post
category: computing
tags:
- digitalocean
- docker

---



## Digital Ocean Snapshots

At $0.02 per gig per month, this looks like this is the cheapest way to
make complete backups.

The process is rather manual: we have to `sudo poweroff` the droplet
and then trigger the snapshot (the container will come back online
after that, though we have to restart the services / active docker
containers). We also have to delete old snapshots manually.  Some of
this can be automated from the API. DigitalOcean uses redundant storage
for these (paying $0.01/month/gigabyte to Amazon Glacier), but at the
moment we can't export these images. Snapshots are also handy to deploy
to a larger (but not smaller) droplet.

### Digital Ocean Backups

These backups are an automated, always-online alternative to snapshots
but must me initialized when the droplet is created and cost more (20%
of server cost).

## Manually configuring backups

To have the flexibility to restore individual pieces, to move between
machines, etc we need a different approach.

### Container backups

Docker containers, including running containers, should be effectively
backed up by either of these approaches to the state we would be in
after a power cycle (e.g. we may need to start stopped containers,
but not rebuild them from scratch).

Nevertheless we may want to back up containers themselves. For many
containers this is trivial (e.g. our ssh container): we can just commit
the running container to an image and save that as a tar archive (or
equivalently, just export the container to a tarball).

If the containers have a `VOLUME` command in their dockerfile or
in their execution however, this is insufficient.  Containers using
volumes (such as `sameersbn/gitlab` and `mattgruter/drone`) need [four
things](http://serverfault.com/questions/576490/docker-volume-backup-and-restore)
to be backed up:

- Dockerfile (or container image, from `save` or `commit`)
- volume
- volume path in container
- name of the container the volume belongs to

A [utility](https://github.com/discordianfish/docker-backup) makes this easier.


### Sparkleshare

Sparkleshare is a git-backed dropbox alterantive.  With binaries for most
major platforms (Windows, Mac, Ubuntu/Linux) it's pretty easy to set up
and acts in much the same way, with automated synch and notifications.
The backend just needs a server running git -- Gitlab is a great way
to set this up to permit relatively easy sharing / user management.
(Ignore the information about setting up separately on a server,
Gitlab is much easier.  Also ignore advice about building from source
on Ubuntu, installing the binary is far more straight forward: `apt-get
install sparkleshare`.  Certainly it is not as feature rich as dropbox
(e.g. email links to add users, web links to share individual files),
but easy sharing over the server at no extra cost.  The Sparkleshare
directory is also a fully functional git repo.

### Encrypted backup of filesystem with duplicity

See [Duplicity setup](https://www.digitalocean.com/community/tutorials/how-to-use-duplicity-with-gpg-to-securely-automate-backups-on-ubuntu)

Good for backing up to another host for which we have ssh access, or to
an Amazon S3 bucket, etc.  (Unclear if this works with Glacier due to
upload-only et-up).

### Some other rates for data storage:

- Compare to S3 ($0.03 /gig/month)
- EBS ($0.12 /gig/month) (really
for computing I/O, not storage).
- Remarkably, Google Drive and
  Dropbox now offer 1 TB at $10 / mo.  Clearly a lot can be saved by
  'overselling' (most users will not use their capacity) and by shared
  files (counting against the space for all users but requiring no more
  storage capacity). Nonetheless, impressive, on par with Glacier (without
  the bandwidth charges or delay).
- For comparison, (non-redundant, non-enterprise, disk-based) storage is roughly $100/TB, or on order of that annual cost.


