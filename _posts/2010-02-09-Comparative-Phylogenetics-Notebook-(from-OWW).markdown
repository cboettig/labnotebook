---
layout: post
tags: [model-choice, ]
categories: evolution
title:  Meeting with Graham and Peter

---






### Discussion of Model Comparisons

Primary focus of today's discussion was rooted in Sunday's entry

-   On **plotting quirks,** haven't figured out lattice but here's yet
    another [newer plotting engine for
    R](http://had.co.nz "http://had.co.nz")
-   I need to revisit how OUCH computes likelihood ratios and P values.
    Since some parameters are bounded to the positive real line (and may
    be small) the standard chi square isn't correct. I should repeat the
    AIC-style analysis for likelihood ratios, though this is just a
    shift of where I put the zero line. The correct thing to do would be
    to ask what is the probability the observed difference in likelihood
    ratio (or AIC, etc) would have occurred by chance using the
    distributions I have calculated,

![](data:image/png;base64,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)
(click for larger)

-   The approach I am advocating for goes by the name **[Parametric
    Bootstrapping](http://en.wikipedia.org/wiki/Bootstrapping_(statistics)#Parametric_bootstrap "http://en.wikipedia.org/wiki/Bootstrapping_(statistics)#Parametric_bootstrap")**
    (that link isn't that helpful actually, could improve the wiki
    entry). I should implement this as above, comparing to the observed
    differences in the model scores of the real data, rather than the
    measure of slightly greater which I report.
-   Using this approach I can also **evaluate the power** to detect any
    OU model by overlap in distributions. For instance, if the tree is
    the starburst, even strong selection OU will have no power, while on
    another tree it might. This can be done by testing a variety of OU
    models, rather than the one that best fits the data, and will be a
    great way to start quantifying the *information contained in the
    tree* relative to the model choice question. This is a *crucial
    step* before I try more complicated models, giving some measure of
    whether a tree contains enough taxa with enough covariance to tease
    out temporal information accurately.
-   Discussed my concern that the **BM model and OU model aren't really
    embedded,** since the OU model likelihood cannot be computed
    accurately for small α. Of course it works in the limit, but is
    something to be cautious about. It has been suggested that model
    comparison should fit OU alone, and wait and see if α comes out
    small. There are two reasons to be skeptical of this

1.  the star burst tree demonstrates that α and σ aren't independent;
    then the tip variance is
    ![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHIAAAAsCAMAAACOhxzIAAAAM1BMVEX///+7u7taWlro6OggICAsLCwLCwsAAABsbGwUFBR+fn6SkpI6OjoEBASmpqZKSkrR0dFGXhs1AAACkUlEQVRYCb1Y7aKEEBAdo1IU3v9p7xix2rWlvZUfhWWO+TqjBdg0j+jkZubugZwBxululI18q2io7Gbu7oEA8MrfjfIu37n3mbvHmtz5bBMI/hHDCuQGIAyAeQBSdj0OCnEEvyhq99tVThpAKtLvsYYcMAofAwRYKBmJAMbnIJlxwCoGvgz2g6xlEZSWOdV1l6EFQZ9kjaXjFloihmvrxydZdyVz29liX0fUP1s7kbXRhqqhN6iQUkJnGJt7W+sayh5uhR+2K/ZGgaw1mRNHb8BGx81fkJIc2ceemBsdHTkMkU/KZL0QhOkCbnSlOGDwmc3v0fwSW0zWrJtdSE5yZV+6NOmW3z5fD7BRy7w1kbUIG3V4KPCsu1ktVywtuq/CeR4ykbWzVtveCJjESjVqz5tTZt1DSDl2fT24GSA8ElKXQrJQLndffHQEKUJhOAiMJLYvKSFNru9IhDw4gJRLsEcjR5OsUCArDYh18xkKSGmLti6YB7JbK2sUsrL81KlDEl2/2rp0IPrajf0kMrzPQ5a7U/9Udd+DhObwCalOpm1jxb3wgeYkmUPcyyP6XG0Sk0Taak4lKkAcFoc7OshOGxxT4q2iv72YClBbnCrufxHet+15XlTPnH8uOkx4GJabpaJFpPVi/QVdltkxrw0V8vC7FPwTvmCR8arc1YpFLtE/ia9tijFmopYML0fnStptpZSa9Nrc6yJC5Y2/Y0WIIke8W8LWtl4x14WPSsk5LZSUjRT9H2THwbNecZRtzbF/QMbPWKmiPZW5X0kdIDxVq5ib6vrceDeH4D8HRgqh+MupwvAurGkshlgAAYagpRwpiCpU1CSrcdEQ7wSUHqI3gZ5xdjdDlieL9Cwai0K580T/D8XID2RXHklIAAAAAElFTkSuQmCC)
2.  The likelihood calculation may be numerically inaccurate for small α

### Speed of computing probabilities for the Regimes model

-   So I can compute the joint probability for an arbitrary model rather
    quickly using my discretized matrix approach; if I'm given the
    transition matrices along each branch. Unfortunately, I spend all
    the computational time computing these matrices in the first place.
    We discussed several strategies to speed this up.

1.  **Look-up tables.** For instance, rather than calculating
    ![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHEAAAAVCAMAAABGxfGuAAAAM1BMVEX////o6OhsbGwgICAsLCy7u7sUFBR+fn46OjoEBASSkpILCwumpqZaWloAAADR0dFKSkrJZnB0AAAB1UlEQVRIDbVV2XaEIAwNKC7I4v9/bZOwmEFo7bHNy0BuVnLjAPyROL+ZcajvUfIzduzdIkqjJmpQh0qQvqWWaOue7tH39X2tOTEjekwu4TNd/Znzk66iKvZDwCSsByZSfXJT8Ug6g+1uAHqRJpBQP2jFYJW/EYMJQJWm8NcFVITcMkfKaHmGNjpXEt1pre6+wg3aefImzY/S4ykG9HXzhFJQ64PvE4QrWcEtMKOrW9uKClQZOJm4h0CNAaw55onTXQ+td2ugoA6TX+KzYHzKqBRo9EGv/PYXXqCLgfKx2AndsFVuU2KjMRbSzala15k2Q5WBxYEKjCmj8RCjJj4sgoUyOxlXObFPa2FXQDlvGS8oMxDKJqK158nTPtuosVaXe+bgAeJtRAxYtLLabnYlLtwzVigzUIlFYJrz3AKo2diPDAtuDorSExFECg0YHyO9xy1jhbAT5ud6hW1oJl6U4/PdLGhPjBYiK1u3qTNIMi4MVGJ9y1KKYO1R7TQrblZAyOjnoq9O6GPzk2z4bVI8rw/L7uZ/WNQLLksVea7K5nBszsvPUQP/wzWkpfuHyKOQOzc4/BcZub3Qb8RstYlZvAj2yFVNq/WCbY+cXhrlP5mXUR67fwEGnAznNsis+gAAAABJRU5ErkJggg==)
    I could use the look-up of
    ![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACIAAAAVCAMAAAAU5szlAAAAM1BMVEX////o6OhsbGwgICAsLCy7u7sUFBR+fn46OjoEBASSkpILCwumpqZaWloAAADR0dFKSkrJZnB0AAAAsklEQVQoFX1RSxaEIAxLiwjKp9z/tNM6LkBfzUqakAQLfKG2HH0+VoIwqJCjIRbaIA0I1ZEo9yelOIokwEXS8HIYPHYtGk9Epy+re2uQo/c+BbUbSS9bRQ4T+fo0E+T8mk+DTTtS0co+OEkcc03isM1nqyKLRdy14JJ7VZky6Dj1tEwXSyWz/mFKz+nkAZRcm7epW9gt5xvHZUHLCx43sr4HlL2FmppCOht/KVTkrdsMDD9ouwPiAhJKMQAAAABJRU5ErkJggg==)
    There's a variety of places this kind of trick can help with. Also,
    judicious use of logs -- never exponentiate when I can multiply, or
    multiply when I can add.
2.  **MCMC approaches.** The general version of this just does MCMC over
    all the internal nodes. The key here is that if I know the values of
    all the internal nodes, the joint probability is just a product of
    all the transitions -- no non-independence. Alternately, I could
    rely on the fact that I can solve this analytically if I were only
    told the regimes of the internal nodes, so I just have to MCMC over
    the handful of possible regimes at each node, and not the traits as
    well. This seems quite promising.
3.  Going from **the generator** -- this could be done for the truly
    nonlinear models, as it completely ignores the ability to get
    analytic solutions. The generator could be raised to the power of
    the branch length. Doing so for the largest branch would allow all
    other branches to be calculated in the process. This will probably
    be slow but easy to implement.

### So what to target next

-   First: the the parametric bootstrap extension and paper.
    -   modification of the code I currently have to do likelihood ratio
        and compare to the true data.
    -   Also add a function to give scores to trees regarding ability to
        distinguish OU and BM models as a measure of the temporal
        information they contain.

-   Lookup tables -- means that giant data structure I wrote for the
    regimes model will be useful, (yay and yikes). More memory and
    probably more time with valgrind debugging, but could be promising.
-   After that I think I'll try MCMC over regimes and possibly the
    generator approach. An effective regimes calculation is probably a
    ways off yet, but plenty of things to try!

