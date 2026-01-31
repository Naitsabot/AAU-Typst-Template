#import "//template.typ": * // Import of all templating content

= Pointing at Stuff <ch:ref>

Pointing at stuff might seem rude, but it is a very useful thing to do when referencing anything in written form. In a document, one can make links to somewhere on #link("https://www.urbandictionary.com/define.php?term=net")[the net] or to different document elements (headings, figures, middle of a paragraph... basically anything really). Last of all, you might want to reference something written by smarter people.

== Links

One thing you might want to point at is some kind of link on the #link("https://en.wikipedia.org/wiki/World_Wide_Web")[World Wide Web]. 

A hyperlink in and of itself also works: https://en.wikipedia.org/wiki/Hyperlink

#link("https://typst.app/docs/reference/model/link/")[Link to Typst docs for the link element]

== References (labeling) <sec:heading1>

Labels can be added to a whole lot of stuff, and can be referenced from other places in the document. To make a label, write `<label-name>` after whatever you want to label.\
To reference a label, one can write `@label-name`. In the document

Some labels already have supplements! These can be changed on a one-to-one basis (or in the template) if one wishes. To change a supplement, simply write `@label-name[my-supplement]`. \
Example: @ch:ref can become @ch:ref[my-supplement].

(The supplement where the reference has been made overwrites any other supplement).

The following is a collection of typical labels, and a showcase of their supplements.

=== Headings, Sections, and Subsections <subsec:heading1-1>

Here is a reference to this chapter's heading @ch:ref. I can also reference the section and subsection, @sec:heading1 and @subsec:heading1-1, as long as they are labeled.

=== Figures

Figures are always a nice thing to reference. Just add a label after a figure, as done in @img:aau, and you are good to go.

#figure(
  image("../assets/AAU/aau_logo_en.svg"),
  caption: [Cool figure with a label]
) <img:aau>

=== Appendices

The appendix itself is special, in that it has its own style. BUT, labeling it is just like one does with headings. 
See @apx:how_to for more on appendices.

=== Note on Label Naming

Because all labels can be found in the same "pool", having a lot of labels with similar names in the project can be confusing when searching for the right one.
Therefore, it is recommended to add a prefix to one's labels. First for headings:
- `ch:label-name` for chapter headings (level 1 headings)
- `sec:label-name` for section headings (level 2 headings)
- `subsec:label-name` for subsection headings (level 3 headings)
- `subsubsec:label-name` for sub-subsection headings (level 4 headings). And now it is getting ridiculous. 
- `apx:label-name` for appendix headings
For figures:
- `fig:label-name` for figures (any kind) 
- `tab:label-name` for tables
- `img:label-name` for images
- `lst:label-name` for listings


== Sources & Bibliography

Bibliographic sources are very important #text(weight:"medium")[\[citation needed\]].

To add a source, you just have to reference your `.bib` file in the `main.typ`.
```typst
    settings: (
        bibs: ("//sources.bib"),
        appendix: "//assets/appendix.typ",
```
By default, it is located in the root folder as `sources.bib`.
These get displayed in the "References" chapter after the main body of text. Only sources actually referenced are shown.

If you for some reason want to show your bibliography in the middle of nowhere (or you have it disabled in the settings found in `main.typ`), the following command can be used:
```typst
#bibliography("sources.bib")
```

Once a source is included, it can be referred to the same way a figure is referred to: `@einstein_1905` @einstein_1905. A reference only shows up in the bibliography section if it has been mentioned at least once.

=== Note on Source Labeling

In the BibTeX world, the "Citation key" written at the top of a BibTeX entry is basically the same as a label.

Citation labels are in the same "pool" as all other labels.
Therefore, a consistent labeling scheme is like the sky raining Ferrero Rochers—delicious and effective in knocking you in the head with a feeling of awe.

Here are some common schemes you can use:
- *LastnameYear*: `einstein1905`, `turing1936` \
  (For multiple publications in the same year, append suffixes: `einstein1905-1`, `einstein1905-2`)
- *Lastname_Year*: `einstein_1905`, `turing_1936`
- *FirstAuthorLastname_EtAl_Year*: `knuth_et_al_1989` \
  (Useful for papers with multiple authors)
- *Author:ShortTitle*: `einstein:relativity`, `dijkstra:goto-harmful` \
  (Good for memorable or well-known papers)
- *ShortTitle:Year*: `relativity:1905`, `lambda-calculus:1936`
- *InitialsYear*: `ae1905`, `amt1936` \
  (Compact, but less readable for unfamiliar sources)

Or you can just do whatever, nobody is stopping you.



