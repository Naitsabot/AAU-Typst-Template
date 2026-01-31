#import "//template.typ": * // Import of all templating content
#import "//assets/diagrams.typ": *

= CeTZ Diagrams <ch:cetz>

_"CeTZ, ein Typst Zeichenpaket"_ (CeTZ, a Typst drawing package) is a library for creating diagrams and graphics in Typst. Its API is inspired by the TikZ #LaTeX package and Processing.

CeTZ allows you to draw complex diagrams, plots, and illustrations programmatically. While it requires some learning, it provides powerful capabilities for creating custom graphics that scale perfectly as vector images.

== What Can CeTZ Do?

CeTZ can create:
- Geometric shapes and diagrams
- Flow charts and network diagrams  
- Mathematical plots and graphs
- Technical illustrations
- Custom icons and graphics
- Annotated figures

== Getting Started with CeTZ

To use CeTZ in your document, import it in your template or at the top of your file:

```typ
#import "@preview/cetz:0.2.2": *
```

Then use the `canvas` function to create a drawing area:

```typ
#import "@preview/cetz:0.2.2": canvas, draw

#canvas({
  draw.line((0, 0), (1, 1))
  draw.circle((1, 0), radius: 0.5)
})
```

== Examples from This Template

The following are example diagrams created with CeTZ. These are defined in the `./assets/diagrams.typ` file and demonstrate what's possible with the library.

=== Example Diagram 1

#figure(
  cetz_example,
  caption: [CeTZ example diagram showing various shapes and elements]
) <fig:cetz-example>

=== Example Diagram 2

#figure(
  typst_guy,
  caption: [Custom illustration created with CeTZ]
) <fig:typst-guy>

== Basic CeTZ Concepts

=== Coordinate System

CeTZ uses a coordinate system where:
- `(0, 0)` is the origin
- First value is x-coordinate (horizontal)
- Second value is y-coordinate (vertical)
- Default unit is centimeters

```typ
#canvas({
  import draw: *
  
  // Draw at different coordinates
  circle((0, 0), radius: 0.2)  // Origin
  circle((2, 0), radius: 0.2)  // 2cm right
  circle((0, 2), radius: 0.2)  // 2cm up
})
```

=== Basic Shapes

```typ
#canvas({
  import draw: *
  
  // Line from point to point
  line((0, 0), (2, 1))
  
  // Rectangle (top-left, bottom-right)
  rect((0, 0), (1, 1))
  
  // Circle (center, radius)
  circle((3, 0), radius: 0.5)
  
  // Bezier curve
  bezier((0, 0), (2, 2), (1, 2), (2, 0))
})
```

=== Styling Elements

```typ
#canvas({
  import draw: *
  
  // Styled line
  line((0, 0), (2, 0), stroke: red + 2pt)
  
  // Filled circle
  circle((1, 1), radius: 0.5, fill: blue, stroke: none)
  
  // Dashed rectangle
  rect((0, 0), (1, 1), stroke: (dash: "dashed"))
})
```

=== Adding Text

```typ
#canvas({
  import draw: *
  
  circle((0, 0), radius: 1)
  
  // Text at center
  content((0, 0), [Center])
  
  // Text with anchor
  content((1, 0), [Right], anchor: "west")
})
```

== Common Use Cases

=== Flow Chart

```typ
#canvas({
  import draw: *
  
  // Nodes
  rect((0, 0), (2, 1), name: "start")
  content((1, 0.5), [Start])
  
  rect((0, -2), (2, -1), name: "process")
  content((1, -1.5), [Process])
  
  rect((0, -4), (2, -3), name: "end")
  content((1, -3.5), [End])
  
  // Arrows
  line((1, 0), (1, -1), mark: (end: ">"))
  line((1, -2), (1, -3), mark: (end: ">"))
})
```

=== Mathematical Plot

```typ
#canvas({
  import draw: *
  import plot
  
  plot.plot(
    size: (8, 6),
    x-tick-step: 1,
    y-tick-step: 1,
    {
      plot.add(domain: (-4, 4), x => calc.pow(x, 2))
    }
  )
})
```

=== Technical Diagram

