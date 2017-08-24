---
comments: true
date: 2011-11-29 10:13:35
layout: post
slug: tuesday-debugging
title: Tuesday debugging
redirects: [/wordpress/archives/3416, /archives/3416]
categories:
- evolution
---

Wrote seven unit tests to identify source of how/why I can get $ \alpha $'s to be larger in the parrotfish group than wrasses (when only $alpha $ varies across regimes) on the same trait for which $ \sigma $'s are larger (when only they vary). Tests successively restrict pattern into the likelihood equation, some treatment of the regimes must be wrong.

Unit tests.


### Nov 29, 2011





	
  1. ![](https://secure.gravatar.com/avatar/9dc8783d8ff42565db30cc90e29ad01c?s=140&d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png)[also need to double-check calc of lca_matrix -- needs to obey same sc…](https://github.com/cboettig/wrightscape/commit/52a5d0bf129a3fcd89bf20384ac015725c652471) …





[ 52a5d0bf12 ](https://github.com/cboettig/wrightscape/commit/52a5d0bf129a3fcd89bf20384ac015725c652471) [Browse code](https://github.com/cboettig/wrightscape/tree/52a5d0bf129a3fcd89bf20384ac015725c652471)




[cboettig](https://github.com/cboettig) 2011-11-29 17:29:04





	
  2. ![](https://secure.gravatar.com/avatar/9dc8783d8ff42565db30cc90e29ad01c?s=140&d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png)[seems that branchlength times alpha is off somewhere...](https://github.com/cboettig/wrightscape/commit/5e88b3af189e2eba6eb51438c39468fcb0e0ec53)





[ 5e88b3af18 ](https://github.com/cboettig/wrightscape/commit/5e88b3af189e2eba6eb51438c39468fcb0e0ec53) [Browse code](https://github.com/cboettig/wrightscape/tree/5e88b3af189e2eba6eb51438c39468fcb0e0ec53)




[cboettig](https://github.com/cboettig) authored 2011-11-29 17:27:26





	
  3. ![](https://secure.gravatar.com/avatar/9dc8783d8ff42565db30cc90e29ad01c?s=140&d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png)[docs for data](https://github.com/cboettig/wrightscape/commit/fc852d023de41380f2ab56fbddfa93731ed4765c)





[ fc852d023d ](https://github.com/cboettig/wrightscape/commit/fc852d023de41380f2ab56fbddfa93731ed4765c) [Browse code](https://github.com/cboettig/wrightscape/tree/fc852d023de41380f2ab56fbddfa93731ed4765c)




[cboettig](https://github.com/cboettig) authored 2011-11-29 15:23:54





	
  4. ![](https://secure.gravatar.com/avatar/9dc8783d8ff42565db30cc90e29ad01c?s=140&d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png)[unit_test5, lambda parameter illustrates the problem](https://github.com/cboettig/wrightscape/commit/3da057ba8d84717bd5e2b0a33b84aaacfaf96306)





[ 3da057ba8d ](https://github.com/cboettig/wrightscape/commit/3da057ba8d84717bd5e2b0a33b84aaacfaf96306) [Browse code](https://github.com/cboettig/wrightscape/tree/3da057ba8d84717bd5e2b0a33b84aaacfaf96306)




[cboettig](https://github.com/cboettig) authored 2011-11-29 15:22:50





	
  5. ![](https://secure.gravatar.com/avatar/9dc8783d8ff42565db30cc90e29ad01c?s=140&d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png)[added data documentation](https://github.com/cboettig/wrightscape/commit/e6caf07ca584c8fbaf77f78255e16e18be7b2ede)





[ e6caf07ca5 ](https://github.com/cboettig/wrightscape/commit/e6caf07ca584c8fbaf77f78255e16e18be7b2ede) [Browse code](https://github.com/cboettig/wrightscape/tree/e6caf07ca584c8fbaf77f78255e16e18be7b2ede)




[cboettig](https://github.com/cboettig) authored 2011-11-29 14:36:49





	
  6. ![](https://secure.gravatar.com/avatar/9dc8783d8ff42565db30cc90e29ad01c?s=140&d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png)[Merge branch 'master' of github.com:cboettig/wrightscape](https://github.com/cboettig/wrightscape/commit/8f64c98b663566c1c75aabc0306bb5d20737e687)





[ 8f64c98b66 ](https://github.com/cboettig/wrightscape/commit/8f64c98b663566c1c75aabc0306bb5d20737e687) [Browse code](https://github.com/cboettig/wrightscape/tree/8f64c98b663566c1c75aabc0306bb5d20737e687)




[cboettig](https://github.com/cboettig) authored 2011-11-29 14:27:31





	
  7. ![](https://secure.gravatar.com/avatar/9dc8783d8ff42565db30cc90e29ad01c?s=140&d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png)[Merge branch 'master' of github.com:cboettig/wrightscape](https://github.com/cboettig/wrightscape/commit/4c6c546f66f04ea994a7f5a42cb601ee887fac4d)





[ 4c6c546f66 ](https://github.com/cboettig/wrightscape/commit/4c6c546f66f04ea994a7f5a42cb601ee887fac4d) [Browse code](https://github.com/cboettig/wrightscape/tree/4c6c546f66f04ea994a7f5a42cb601ee887fac4d)




[cboettig](https://github.com/cboettig) authored 2011-11-29 14:27:17





	
  8. ![](https://secure.gravatar.com/avatar/9dc8783d8ff42565db30cc90e29ad01c?s=140&d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png)[more unit tets](https://github.com/cboettig/wrightscape/commit/970c765c8d65b3df823da1cbad8dcbbf5f171369)





[ 970c765c8d ](https://github.com/cboettig/wrightscape/commit/970c765c8d65b3df823da1cbad8dcbbf5f171369) [Browse code](https://github.com/cboettig/wrightscape/tree/970c765c8d65b3df823da1cbad8dcbbf5f171369)




[cboettig](https://github.com/cboettig) authored 2011-11-29 14:27:07





	
  9. ![](https://secure.gravatar.com/avatar/9dc8783d8ff42565db30cc90e29ad01c?s=140&d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png)[unit testing](https://github.com/cboettig/wrightscape/commit/52c264222ec15d4732f83e779943727a655967a9)





[ 52c264222e ](https://github.com/cboettig/wrightscape/commit/52c264222ec15d4732f83e779943727a655967a9) [Browse code](https://github.com/cboettig/wrightscape/tree/52c264222ec15d4732f83e779943727a655967a9)




[cboettig](https://github.com/cboettig) authored 2011-11-29 14:26:41





	
  10. ![](https://secure.gravatar.com/avatar/9dc8783d8ff42565db30cc90e29ad01c?s=140&d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png)[unit testing continues](https://github.com/cboettig/wrightscape/commit/03a056f6f43f8cb66304cd14c757d2c1c0d0ea9d)





[ 03a056f6f4 ](https://github.com/cboettig/wrightscape/commit/03a056f6f43f8cb66304cd14c757d2c1c0d0ea9d) [Browse code](https://github.com/cboettig/wrightscape/tree/03a056f6f43f8cb66304cd14c757d2c1c0d0ea9d)




[cboettig](https://github.com/cboettig) authored 2011-11-29 14:26:22





	
  11. ![](https://secure.gravatar.com/avatar/9dc8783d8ff42565db30cc90e29ad01c?s=140&d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png)[Merge branch 'master' of github.com:cboettig/wrightscape](https://github.com/cboettig/wrightscape/commit/2ce29b5d4134753e801e608a317c555ccccd4c66)





[ 2ce29b5d41 ](https://github.com/cboettig/wrightscape/commit/2ce29b5d4134753e801e608a317c555ccccd4c66) [Browse code](https://github.com/cboettig/wrightscape/tree/2ce29b5d4134753e801e608a317c555ccccd4c66)




[cboettig](https://github.com/cboettig) authored 2011-11-29 10:26:01





	
  12. ![](https://secure.gravatar.com/avatar/9dc8783d8ff42565db30cc90e29ad01c?s=140&d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png)[debug unit_test3 working](https://github.com/cboettig/wrightscape/commit/938d5f72453da1bdc5a041172aec8b01d79e5fa9)





[ 938d5f7245 ](https://github.com/cboettig/wrightscape/commit/938d5f72453da1bdc5a041172aec8b01d79e5fa9) [Browse code](https://github.com/cboettig/wrightscape/tree/938d5f72453da1bdc5a041172aec8b01d79e5fa9)




[cboettig](https://github.com/cboettig) authored 2011-11-29 10:25:46





	
  13. [adding more unit tests](https://github.com/cboettig/wrightscape/commit/00147026a2491071b0e8bfbf6631f9f8ec9a11d7)





[ 00147026a2 ](https://github.com/cboettig/wrightscape/commit/00147026a2491071b0e8bfbf6631f9f8ec9a11d7) [Browse code](https://github.com/cboettig/wrightscape/tree/00147026a2491071b0e8bfbf6631f9f8ec9a11d7)




[cboettig](https://github.com/cboettig) authored 2011-11-29 10:24:44





	
  14. ![](https://secure.gravatar.com/avatar/9dc8783d8ff42565db30cc90e29ad01c?s=140&d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png)[debug exploring](https://github.com/cboettig/wrightscape/commit/a1b7a02aaf041b828e4a6dde308efc9b4dad6489)





[ a1b7a02aaf ](https://github.com/cboettig/wrightscape/commit/a1b7a02aaf041b828e4a6dde308efc9b4dad6489) [Browse code](https://github.com/cboettig/wrightscape/tree/a1b7a02aaf041b828e4a6dde308efc9b4dad6489)




[cboettig](https://github.com/cboettig) authored 2011-11-29 09:09:02







Time to check these

Mean 
$$ E(X_t) = \exp \left( - \sum \alpha_i \Delta t_i \right) \left( X_{t_i} + \sum \theta_i \left( e^{\alpha_i t_i}-e^{\alpha_i t_{i-1} } \right) \right) $$

Covariances
$$ \omega = \frac{\sigma^2}{2 \alpha } \left( e^{2\alpha t_i} - e^{2 \alpha t_{i-1}} \right) $$
$$ \langle x_i, x_i \rangle = \omega \exp( \alpha_i t_i - \alpha_j t_j) $$





(Note - dates pulled out of html with vim gsub, note that vim needs the parentheses for grouping to be escaped (backwhacked!)  


```bash
 :%s/<time.*title="$.*$".*time>/\1/g
```

