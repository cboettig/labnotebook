---
layout: post
tags: nonparametric-bayes
category: ecology

---


Fixed the sequential updating algorithm (avoids numerical instabilities associated with matrix inversion).  Currently defined as the function recursion:

for the covariance:

```r
C_seq <- function(X, X_prime, i){
    if(i <= 1)
          cov(X, X_prime) - mmult(cov(X,x[i]), cov(x[i], X_prime)) / as.numeric( cov(x[i], x[i]) + sigma_n^2)
            else
                  C_seq(X, X_prime,   i-1) - mmult(C_seq(X,x[i],   i-1), C_seq(x[i], X_prime,   i-1)) / as.numeric( C_seq(x[i], x[i],   i-1)  + sigma_n^2  )
}
```

for the mean:

```r
mu_seq <- function(X, i){
    if(i <= 1)
          cov(x[i], X) * (y[i]-mu[i]) / as.numeric( cov(x[i], x[i]) + sigma_n^2)
            else
                  mu_seq(X, i-1) + C_seq(x[i], X,  i-1) * (y[i]-mu[i]) / as.numeric( C_seq(x[i], x[i], i-1)  + sigma_n^2 )
}
```


Note that this needed a custom matrix multiplication to handle scalar by vector cases:

```r
mmult <- function(x,y){
  if(length(x) == 1){
    x <- as.numeric(x) 
    x * y
  } else if(length(y) == 1){ 
    y <- as.numeric(y)
    x * y
  }  else 
  x %*% y
}
```

