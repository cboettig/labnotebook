library("methods")
local({
  if (!file.exists('_config.yml')) return()
  x = iconv(readLines('_config.yml', encoding = 'UTF-8'), 'UTF-8')
  x = grep('^markdown:\\s*[a-z]+\\s*$', x, value = TRUE)
})

# Embed svgs directly into HTML
local({
	hook_plot = knitr::knit_hooks$get('plot')
	knitr::knit_hooks$set(plot = function(x, options) {
		if (!grepl('\\.svg', x)) return(hook_plot(x, options))
		paste(readLines(x)[-1], collapse = '\n')
	})
})

local({
  # input/output filenames are passed as two additional arguments to Rscript
  a = commandArgs(TRUE)
  d = gsub('^_|[.][a-zA-Z]+$', '', a[1])
  knitr::opts_chunk$set(
    fig.path   = sprintf('assets/figures/%s/', d),
    cache.path = sprintf('_cache/%s/', d),
		comment = NA,
	  message = FALSE,
    warning = FALSE
  )

	# Embed non-svgs directly into HTML as data-uris
	knitr::opts_knit$set(upload.fun = if(!is.null(knitr::opts_chunk$get('dev')) && knitr::opts_chunk$get('dev') == 'svg')
																			knitr::opts_knit$get(upload.fun)
																		else 
																			knitr::image_uri) 

  knitr::opts_knit$set(base.url = '/')
  knitr::opts_knit$set(width = 70)
  knitr::knit(a[1], a[2], quiet = TRUE, encoding = 'UTF-8', envir = .GlobalEnv)
})
