---
comments: true
date: 2011-09-30 17:51:31
layout: post
slug: friday-wordpress-backups-pmc-edits
title: Friday, wordpress backups, pmc edits
redirects: [/wordpress/archives/2799, /archives/2799]
categories:
- computation
- evolution
tags:
- code-tricks
---

## Wordpress local copy





	
  * configured mysqldump backup, following [dreamhost wiki](http://wiki.dreamhost.com/Mysqldump) (added cron job manually instead of in panel).


edit local wp-config.php to use localhost. Get the database name, user name and password from the lines above it, which are used later.


```php

define('DB_HOST', 'localhost');     // ...and the server MySQL is running on

```


create user: log in as root


```bash

mysql -u root -p

```


and create user


```sql

mysql> create database database_name
mysql> create user 'username'@'localhost' identified by 'password';
mysql> create database database_name
mysql> grant usage on *.* to username@localhost identified by 'password';
mysql> grant all privileges on database_name.* to username@localhost;
mysql> quit

```


yes you need the quotes around the password and the .* appended after database_name. Then can import the most recent dump.


```bash

mysql -u username -p database_name < mysqldump_file.sql

```


Install wordpress, configure. Set from /var/www to backup location, following [any](http://movingtofreedom.org/2007/05/09/how-to-wordpress-on-ubuntu-gnu-linux/) [decent](https://help.ubuntu.com/community/WordPress) tutorial.


## Manuscript edits


power_curve.R still running on farm. Run just the needed analysis. Done, updated data files. Runs much faster on farm then on zero, kinda amazing.
Need these kind of explanatory [figures](http://www.carlboettiger.info/archives/286)? Removed.

Confidence intervals easy to get for each model, harder to squeeze into a nice table though.


```R

 require(pmc)
 data(anoles_model_choice)
 confidenceIntervals.pow(bm_v_ou1)$test -> ou1_ci
 confidenceIntervals.pow(bm_v_ou1)$null -> bm_ci
 confidenceIntervals.pow(ouLP_v_half)$test -> ou15_ci
 confidenceIntervals.pow(ouLP_v_ouLP4)$null -> ou3_ci
 confidenceIntervals.pow(ouLP_v_ouLP4)$test -> ou4_ci

```



## Application statement
