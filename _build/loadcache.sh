sudo mkdir -p /tmp/cache
sudo chown -R rstudio:rstudio /tmp/cache

if [ -d /tmp/cache ]
	then rsync -a --delete /tmp/cache/ _cache/
fi 

if [ -d /tmp/figures ]
	then rsync -a --delete /tmp/figures/ assets/figures/
fi 
