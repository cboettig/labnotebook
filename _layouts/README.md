
Layouts 
-------


A collection of layouts for various pages in the notebook. 

## Common layouts

* `post` is the standard layout for posts. Provides a span 7, offset 1 column and a span 4 sidebar 
* `page` is the standard layout for pages. Provides a span8, offset 1 single column.
* `project` is the layout for project pages, with a project navbar (hardcoded) (including ../research.md)

## Scaffold layouts

* `default` is the scaffold layout that other layouts are built on, with standard header, footer, javascript and analytics.
* `html5` is the base for `default`, and used in pages that need custom header or footers (such as `search`)



Note: Unlike files from `_includes` added in Liquid, the `.html` does not need to be part of the yaml header