```typ
#canvas({
  import draw: *
  
  // Component box
  rect((0, 0), (3, 2), fill: gray.lighten(80%))
  content((1.5, 1), [Component])
  
  // Connections
  line((3, 1), (4, 1), mark: (end: ">"))
  line((0, 1), (-1, 1), mark: (start: ">"))
  
  // Labels
  content((3.5, 1.3), text(size: 8pt)[Output])
  content((-0.5, 1.3), text(size: 8pt)[Input])
})
```

== Using CeTZ Diagrams as Figures

Always wrap CeTZ diagrams in figures for proper numbering and referencing:

#figure(
  cetz.canvas({
    import cetz.draw: *
    circle((0, 0), radius: 1)
    content((0, 0), [My Diagram])
  }),
  caption: [A simple CeTZ diagram]
) <fig:my-diagram>

Then reference it: As shown in @fig:my-diagram...

== Learning Resources

To learn more about CeTZ:

- *Official Documentation:* #link("https://typst.app/universe/package/cetz")[typst.app/universe/package/cetz]
- *CeTZ Gallery:* Examples and inspiration from the community
- *TikZ Knowledge:* Many TikZ concepts transfer to CeTZ
- *Template Examples:* Study the diagrams in `./assets/diagrams.typ`

== Tips for Creating Diagrams

+ *Start simple* - Begin with basic shapes and build up complexity
+ *Use variables* - Store coordinates in variables for easier modifications
+ *Name elements* - Use the `name` parameter to reference elements later
+ *Group related elements* - Use the `group` function to organize
+ *Comment your code* - Diagrams can get complex quickly
+ *Test incrementally* - Build and test your diagram step by step
+ *Use functions* - Create reusable diagram components
+ *Check the docs* - CeTZ has many features not covered here

== Common CeTZ Patterns

=== Reusable Components

```typ
#let node(pos, label) = {
  import draw: *
  circle(pos, radius: 0.5, fill: blue.lighten(80%))
  content(pos, text(fill: black, label))
}

#canvas({
  node((0, 0), [A])
  node((2, 0), [B])
  node((1, 1.5), [C])
})
```

=== Grid Layout

```typ
#canvas({
  import draw: *
  
  for x in range(5) {
    for y in range(3) {
      circle((x, y), radius: 0.2)
    }
  }
})
```

=== Relative Positioning

```typ
#canvas({
  import draw: *
  
  let start = (0, 0)
  circle(start, radius: 0.3)
  
  let next = (start.at(0) + 2, start.at(1))
  circle(next, radius: 0.3)
  
  line(start, next)
})
```

== Example: Complete Diagram

Here's a complete example combining multiple concepts:

```typ
#figure(
  canvas({
    import draw: *
    
    // Background
    rect((0, 0), (6, 4), fill: gray.lighten(95%))
    
    // Title
    content((3, 3.5), text(size: 12pt, weight: "bold")[System Architecture])
    
    // Components
    rect((0.5, 1.5), (2, 2.5), fill: blue.lighten(80%), name: "input")
    content((1.25, 2), [Input])
    
    rect((2.5, 1.5), (4, 2.5), fill: green.lighten(80%), name: "process")
    content((3.25, 2), [Process])
    
    rect((4.5, 1.5), (6, 2.5), fill: red.lighten(80%), name: "output")
    content((5.25, 2), [Output])
    
    // Connections
    line((2, 2), (2.5, 2), mark: (end: ">"), stroke: 2pt)
    line((4, 2), (4.5, 2), mark: (end: ">"), stroke: 2pt)
    
    // Labels
    content((2.25, 2.3), text(size: 8pt)[data])
    content((4.25, 2.3), text(size: 8pt)[result])
  }),
  caption: [Example system architecture diagram created with CeTZ]
) <fig:complete-diagram>
```

== Viewing Your Diagrams

To see the example diagrams from this template:
+ Open `./assets/diagrams.typ` to view the source code
+ Compile this document to see the rendered output
+ Modify the examples to learn how they work
+ Create your own diagrams based on these templates

== Summary

CeTZ is a powerful tool for creating custom diagrams in Typst. While it has a learning curve, it provides fine-grained control over your graphics and produces high-quality, scalable vector images. Start with simple examples, refer to the documentation, and gradually build more complex diagrams as you become comfortable with the library.

For the examples shown in @fig:cetz-example and @fig:typst-guy, see the source code in `./assets/diagrams.typ`.