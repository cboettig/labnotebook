---
layout: post
category: ecology

---




Smoothing post-policy calc?

```r

fig3 <- ggplot(policies, aes(stock, stock - value, color=method)) +
  stat_smooth(lwd=1.2, method="loess", degree=1, span=0.2, level=0, n=50) + 
  facet_wrap(~method) +
  xlab("stock size, x(t)") + 
  ylab("escapement, S(t)")  +
  scale_colour_manual(values=colorkey, guide=FALSE)
fig3

library("dplyr")
s_policies <- select_(ggplot_build(fig3)$data[[1]], "x", "PANEL", "y")
s_policies$PANEL <- mapvalues(s_policies$PANEL, from = 1:6, to = levels(policies$method))
names(s_policies) <- names(policies)

library("tidyr")
opt_policy <- s_policies %>% 
  mutate(harvest = stock - value) %>% 
  select(stock, method, value = harvest) %>%
  spread(method, value) %>%
  select(-stock)
OPT <- as.data.frame(sapply(opt_policy, function(y) sapply(y, function(x) which.min(abs(x-x_grid)))))
```
