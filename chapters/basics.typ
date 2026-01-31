#import "//template.typ": * // Import of all templating content

= Basics

The above is a chapter heading

== This is a section heading

=== This is a subsection heading

==== ... you know what it is

== Newlines and Page-Breaks

You can break \
line anywhere you \
want using "\\" symbol.

Also you can use that symbol to
escape \_all the symbols you want\_,
if you don't want it to be interpreted as markup
or other special symbols.

== Comments and Codeblocks

You can write comments with `//` and `/* comment */`:
// Like this
/* Or even like
this */

```typ
Just in case you didn't read source,
this is how it is written:

// Like this
/* Or even like
this */

By the way, I'm writing it all in a _fenced code block_ with *syntax highlighting*!
```

See also @ch:code for more on listings with code in them.

== Lists and Numbered Lists

- Writing lists in a simple way is great.
- Nothing complex, start your points with `-`
  and this will become a list.
  - Indented lists are created via indentation.

+ Numbered lists start with `+` instead of `-`.
+ There is no alternative markup syntax for lists
+ So just remember `-` and `+`, all other symbols
  wouldn't work in an unintended way.
  + That is a general property of Typst's markup.
  + Unlike Markdown, there is only one way
    to write something with it.

#list[
  [One can also start a list],
  [using the `list` function]
]




== Tables




== Images


=== Scaled Images


=== Two Images Beside Each Other



== Quote

#quote(attribution: [Einstein])[
  Quotes can be great, although there is not much to them in hte grand scheme of things. it is really just an indented paragrapth...
]


