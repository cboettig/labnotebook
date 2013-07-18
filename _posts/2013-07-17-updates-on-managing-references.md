---

layout: post
categories: open-science
tags:
- site-configuration

---


### Mendeley API for Jekyll

Finally finished off my [Mendeley API for Jekyll](https://github.com/cboettig/labnotebook/blob/7f7137fbdd4ca2eed86765b61561c283b4cd5811/_plugins/jekyll-labnotebook-plugins/mendeley.rb)  (The top uses the Ruby API implementation from Michael Bus, copied here since it is not yet provided as a gem. scroll to the bottom for my plugin code).  The Mendeley API implementation is remarkably clumsy.  For instance, rather than allowing queries to the API that specify a user's folder and a sort-by field, we are forced to first query the folder for a list of IDs and then query document details _on every document in the folder_, after which we can sort locally.  Hence to show recent additions to a folder with 100s of documents requires 100s of API calls, instead of one single call.  Straight-forward to program but incredibly slow and frustrating.  Apparently this might be addressed in an eventual update of the API. 

Meanwhile, at least I know have a reasonably powerful tool to add reading lists by subject area directly from my library rather than pulling from my rather more aggregated group RSS feeds.  Due to the ridiculous number of API calls, the plugin writes out the data in JSON, which provides a nice local database of the publication metadata we can read in from instead.  The plugin will use local JSON file for the data if it exists -- so one must delete the JSON file to trigger an update.  

Currently the plugin lists the `n` most recent papers in a given folder.  Further adaptation might be nice to allow for richer filtering, e.g. by tag,author, etc.  



### Direct access to the local SQL database

Accessing personal Mendeley data from the API is actually quite silly when the data is already available in a local SQLite database.  

Using R to explore and query my local Mendeley sqlite database directly:

Make a copy of the database first

```bash
cp ~/.local/share/data/Mendeley Ltd./Mendeley Desktop/cboettig@gmail.com@www.mendeley.com.sqlite tmp.sqlite
```

Then in R, read in the database and show available tables (see [example tutorial](http://sandymuspratt.blogspot.com/2012/11/r-and-sqlite-part-1.html)):

```{r}
library('sqldf')
db <- dbConnect(SQLite(), dbname="tmp.sqlite")
dbListTables(db)
```

Most metadata for all documents in the library appears in table `Documents`.  `dbListFields` shows the column headers, though alternatively we can just read this information into an R `data.frame` (This makes sense for reasonable size databases; for large databases we will want to query the data via SQL commands directly rather than attempting to load it all into memory).  

```{r}
dbListFields(db, "Documents")
documents <- dbReadTable(db, "Documents")
```

Several useful fields are not included in this data frame. In particular, Author, Tag, Folder and Keywords. Some extra leg-work is needed to add this data.  For instance `DocumentFolders` gives us the map of each article `id` to a folder `id`, and then `Folders` gives the details of that Folder. 

Using the `data.table` package, indexing by `id`, and using join methods would probably be the most efficient way to do this. (example may follow when I get the chance).   



