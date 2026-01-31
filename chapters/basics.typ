#import "//template.typ": * // Import of all templating content

= Basic Formatting <ch:basics>

This guide covers essential formatting for writing academic reports in Typst. Each example shows both the code and the result.

== Text Formatting

You can format text in several ways:

- *Bold text* using `*asterisks*`
- _Italic text_ using `_underscores_`
- `Monospace text` using `` `backticks` ``
- #underline[Underlined text] using `#underline[text]`
- #strike[Strikethrough text] using `#strike[text]`
- #smallcaps[Small Caps] using `#smallcaps[text]`

You can also combine formatting: *_bold and italic_* or *#underline[bold and underlined]*.

== Headings

Headings are created using `=` symbols:

```typ
= Chapter Heading (Level 1)
== Section Heading (Level 2)
=== Subsection Heading (Level 3)
==== Sub-subsection Heading (Level 4)
```

== Paragraphs and Line Breaks

A blank line creates a new paragraph.

You can break \
lines within a paragraph \
using the backslash `\` symbol.

For a page break, use:
```typ
#pagebreak()
```

== Lists

=== Unordered Lists

Create bullet points with `-`:

- First item
- Second item
  - Nested item (indent with spaces)
  - Another nested item
- Third item

=== Ordered Lists

Create numbered lists with `+`:

+ First step
+ Second step
  + Sub-step A
  + Sub-step B
+ Third step

=== Custom Numbered Lists

You can also use manual numbering:

1. Introduction
2. Methods
3. Results
4. Discussion

== Emphasis and Quotes

Use quotes for emphasis or citations:

#quote(attribution: [Albert Einstein])[
  "Everything should be made as simple as possible, but not simpler."
]

For inline quotes, simply use quotation marks: "like this."

== Tables

Tables are created using the `#table()` function:

#table(
  columns: 3,
  [*Method*], [*Year*], [*Accuracy*],
  [Method A], [2020], [95%],
  [Method B], [2021], [97%],
  [Method C], [2022], [98%],
)

For more complex tables with custom alignment:

#table(
  columns: (auto, 1fr, auto),
  align: (left, center, right),
  [*Name*], [*Description*], [*Value*],
  [Alpha], [First parameter], [1.5],
  [Beta], [Second parameter], [2.3],
)

=== Formatted Tables



#table(
  columns: 3,

  fill: (_, row) => if calc.odd(row) {
    theme_aau.light_blue_opaque
  } else if row == 0 {
    theme_aau.light_blue
  },

  [*Method*], [*Year*], [*Accuracy*],
  [Method A], [2020], [95%],
  [Method B], [2021], [97%],
  [Method C], [2022], [98%],
)

For more complex tables with custom alignment:

#table(
  columns: (auto, 1fr, auto),

  fill: (_, row) => if calc.odd(row) {
    theme_aau.light_blue_opaque
  } else if row == 0 {
    theme_aau.light_blue
  },

  align: (left, center, right),
  [*Name*], [*Description*], [*Value*],
  [Alpha], [First parameter], [1.5],
  [Beta], [Second parameter], [2.3],
)

=== Advanced alignment

Aligment where all table cells are left aligned except the first row and the first column.

#table(
    columns: (5em, 15em),
    
    fill: (_, row) => if calc.odd(row) {
      theme_aau.light_blue_opaque
    } else if row == 0 {
      theme_aau.light_blue
    },

    align: (col, row) => {
      if row > 0 and col >  0 { left } 
      else                    { center }
    },
    
    [*Symbol*], [*Explanation*],
    [$A subset B$], [$A$ is a subset of $B$],
    [$A mapsto B$], [$A$ maps to $B$],
)

== Figures and Images

=== Single Image

#image("../assets/AAU/aau_logo_circle_en.svg", width: 40%)

=== Single Image in a figure

#figure(
  image("../assets/AAU/aau_logo_circle_en.svg", width: 40%),
  caption: [Example figure with caption]
) <fig:example>

Reference the figure using: `@fig:example` → @fig:example

=== Side-by-Side Images (in Figure)

#grid(
  columns: 2,
  gutter: 1em,
  figure(
    image("../assets/AAU/aau_logo_circle_en.svg", width: 80%),
    caption: [First image]
  ),
  figure(
    image("../assets/AAU/aau_logo_circle_en.svg", width: 80%),
    caption: [Second image]
  )
)

