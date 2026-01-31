#import "//template.typ": *

#let cetz_ex = {
    import cetz.draw: *
    cetz.canvas({
        let c = ((rel: (0, -1)), (rel: (2, 0), update: false)) // Coordinates to draw the line, it is not necessary to understand this for this example.

        // No marks
        line((), (rel: (1, 0), update: false))
        
        // Draws a triangle mark at both ends of the line.
        set-style(mark: (symbol: ">"))
        line(..c)
        
        // Overrides the end mark to be a diamond but the start is still a triangle.
        set-style(mark: (end: "<>"))
        line(..c)
        
        // Draws two triangle marks at both ends but the first mark of end is still a diamond.
        set-style(mark: (symbol: (">", ">")))
        line(..c)
        
        // Sets the stroke of first mark in the sequence to red but the end mark overrides it to be blue.
        set-style(mark: (symbol: ((symbol: ">", stroke: red), ">"), end: (stroke: blue)))
        line(..c)
    })
}