And probably needs to be written in C at least to have any hope of scaling. See implementation in [sequential-method](https://github.com/cboettig/nonparametric-bayes/blob/e19802885c6ddf2a30807e6b3addf2b9fa3e2ff0/inst/examples/sequential-method.md)


Match is perfect (jittered to avoid overplotting the lazy way):


![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAfgAAAH4CAMAAACR9g9NAAACplBMVEUAAAAAv8QDAwMEBAQGBgYHBwcICAgJCQkKCgoLCwsMDAwNDQ0PDw8QEBARERESEhITExMVFRUXFxcYGBgaGhobGxscHBwdHR0eHh4fHx8gICAiIiIjIyMkJCQmJiYnJycoKCgqKiorKyssLCwtLS0uLi4vLy8xMTEyMjIzMzM0NDQ1NTU2NjY3Nzc4ODg5OTk6Ojo7Ozs8PDw9PT0+Pj4/Pz9AQEBBQUFCQkJDQ0NERERFRUVGRkZHR0dISEhJSUlKSkpMTExNTU1OTk5PT09RUVFSUlJTU1NUVFRVVVVWVlZXV1dYWFhbW1tcXFxdXV1eXl5fX19gYGBiYmJjY2NkZGRlZWVmZmZnZ2doaGhra2tsbGxtbW1ubm5vb29wcHBycnJ0dHR1dXV2dnZ3d3d4eHh5eXl8fHx+fn5/f3+AgICBgYGCgoKDg4OFhYWHh4eIiIiJiYmKioqLi4uNjY2Pj4+QkJCRkZGSkpKTk5OUlJSVlZWWlpaXl5eYmJiZmZmampqbm5ucnJydnZ2enp6fn5+goKChoaGioqKjo6OkpKSlpaWmpqanp6epqamqqqqrq6usrKytra2urq6vr6+wsLCxsbGysrKzs7O0tLS1tbW2tra3t7e4uLi5ubm7u7u8vLy9vb2+vr6/v7/AwMDBwcHCwsLDw8PExMTFxcXGxsbHx8fIyMjJycnKysrLy8vMzMzOzs7Pz8/Q0NDR0dHS0tLT09PU1NTV1dXW1tbX19fY2NjZ2dna2trb29vd3d3e3t7f39/h4eHi4uLj4+Pk5OTl5eXm5ubn5+fo6Ojp6enq6urr6+vs7Ozt7e3u7u7v7+/w8PDx8fHy8vLz8/P09PT19fX29vb39/f4dm34+Pj5+fn6+vr7+/v8/Pz9/f3+/v7////0JKDLAAAACXBIWXMAAAsSAAALEgHS3X78AAATX0lEQVR4nO3d/38b913AcRvWUUjLl8KAsA0Y3YDBVka3pE3TtHSjdCNskDXQsm6DNVBgX2i34UADSZPGdRLXmU0LyTJ3S5clc5puaZOMfGnaxW0Wx/GX2PEX2fJX3X/C3VnKR2edTh/dvfXR6e71+iFn3eP2ftz0rE6yfNI1WZTKmuq9A1SfgE9pwKc04FMa8CkN+JQGfEoDPqUBn9KAT2nApzTgUxrwKa1K+KkRT5OTI1qN6m02kZEdN1V5myrGjcuOG5suWVUbYv+qhB/v8zQ+2afVsN5mYxnRcaNTouNGZkTHXZ0tWVUbYv+AB14n4MXGAa8C3lzAA68T8GLjgFcBby7ggdcJeLFxwKuANxfwwOsEvNg44FXAmwt44HUCXmwc8CrgzRUIf+Ss82/uQFv7ZH4N8GLj4gu/2PolF7630zpxML8OeLFx8YXPLb7owh8+Zg225tfFCr6pqSlwM+ADCjzUf9eF7z5nzW6xl0f3799/OuNpbj6j1bTeZtWNa3IK2mx2oZpxFZsRHrdYssqIeD4N+EP2I36nvfxRT0/PG2OeZmbHtMrobTY9V804F15uXMWm5kXHZRZKVhkRz6cBf6HLOhXL53gO9RGqBD+wzcp1t3cUjkKxgq8U8AHxezzwOgEvNg54FfDmAh54nYAXGwe8CnhzAQ+8TsCLjQNeBby5gAdeJ+DFxgGvAt5cwAOvE/Bi44BXAW8u4IHXCXixccCrgDcX8MDrBLzYOOBVwJsLeOB1Al5sHPAq4M0FPPA6AS82DngV8OYCHnidgBcbB7wKeHMBD7xOwIuNA14FvLmAB14n4MXGAa8C3lzAA69TzOCbm5v7stlsmc2AD6ih4W335izwoWpIeIfafqwDH6FGhHesHXMO9RFqbPjggA8IeOB1igU8v84JBDzwOgEvNg54VVh454W9z3M+8AElBd7v1R7wAVULP+xpanpYq1G9zTIz4cYV4JetnpwNN65ME3Oi48bnS1bVhti/pDziOdRXWSLgywR8QMADr1P94Zv1xwEfUKPBuy/egY8e8MDrBLzYOOBVWs/xzTzHS9Rw8FWMAz4g4IHXCXixccCrgDcX8MDrBLzYOOBVwJsrafDZoj/PAh9Q0uCbgdcLeOB1ij08h3rNkgZfHPABAQ+8TsCLjQNeBby5gAdeJ+DFxgGvAt5cjQJf/Ps58AI1CLz70bjr8sBHr1HgecQL1yDwjnzV44APqFHgw4wDPiDggdcJeLFxwKuANxfwwOsEvNg44FXAmwt44HUCXmwc8CopeOf6BX3AB5ZY+CzwgSUR3v1LHvDBJRGeQ71GiYTPB3xAwAOvE/Bi44BXAW+uAPjcgbb2SXs5//jWrUfz64AXGxdf+N5O68RBezn4vFoHvNi4+MIfPmYNttrL89v3dl7LrwNebFx84bvPWbNb7OXFM9bpDnvZuXnz5pcWPOVyC5ItpnycKXSnAPhD9iN+59KPc5vtf4bs/yb7Bz1lpga1uqa32cS06LjxGdFxY7Oi467NlawyIp4vAP5Cl3XKeY7vOW71duTXcagXGxffQ32uu70jM7DNmtrbuvtqfp1x+KzfNWSBj17cf4/3vXow8NEDHnidzD/Hc6ivTbGHjzAO+ICAB14n4MXGAa8C3lzAA68T8GLjgFcBby7ggdcJeLFxwKtqAO/3xl/IccCrYg/v+1Z/yHHAq4APPw54FYd6cyUdXnAc8Crgw48DXgW8uYAHXifgxcYBrwLeXMADrxPwYuOAVwFvLuCB1wl4sXHAqwrwzc19zhcURh0HfEBxhHe/nzBIHvjoAQ+8TqYO9c0c6mtcLOGFxgEfEPDA6wS82DjgVcCbC3jgdQJebBzwKuDNBTzwOjUofDbr+3151Y0DXtU48EGfqAG+csBXDviq7wsO9eZKB7zIOOBVwIcfB7wKeHMBD7xO4/2eJib7tbqqt9n4lOi4sWnRcaMzouNGZktW1YbYv2rhvdfS0L00yYjeZrqXJtEcp3tpEs1xupcm0RwX30uT+MWhXmxcgx3qvXsKfPhxwKuANxfwwOtUc/gKn6GpahzwAcUMvrnSKfXVjAM+IOCB18kAfOCHp6oaB3xAMYPnOd5UcYOXHAd8QMADrxPwYuOAVwFvLuCB1wl4sXHAq4zAh74qOfCqBoT3OcEe+MoBXzngq74vgDdX6uDDjwNeBXz4ccCrgDcX8MDrBLzYOOBVwJsLeOB1qg380glXWeANFhf4ZuCBjzquUKLg9/zU0rLlluJb4YsLfB/wwfDjP15aJgq+EPDF3X+f9R83nf2DG9757R03fu4xm/qC83PLTWtu+syifWvg3hUfeQN4vxoc/rm3T97z120PXfzgR3c0bXrNpnZ/bmna8VzTfvvWZ3934JMfAN6vBoef+fln3/69V++47V3rdtyw4Bzc3Z9b3rZg3fKv9q3VN//Wyl9eAN6nBoe3Hl75q4ufWvWTW9ft+Fn3Wd39uaXp6eeavmnfeujDV5/5Ymh34PXHGYc/2vSo9a3feNeH3/nUErz787+tuG3FZ3P2rb47VtzRIwe/cDkHvH9J/j3+0uobb37l9t7ymwMvNi5W8GsfmV45/4U15TcHXmxcrOB/ZtRaaQ3dWH5z4MXGxQr+fd+04Q/cWn7zpMB7vs06pvC56WXVEP7wLz6w4s9+6TspgS/IxxR+cXxZgS+7o8Fbw8985emgb9YUh/ec6gx83eArJQy/7CR3DvXFmYT/4FJG4Yu++YQXd/WCf/nll491ruoyCl90E3gN+IlV7Zs92/Xviw7vNvReY/DLProKvBb8MpOTG4XgT6wwB+8NeB9452zE6/D9a9dtXLWnZe/G3+z/1B+t/vG1j9+59srGdwf8GqYJ7zzBv/+nP790I3egrX2yaAm86LhQ8J/7T2uXA3/nwrZHreN3f3Gz1dkt8Yh/2em1/IuI3k7rxMGipTx8U5P3NvCV4O95zXrTgf+y9cjdGzbc9/FXLcFDfaHDx6zB1qLl+MjIyNAVT5OZK1qN+q5tsvOsGJ+KMq6ksWnRcddmRceNzpWs8oUfL7g78J/fYrU58I9b//51663tjz1p7d5+8sGo8L9TaOlm9zlrdkvRsv2JJ544sugpl1vUyn8zB15wXOlm8R5nlazyhy9+cdd/15pH1rrwmb9Y+6c/GL7vjjVDA7ceiAh/stDSzUP2I31n0dJp2aE+8AKOgUc/+3/Y58B7VnKorwQvl9+hfvfS4kKXdepg0bIUPpt/57Mifsl9kX/HlOd4T/WDf+2h9evXf+yWpRu57vaOzMC2pWUQfNAFe/3vizIX+QW+XvB/+Okv/MmeDwQ8Zfge6osQy3zdfLlH/LKArxf8DcOTd1lXbteGX/p1Tr3hXu46Az7P8X0+Bwngi8vNLkvSfRn8yu9b7x+Z+oUq4VXX4Zf9B8AbOKVVhl9YVg3hn3rbW//0+x+5OzR8AbzwKUjPfVH56hPAF2f0Vf3F6flnnxwLD58vD3/9iXzYuVn5ejPA1wt+/f9WOLFL9y3bZfCuOfCeYgX/tQ/d/OlvzwnAuy2Dz1a8wBTw9YK3rP6n7vmVh4Xg3bfn3PQuLgV8RPj+fVb+JI29X68WfvqFR97xHin4au+LesBrXejOLf7w6u901cI/9bGfu+2rrwdsnjh4vSscutUJ3tnD6/D/99F1fzU345yDMXDv3Q+vfeZJ6/QG92bXg3/5x/s2vvs7e1rG711z1w+rhV+39XLw5sBXrpbwX/uq1TrknoPx984faF1492bXHbkffsJ+xO9pOb/P2v1Y9Yf6CiUOPv6Heg/88KZ1j2bcczDcUzJs+JMb3Jtd/2K9+YALf+lv/+4T/wC84Lh6PccX3B34/3rFevi/3XMwPrPF2rVq1z9bmze4N7u+4sA/aMP/425r+ybgBcfF4cXdsfesXT/knoNxafWav1l1cfX9mza4N134gVsP7Gk5su7+Te99Eni5cXGA91RyonU1AQ888MHFDj5SwNcL3udcFO99DXzYcbGG9zv7zHtfL04sC/h0wNc24Ot2qM+WnHVYG2L/gI/ti7vaBjzwOgEvNg54FfDmAh54nYAXGwe8CnhzAQ+8TsCLjQNelQ74/LlewKtSAV84vRN4Vb3g9b7QBXhVguArywOvAt5vXMUt3NO5gVfV7Tne5KG+EPCqVLy4KwS8CnhzAQ+8TsCLjQNeBby5gAdeJ+DFxgGvAt5cwAOvE/Bi44BXAW+uauGHPGWmhrQa1dtsclp03MSM6LjxWdFxY3Mlq2pD7F+18Jc9TUxe1mpYb7OxjOi4a9Oi40ZnRMddnS1ZVRti/zjUGznUL7uIrlODHeq9ewq85jifr9MDXgW8uYA386q+9GsUgVclGL404FXAmwt44HUCXmwc8Kq6w/t8IZEKeFXC4Mtc+TQf8Crgg8YFB7yq/vBBn6IDXpUw+OCAVwEffhzwKuDNBTzwOgEvNg54FfDmAh54nYAXGwe8CnhzAQ+8TsCHGOf/JjDwqkTCl/u7D/CqxML7Xa4aeFVi4f02A16VSPi+Mn/oBV6VTPgyAa8C3lzAA68T8GLjgFcBby7ggdcJeLFxwKuANxfwfuN8P0kFvCqp8L5vswKvAl5rnG/Aq4A3F/C8uNMJeLFxwKuANxfwwOsEvNg44FXAmwt44HUCXmxcfOFzB9raJ+3l/ONbtx7NrwNebFx84Xs7rRMH7eXg82od8LrjssFfoRVn+MPHrMFWe3l++97Oa/ay98yZM2+NeJqeGdFqXG+zKdlxmVnRcZNz1YzLw5ffbGK+ZJUpdKcA+O5z1uwWe3nxjHW6w16+sGvXrldnPC0szGg1p7fZvPC4RdFxc1WNy8NXNc4UulM5+BPfOHLIfsTvXLo1tzm/mkO99rhsttxHKZaK76H+Qpd1ynmO7zlu9Xbk1wEvNi6+8Lnu9o7MwDZram/r7qv5dcCLjYsvvF/Ai40DXgW8uYAHXifgxcYBrwLeXMADrxPwYuOAVwFvLuCDxjl/Xstm8xcHBV6VcPjmpWsBA582+D7gC6UP3v0zmxvwqqTDewJeBXz4ccCrgDcX8MDrBLzYOOBVwJsLeFl4+9e/Yb9vpy8NeFXjw+ff8dEZB7wKeHMBD7xOwFfI/XOe1jjgVQmA1x8HvAp4cwEPvE7Ai40DXgW8uYAHXifgxcYBrwLeXMBrjXO/1wT466UFvuJXWFU3zg14VYzhm4EvLj3wHOo9pQXejRd3KuDDjwNeBby5gAdeJ+DLVHRtSuBViYcv/jUfeBXwpQGvamD4LPB+JR4+xDjgVcCbC3jgdQJebFyDwQ97mpoe1mpUb7PMjOi4yVnRcRNzouPG50tW1YbYPx7xVT3is8Uv36ONa7BHvHdP0wavdUIG8FXfF8CbC3gO9TqlHd4n5ysQw4wDXtWA8D4fiAe+6vuiQeGXyQNf9X3RYPDucz2P+KASCe+Q9/EcH1gS4Zvz8GHHAa8C3lzARzjU+3/LEfBV3xeNBR9xHPAq4M0FPPA6AS82DngV8OYCHnidgBcbB7wKeHMBD7xOwIuNA14FvLmAB14n4MXGAa8C3lzAA68T8GLjgFcBby7ggdcJeLFxwKuANxfwwOsEvNg44FXAmwt44HUCXmwc8CrgzQU88DoBLzYOeBXw5gIeeJ2AFxsHvAp4cwEPvE7Ai40DXgW8uQLhj5x1/s0daGufzK8BXmxcfOEXW7/kwvd2WicO5tcBLzYuvvC5xRdd+MPHrMHW/Drgr9dkF2VcfOEt67sufPc5a3aLvTy6f//+0xlPc/MZrab1NhMeN7sgOm7GO86BjzRusWSVEfF85eBPfONIAf6Q/YjfaS9/1NPT88aYp5nZMa0yeptNz8V53NS856YDH2VcZqFklTl2rUf8hS7rFM/xfof6SONifqgf2Gbluts7Ckch4MXGxRm+NODFxgGvAt5cwAOvE/Bi44BXAW8u4IHXCXixccCrgDcX8MDrBLzYOOBVwJsLeOB1Al5sHPAq4M0FPPA6AS82DngV8OaKBn/iFb3/k1f0Njv1A9Fxp4+Jjjt7VHTc+cMlq2pD7F+V8Mv63gtCu7HUS/tEx73aKTru9B7Rca/vFB1XbcBrB7wK+PA1NPyp40K7sdTZl0THvX5EdNybL4qO+4nsg6baosFTwwZ8SgM+pYWHn39869ajlvfj8xGa/5+2bZeKxkarsFOx3Dnpuy5U4eEHn19aFn98PkLnv2X17SgaG63CTsVy56TvulCFhz+/fW/nNcv78fkIXR6yRp8uGhutwk7Fcuek77pQhYe/eMY63WGpj89H7tK2N4rGRquwU7HcOfm7LkQh4d2Pz1tzmy318fko2eNyL7b252+5Y6NV2CmJnbOT3bnrY4T2LlThH/E9x61e5z/b4o/PR+hM16JnbLQKOxXLnZO+60IVHn5qb+vuq8s+Ph+hfS1btz5rj3PHRp7m7lRcd076rgsVv8enNOBTGvApDfiUBnxKSzB82+25hd/bX++9iGsJhs/d3r7lgXrvRGxLMLx1+td+/VK99yG2JRneuvPP670H8S3J8Iff946T9d6H2JZg+Jnf/v6uDy3Wey/iWoLhv/xJa/G2tnrvRVxLMDwFBXxKAz6lAZ/SgE9pwKc04FMa8CkN+JQGfEoDPqX9P48acY/kjnR1AAAAAElFTkSuQmCC) 

Now should rewrite to use a grid for the covariance matrices of each data point.  Memory intensive but should be much faster than function recursion.  


(Should also confirm variance calculation in comparison, and test on larger grid sizes)
