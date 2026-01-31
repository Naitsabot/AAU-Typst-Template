#import "//template.typ": * // Import of all templating content
#import "../assets/diagrams.typ": *

= Pointing at Stuff <ch:ref>

Pointing at stuff might seem rude, but it is a very useful thing to do when referencing anything in written form. In a document, one can make links to somewhere on #link("https://www.urbandictionary.com/define.php?term=net")[the net] or to different document elements (headings, figures, middle of a paragraph... basically anything really). Last of all, you might want to reference something written by smarter people.

== Links

One thing you might want to point at is some kind of link on the #link("https://en.wikipedia.org/wiki/World_Wide_Web")[World Wide Web]. 

A hyperlink in and of itself also works: https://en.wikipedia.org/wiki/Hyperlink

For more information, see the #link("https://typst.app/docs/reference/model/link/")[Typst documentation for links].

```typ
// External link with custom text
#link("https://typst.app")[Typst Website]

// Or just use a bare URL
https://typst.app
```

== References (Labeling) <sec:heading1>

Labels can be added to almost anything, and can be referenced from other places in the document.

=== Creating Labels

To make a label, write `<label-name>` after whatever you want to label:

```typ
== My Section <sec:my-section>

#figure(
  image("image.svg"),
  caption: [My figure]
) <fig:my-figure>
```

=== Referencing Labels

To reference a label, write `@label-name`:

```typ
As shown in @fig:my-figure, the results...
According to @sec:my-section, we can see...
```

=== Customizing Reference Text

Some labels already have supplements (like "Figure", "Section", "Table"). You can change these on a case-by-case basis:

```typ
@ch:ref[my-supplement]
```

Example: @ch:ref normally appears as "Chapter 1", but @ch:ref[Part] would show "Part 1".

*Note:* The supplement where the reference is made overwrites any other supplement.

== Reference Examples

=== Headings, Sections, and Subsections <subsec:heading1-1>

Here is a reference to this chapter's heading: @ch:ref. I can also reference the section and subsection: @sec:heading1 and @subsec:heading1-1, as long as they are labeled.

```typ
= My Chapter <ch:my-chapter>
== My Section <sec:my-section>
=== My Subsection <subsec:my-subsection>

Later in the document:
As discussed in @ch:my-chapter...
See @sec:my-section for details...
```

=== Figures

Figures are always a nice thing to reference. Just add a label after a figure, as done in @fig:typst_guy, and you are good to go.

#figure(
  typst_guy,
  caption: [Cool figure with a label]
) <fig:typst_guy>

```typ
#figure(
  image("image.svg", width: 50%),
  caption: [My important figure]
) <fig:important>

Reference it: @fig:important shows...
```

=== Equations

Mathematical equations can also be labeled:

```typ
$ E = m c^2 $ <eq:einstein>

Later: As shown in @eq:einstein...
```

=== Tables

Tables should be labeled like figures:

```typ
#figure(
  table(
    columns: 2,
    [*Item*], [*Value*],
    [A], [1],
  ),
  caption: [Data summary]
) <tab:summary>

Reference: See @tab:summary for the data.
```

=== Appendices

The appendix itself is special, in that it has its own style. However, labeling it is just like with headings.

See @apx:how_to for more on appendices.

```typ
= Appendix: Additional Material <apx:material>

Reference: Details are provided in @apx:material.
```

== Label Naming Conventions <sec:naming>

Because all labels exist in the same namespace, having many labels with similar names can be confusing when searching for the right one. Therefore, it is recommended to use prefixes for your labels.

=== Heading Labels

- `ch:label-name` for chapter headings (level 1)
- `sec:label-name` for section headings (level 2)
- `subsec:label-name` for subsection headings (level 3)
- `subsubsec:label-name` for sub-subsection headings (level 4)
- `apx:label-name` for appendix headings

Example:
```typ
= Introduction <ch:intro>
== Background <sec:background>
=== Historical Context <subsec:history>
```

=== Figure Labels

- `fig:label-name` for general figures
- `tab:label-name` for tables
- `img:label-name` for images
- `lst:label-name` for code listings
- `eq:label-name` for equations