#figure(
  grid(
    columns: 2,
    gutter: 1em,
    image("../assets/AAU/aau_logo_circle_en.svg", width: 80%),
    image("../assets/AAU/aau_logo_circle_en.svg", width: 80%),
  ),
  caption: [Two images but one figure]
)

== Mathematical Equations

Inline math: $E = m c^2$

Display math (centered):

$ integral_0^infinity e^(-x^2) dif x = sqrt(pi)/2 $

=== LaTeX Math in Typst

Inline math: #mi[`\sum_{a\in A}^i`]

Display math (centered):

#mitex[`
\frac
{e_1\to v_{1}\quad e_2\to v_{2}}
{e_1 + e_2 \to v_1+v_2}
`]

=== Referencing Math

$ sum_(k=1)^n k = (n(n+1)) / 2 $<eq:math>

One can reference math equations. In @eq:math is a proof by induction


== Code Blocks

=== Inline Code

Use inline code like `let x: int = 5` within text using backticks.

=== Incline Code with Syntax Higlighing

Use inline code like ```nim let x: int = 5``` within text using backticks.

=== Code Blocks with Syntax Highlighting

```nim
proc fibonacci(n: int): int =
  if n < 2:
    result = n
  else:
    result = fibonacci(n - 1) + (n - 2).fibonacci
```

=== Code Block with Syntax Highlighting and Line Numbering

#context[
  #show raw.line: it => {
    h(0em + if it.number < 10 { 0.6em })
    text(fill: gray)[#it.number]
    h(0.8em)
    it.body
  }
```nim
proc fibonacci(n: int): int =
  if n < 2:
    result = n
  else:
    result = fibonacci(n - 1) + (n - 2).fibonacci
```]

=== Code Block with Syntax Highlighting and Line Numbering and Other Font Size

#context[
  #show raw: set text(1.2em)

  #show raw.line: it => {
    h(0em + if it.number < 10 { 0.6em })
    text(fill: gray)[#it.number]
    h(0.8em)
    it.body
  }
```nim
proc fibonacci(n: int): int =
  if n < 2:
    result = n
  else:
    result = fibonacci(n - 1) + (n - 2).fibonacci
```]

=== Code Block in Figure

#figure(
```nim
proc fibonacci(n: int): int =
  if n < 2:
    result = n
  else:
    result = fibonacci(n - 1) + (n - 2).fibonacci
```,
  caption: [Code block]
)

#figure(
  kind: raw,
  context[
  #show raw.line: it => {
    h(0em + if it.number < 10 { 0.6em })
    text(fill: gray)[#it.number]
    h(0.8em)
    it.body
  }
```nim
proc fibonacci(n: int): int =
  if n < 2:
    result = n
  else:
    result = fibonacci(n - 1) + (n - 2).fibonacci
```],
  caption: [Code block#footnote[Notice that `kind:raw` is added telling typst the figure is a listing, this is becuase the listing is in a `#context` block, and can therefore not automatically detect it as a listing. (raw = listings).]]
)

== Comments

Comments in Typst are not displayed in the output. // This is a comment
Comments can be wirtten using two backslashes `\\`.

== Special Charaters and Escaping


To display special characters literally, escape them with backslash:

- Asterisk: \*not bold\*
- Underscore: \_not italic\_
- Backslash: \\
- Hash: \#not-a-function

```typst
\*not bold\*
\_not italic\_
\\
\#not-a-function
```

== Links

External links: #link("https://typst.app")[Typst Website]
Or use bare URLs: https://en.wikipedia.org/wiki/Hyperlink

== Footnotes

Add footnotes to provide additional information#footnote[This is a footnote.].

== Useful Tips

=== Horizontal Spacing

Use spacing functions for fine control:

- `#h(1em)` for horizontal space
- `#v(1em)` for vertical space

=== Non-Breaking Space

Use ~ for non-breaking spaces: Figure~1 or Section~2.3

== Labels and Referencing

Add labels to any element for cross-referencing:

```typst
== Methods <sec:methods>

As described in @sec:methods...
```

See @ch:ref "Pointing at Stuff" for comprehensive referencing guide.
