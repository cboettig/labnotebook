---
layout: post
tags: [warning-signals, code-tricks]
categories: [ecology]
title: The Ergodicity Question- Time averaging vs Ensemble averaging
---






 








11am -- 3pm

-   Tried time averaging over the entire time window (set sample\_size
    to 1 less than max time); in close agreement with the ensemble
    predictions (getting around 1355).
-   Mystery doesn't seem to actually be a problem in the method, but
    just innate variability! Even over reasonable time-averages and
    ensemble averages there's significant deviation from the expected
    variance! This variation around the warning signal/leading indicator
    is exactly what might frustrate the warning signal. So within a run,
    the observed variance averaged over a given window may fluctuate
    significantly.

![image](http://openwetware.org/images/thumb/c/ca/Falsealarmpng.png/400px-Falsealarmpng.png)

![image](/skins/common/images/magnify-clip.png)

-   Note that variance almost doubles just by chance, and the average
    looks pretty close to the analytic calculation for these parameters
    (1352). This samples every unit time on a window of 149 time units
    (single replicate).
-   Code that produces this found in version 26 (run warning\_signals
    and then plot data with that version of plot.py). **Note:** seed was
    randomized in this compile.
-   Gillespie header file has a flag to turn on random seed!

### Next Steps

-   Parallelization -- restructure my\_pars and record classes.
-   Compute variance in variance (and in other warning signals) across
    ensembles. Shows not just the expected signal, but the collection of
    possible signals. Think about analytic version of this calculation.
-   Update records class for these kinds of ensemble averaging. Ensemble
    Variance in temporal mean with windowsize 1 will then give the
    variance across ensembles alone, rather than calculating separately
    (which I'm currently using the ar1 and arN blocks to compute).

\

### Parallelizing Code

-   Large ensemble averaging can benefit from relatively trivial
    parallelization. Parallelizing other sections of the code will be
    more demanding and less obviously an efficiency boost. I have been
    doing basic parallelization for multicore, shared memory machines
    using OpenMP, allowing me to take advantage of the up to eight cores
    we have on the server (` one`.)
-   Makefile now has a make parallel option to call the compiler with
    the openmp flag, ` -f openmp `
-   My first try added an OpenMP command to the Gillespie code to
    parallelize the for loop over ensembles:

<syntax type="c"\>

1.  pragma omp parallel for default(none) shared(rng, rate\_fn, outcome)
    private(lambda, t, tmp, i, check) firstprivate(rates\_data,
    my\_pars)

for(l = 0; l < ensembles; l++){ </syntax\>

I haven't worked with firstprivate before, but seems necessary for
dynamically allocated private variables. This isn't going to work, as
my\_pars contains information that must be shared (like where the global
data is collected) and private (like the state variables). A successful
parallelization of this algorithm will require being more explicit.
Basically everything in `record` needs to be shared and the rest of
`my_pars` needs to be private...

As the random number generator is called in a different order in
parallel and serial runs I don't think I can compare values simply by
keeping constant seed, but I can compare convergent values.

-   **Will need to separate my parameters data structure into global
    recording data and private state variable data** before the
    Gillespie code can be effectively parallelized. Will need to
    consider checks to prevent user from mismatching these.

*edit on Fri 26th*

-   Anything declared private in openmp must be initialized in the loop
    or declared firstprivate instead. If it's dynamically allocated
    compiler will complain about private but not firstprivate. Making a
    copy of a constant pointer (as in promotions from void pointers)
    lets you change the values of things it points to.

-   Parallel code not very compatible with GSL's creative use of void
    pointers as agnostic ways to pass parameters to functions. Fine for
    shared parameters, creates a problem for private parameters. Using
    restrict declaration might help with this, will need to investigate
    further. Meanwhile, experimental directory has simplified code for
    exploring the parallel error. currently cannot get time series to
    cumulatively sum results from different replicates rather than
    overwrite.

*edits Sun Feb 28*

-   Parallel code works if I can avoid firstprivate. this means
    specifying predetermined size arrays for checkpts and my\_pars
    explicitly. Will have to figure out how to get openmp to work with
    dynamically allocated variables. Time to actually spend some time in
    openmp tutorials...

\