Example:
```typ
#figure(
  table(...),
  caption: [Results]
) <tab:results>

#figure(
  image("plot.svg"),
  caption: [Data visualization]
) <fig:plot>

$ x^2 + y^2 = r^2 $ <eq:circle>
```

=== Benefits of Consistent Naming

+ *Easy searching* - Type `fig:` to see all figure labels
+ *Clear purpose* - Know what type of element a label refers to
+ *Avoid conflicts* - Less likely to have duplicate names
+ *Better autocomplete* - Many editors can suggest labels

== Sources & Bibliography <sec:bibliography>

Bibliographic sources are very important #text(weight:"medium")[\[citation needed\]].

=== Setting Up Bibliography

To add sources, reference your BibTex `.bib` file#footnote[Or you Hayagriva `.yaml` file but I've never seen one] in `main.typ`:

```typst
settings: (
    bibs: ("//sources.bib"),
    appendix: "//assets/appendix.typ",
)
```

By default, the bibliography file is located in the root folder as `sources.bib`.

Of note is the ability to have multiple bibliography file. just include it as a lit in the soruces instead:

```typst
settings: (
    bibs: (("//sources1.bib","//sources2.bib")),
    appendix: "//assets/appendix.typ",
)
```

=== How Bibliography Works

+ Sources are defined in your `.bib` file (BibTeX format)
+ Only cited sources appear in the References section
+ References appear after the main body of text
+ Citations use the same `@` syntax as other references

=== Citing Sources

Once a source is included in your `.bib` file, cite it using `@citation-key`:

```typ
According to Einstein @einstein_1905, the relationship...

Multiple citations can be grouped @turing_1936 @knuth_1984.
```

Example output: According to Einstein @einstein_1905, the relationship...

=== Manual Bibliography Placement

If you want to show your bibliography in a custom location (or have it disabled in settings), use:

```typ
#bibliography("sources.bib")
```

=== Citation Key Naming Conventions <subsec:citation-keys>

In the BibTeX world, the "Citation key" at the top of a BibTeX entry is essentially a label.

Citation labels exist in the same namespace as all other labels. Therefore, a consistent labeling scheme is like the sky raining Ferrero Rochers—delicious and effective in knocking you in the head with a feeling of awe.

==== Common Citation Key Schemes

Here are some popular naming conventions:

*LastnameYear* (Most common)
```bibtex
@article{einstein1905,
  author = {Albert Einstein},
  title = {On the Electrodynamics of Moving Bodies},
  year = {1905}
}
```
- Simple and readable: `@einstein1905`, `@turing1936`
- For multiple publications in the same year, append letters: `@einstein1905a`, `@einstein1905b`

*Lastname_Year* (Underscore variant)
```bibtex
@article{einstein_1905,
  ...
}
```
- Slightly more readable: `@einstein_1905`, `@turing_1936`

*FirstAuthorLastname_EtAl_Year* (Multiple authors)
```bibtex
@article{knuth_et_al_1989,
  author = {Donald Knuth and Others},
  ...
}
```
- Useful for papers with multiple authors: `@knuth_et_al_1989`

*Author:ShortTitle* (Descriptive)
```bibtex
@article{einstein:relativity,
  ...
}
@article{dijkstra:goto-harmful,
  ...
}
```
- Good for memorable or well-known papers
- More self-documenting: `@dijkstra:goto-harmful`

*ShortTitle:Year* (Title-focused)
```bibtex
@article{relativity:1905,
  ...
}
```
- Emphasizes the work: `@relativity:1905`

*InitialsYear* (Compact)
```bibtex
@article{ae1905,
  author = {Albert Einstein},
  ...
}
```
- Very compact: `@ae1905`, `@amt1936`
- Less readable for unfamiliar sources

==== Pick Your Style

Choose one scheme and stick with it throughout your project. Consistency is more important than the specific scheme you choose.

Or you can just do whatever—nobody is stopping you. Just remember that future you (or your collaborators) will appreciate a sensible naming scheme.
