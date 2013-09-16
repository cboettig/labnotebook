---
layout: post
category: computation
tags: 
- code-tricks

---

I'd like to define a class that acts just like a `data.frame`, just like the `data.table` class does, but contains some additional metadata (e.g. the units associated with the columns) and has some additional methods associated with it (e.g. that might do something with those units) while also working with any function that simply knows how to handle `data.frame` objects.  

How might this be done? 


--------------

_I'm not really sure where to start on this, so below is a summary of my attempt so far and some further puzzles I have stumbled across (e.g. is a `data.frame` and S4 object?). This seems to work, but might not be the best way to go about it._
 

--------------

If I understood what the data structure underlying `data.frame` was, I might have a better idea how to extend it.  But I don't know what makes a `data.frame` a `data.frame`, as the exploration below will illustrate:

For instance, it's not clear if I should try writing my extended object as an S3 or an S4 object that inherits `data.frame`.  When is a `data.frame` an S4 object and when is it an S3 object?

    A <- new("data.frame")
    isS4(A) 

returns `TRUE`, suggesting that data.frames are S4 objects and that we might start with: `setClass("myclass", contains="data.frame")`.  However, 

    B <- data.frame(x = rnorm(10))
    isS4(B) 

returns `FALSE`, suggesting that `data.frames` are S3 classes, and perhaps I should consider starting with

  attr(B, "class") <- c("myclass", "data.frame")


It appears that a data.frame is built upon a list, since 

    is.list(data.frame(x = rnorm(10)))

gives `TRUE`.  


Despite `isS4(B)` being `FALSE`, we find that the S4 method `slotNames(B)` gives: 

    > slotNames(B)
    [1] ".Data"     "names"     "row.names" ".S3Class" 

suggesting that `data.frame` is an S4 object, with a (unnamed?) list in `.Data` and nonempty values in `names`, along with the slot ".S3Class" containing the string "data.frame".  

Interestingly: 

- `B@names` returns an error, while `slot(B, "names")` returns `"x"`. (Suggesting `B` is S3, with some `slot` method defined?)  
- `B@.Data` returns an unnamed length-1 list containing a numeric vector with our 10 random values.  (and illustrating a working `@` accessor, suggesting `B` is S4.)

Very confusing.  

----------------

From this exploration, I conclude that I can promote a `list` to a `data.frame` by providing an unnamed list, editing the "class" attribute, and then assigning values to the slots `names` and `row.names`:

    obj <- list(rnorm(10))
    attr(obj, "class") <- "data.frame"
    slot(obj, "names") <- "x"
    slot(obj, "row.names") <- 1:10

And indeed `obj` acts like a proper `data.frame` (at least it prints like one).   

This suggests that I could extend `data.frame` by adding a new slot for my units, like so:

   setClass("myclass", 
            representation(units = "character"), 
            contains="data.frame")

But this does not inherit the slotNames `names`, `row.names`, `.S3Class`.  I try assigning these explicitly,  

    setClass("myclass", 
             representation(units = "character",
                            names = "character",
                            row.names = "integer",
                            .S3Class = "character"),
                            contains = "list")

    obj <- new("myclass", names="x", row.names=1:10, units = "degrees Celsius")
    obj@.Data <- list(rnorm(10))
    obj@.S3Class <- "data.frame"

but this new object is not a `data.frame`.  Finally we add

    attr(obj, "class") <- "data.frame" 

and we have a successful extension that acts like a data frame.  Some weird things of note: It appears that .S3Class needs to be assigned as above with `@`, and not as a named argument in `new` or as part of the `prototype`.


This last step is almost certainly not what we really want to do, since it destroys our new class assigment (`myclass`). We really want the object to have two classes, `myclass` and `data.frame`.  However, if we do `attr(obj, "class") <- c("myclass", "data.frame")`, then the object does not behave as a `data.frame` at all.


One might thing that the solution would be to then define all the S3 methods as copies of those avialable for data.frames, e.g. define `print.myclass <- print.data.frame`.  Unfortunately this doesn't quite work (appears not to get `row.names` and hence prints column headings but not data. Defining the S4 method for `row.names` with `myclass` signature doesn't fix this either...).  






