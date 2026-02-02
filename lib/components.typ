// AAU Typst Template - Reusable Components

#import "config.typ": *
#import "@preview/hydra:0.6.2": hydra

// Page header component
#let page_header(meta) = context {
    align(left, text(
        font: body-font, 
        1em, 
        weight: 400, 
        emph(hydra(2) + if meta.university != none {h(1fr) + meta.university})
    ))
    line(length: 100%, stroke: .1em + theme_aau.blue)
}

// Table of contents component
#let table_of_contents(settings) = {
    pagebreak()
    
    show outline.entry.where(level: 1): it => {
        v(12pt, weak: true)
        strong(it)
    }

    align(center, text(font: sans-font, 3em, weight: "extrabold", theme_aau.blue)[Table of Contents])
    v(1em)
    
    outline(
        title: text(font: sans-font, 1em, theme_aau.blue, "Chapters"), 
        depth: 2, 
        indent: auto,
        target: heading.where(numbering: "1.1")
    )

    v(.5em)

    context {
        outline(
            title: none,
            indent: auto,
            target: heading.where(numbering: none)
        ) 
    }
    
    if settings.qappendix {
        outline(
            title: text(font: sans-font, 1em, theme_aau.blue, "Appendices"), 
            depth: 1, 
            indent: auto,
            target: heading.where(numbering: "A.1")
        )
    }
}