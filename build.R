library("knitr")
library("methods")
local({
  if (!file.exists('_config.yml')) return()
  x = iconv(readLines('_config.yml', encoding = 'UTF-8'), 'UTF-8')
  x = grep('^markdown:\\s*[a-z]+\\s*$', x, value = TRUE)
})

local({
  # input/output filenames are passed as two additional arguments to Rscript
  a = commandArgs(TRUE)
  d = gsub('^_|[.][a-zA-Z]+$', '', a[1])

	## Default to png since svgs with lots of points can be huge and also choke pandoc
	## Cache in an underscored dir since we never want to commit cache
	## figures in a usable path, though excluded in _config.yml since we embed as data_uris
  knitr::opts_chunk$set(
    fig.path   = sprintf('assets/figures/%s/', d),
    cache.path = sprintf('_cache/%s/', d),
		comment = NA,
	  message = FALSE,
    warning = FALSE,
		dev = 'png'
  )

	## Embed svgs directly -- doesn't work, causes weird knitr errors instead
	## see: https://github.com/yihui/knitr/issues/754#issuecomment-68470335
#	local({
#		hook_plot = knit_hooks$get('plot')
#		knit_hooks$set(plot = function(x, options) {
#			if (!grepl('\\.svg', x)) return(hook_plot(x, options))
#			paste(readLines(x)[-1], collapse = '\n')
#		})
#	})

## Embed any non-svgs directly into HTML as data-uris

	embed = function(x){
			dev = knitr::opts_chunk$get('dev')
			if(!is.null(dev))
				if(dev == 'svg')
					identity(x)
			else  
				image_uri(x)
		}
#	knitr::opts_knit$set(upload.fun = embed)

  knitr::opts_knit$set(base.url = '/')
  knitr::opts_knit$set(width = 70)
  knitr::knit(a[1], a[2], quiet = TRUE, encoding = 'UTF-8', envir = .GlobalEnv)
})
