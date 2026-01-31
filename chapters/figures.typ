#import "//template.typ": * // Import of all templating content

= Figures <ch:figures>

Figures are essential for presenting visual information in academic reports. This guide covers images, tables, diagrams, and code listings as figures.

In the basics, some figures has been shown, here are some more.

== Image Sizing

=== Width-Based Sizing

#figure(
  image("../assets/AAU/aau_logo_en.svg", width: 30%),
  caption: [Image at 30% width]
) <fig:width30>

#figure(
  image("../assets/AAU/aau_logo_en.svg", width: 70%),
  caption: [Image at 70% width]
) <fig:width70>

=== Height-Based Sizing

#figure(
  image("../assets/AAU/aau_logo_en.svg", height: 3cm),
  caption: [Image with fixed height of 3cm]
) <fig:height>

=== Fit to Page

For full-width images:

```typ
#figure(
  image("image.png", width: 100%),
  caption: [Full-width image]
)
```

== Figure Placement

=== Standard Placement

By default, figures appear where you place them in the text.

=== Top or Bottom Placement

For better layout control, place figures at top or bottom of page:

```typ
#figure(
  image("image.svg", width: 60%),
  caption: [Figure placed at top of page],
  placement: top,
) <fig:top>
```

Options for *`placement`*:
- `top` - Place at top of page
- `bottom` - Place at bottom of page
- `auto` - Automatic placement (default)

== Multiple Images in One Figure

=== Side-by-Side Images

#figure(
  grid(
    columns: 2,
    gutter: 1em,
    image("../assets/AAU/aau_logo_en.svg", width: 100%),
    image("../assets/AAU/aau_logo_en.svg", width: 100%),
  ),
  caption: [Two images side by side]
) <fig:sidebyside>

=== Three Images in a Row

#figure(
  grid(
    columns: 3,
    gutter: 0.8em,
    image("../assets/AAU/aau_logo_en.svg", width: 100%),
    image("../assets/AAU/aau_logo_en.svg", width: 100%),
    image("../assets/AAU/aau_logo_en.svg", width: 100%),
  ),
  caption: [Three images in a row]
) <fig:three>

=== Stacked Images

#figure(
  grid(
    columns: 1,
    gutter: 1em,
    image("../assets/AAU/aau_logo_en.svg", width: 60%),
    image("../assets/AAU/aau_logo_en.svg", width: 60%),
  ),
  caption: [Two images stacked vertically]
) <fig:stacked>

== Subfigures

Create subfigures with individual captions:

#figure(
  grid(
    columns: 2,
    gutter: 1em,
    figure(
      image("../assets/AAU/aau_logo_en.svg", width: 100%),
      caption: [First subfigure],
      numbering: "(a)",
    ),
    figure(
      image("../assets/AAU/aau_logo_en.svg", width: 100%),
      caption: [Second subfigure],
      numbering: "(a)",
    ),
  ),
  caption: [Main caption for both subfigures]
) <fig:subfigs>
