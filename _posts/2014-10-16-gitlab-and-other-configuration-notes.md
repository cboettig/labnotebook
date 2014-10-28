---
layout: post
category: computing

---


Updating gitlab setup:

```bash
docker pull sameersbn/redis:latest
docker pull sameersbn/gitlab:7.3.2-1
docker pull sameersbn/postgresql:latest


mkdir -p /opt/gitlab/data
mkdir -p /opt/postgresql/data

docker run --name=postgresql -d \
  -e 'DB_NAME=gitlabhq_production' -e 'DB_USER=gitlab' -e 'DB_PASS=password' \
  -v /opt/postgresql/data:/var/lib/postgresql \
  sameersbn/postgresql:latest
docker run --name=redis -d sameersbn/redis:latest

docker run --name=gitlab -d \
  --link postgresql:postgresql \
  --link redis:redisio \
  -p 10080:80 -p 10022:22 \
  -v /opt/gitlab/data:/home/git/data \
    sameersbn/gitlab:7.3.2-1
```


More consisely, do this with [fig](http://fig.sh)

```yaml
gitlab:
  image: sameersbn/gitlab:7.3.2-1
  links:
   - postgres
   - redis:redisio
  ports:
   - "10080:80"
   - "10022:22"
  volumes:
    - /opt/gitlab/data:/home/git/data
  environment:
    - SMTP_USER=USER@gmail.com
    - SMTP_PASS=PASSWORD

postgres:
  image: postgres:latest
  volumes:
    - /opt/postgresql/data:/var/lib/postgresql
  environment:
    - POSTGRESQL_USER=gitlab
    - POSTGRESQL_PASS=
    - POSTGRESQL_DB=gitlabhq_production
redis:
  image: redis:2.8.9
```

Hmm... memory error using the `fig` approach; doesn't happen when running individual containers as above...


Looks like we have to run the original version if we want to keep our database.  But no go since sql database information is lost:

```bash
docker pull gitlab:7.2.1-1
docker run --name=gitlab -d \
  -p 10080:80 -p 10022:22 \
  -v /opt/gitlab/data:/home/git/data \
    sameersbn/gitlab:7.2.1-1
docker stop gitlab
docker run --rm -it \
  -p 20080:80 -p 20022:22 \
  -v /opt/gitlab/data:/home/git/data \
    sameersbn/gitlab:7.2.1-1 app:rake gitlab:backup:restore
docker restart gitlab
```


## Drone

Ah, Drone now provides their own Dockerfile, which we can grab and build for the latest Drone:

```bash
git clone https://github.com/drone/drone.git
docker build -t drone/drone drone
```

Then we can run, linking volumes appropriately: 

```bash
docker run --name drone -d -p 88:80 \
-v /var/run/docker.sock:/var/run/docker.sock \
-t \
-e DRONE_GITHUB_CLIENT=<clientkey> \
-e DRONE_GITHUB_SECRET=<secretkey> \
drone/drone"
```

Note that this doesn't work with a `drone.toml` file even when linking volumes etc., see [#580](https://github.com/drone/drone/issues/580). 

Also note that this setup shares docker images with the host machine, rather than having a seperate library, which is rather good for saving space.  I believe this should be trivial to back-up (just by exporting the container), but have to test that stil.


These rather verbose docker calls for drone and gitlab make a great use-case for fig.  Unfortunately, fig seems to crash out of memory on my tiny DO droplet, but running these commands manually works like a charm.  


## DigitalOcean

Ooh: configure scripts for starting DO droplets.  e.g. automate the launch of [a more secure configuration](https://www.digitalocean.com/community/tutorials/how-to-use-cloud-config-for-your-initial-server-setup), looks like a more formal way than my shell script. /ht @hadley.

