// AAU Typst Template - Styling Module

#import "config.typ": *

// Apply all document-wide styles
#let apply_styles(localisation, meta) = it => {
    // **** BASIC TEXT SETTINGS ****
    set text(font: body-font, lang: localisation.lang, region: localisation.region)
    show heading: set text(font: sans-font, fill: theme_aau.blue)

    // **** LINKS STYLING ****
    show link: it => {
        if type(it.dest) == str {
            text(weight: "medium", fill: theme_aau.light_blue, underline(stroke: theme_aau.blue, it))
        } else {
            text(weight: "regular", fill: black, it)
        }
    }

    // **** REFERENCES STYLING ****
    show ref: it => {
        let el = it.element
        if el != none and el.func() == figure and el.kind == "glossarium_entry" {
            text(it) // if glossary item
        } else {
            text(weight: "medium", it) // if not glossary item
        }
    }

    // **** FOOTNOTES ****
    show footnote.entry: it => {
        let loc = it.note.location()
        numbering("1: ", ..counter(footnote).at(loc))
        it.note.body
    }

    set footnote.entry(
        separator: line(length: 35% + 0pt, stroke: 1pt + theme_aau.blue),
        clearance: 1em,
    )

    // **** MATH EQUATIONS ****
    set math.equation(numbering: "(1)")
    show math.equation: set text(weight: "regular")

    // **** CODE BLOCKS ****
    // ! Codly handles block code styling, only style inline code
    show raw.where(block: false): box.with(
        fill: luma(240),
        inset: (x: 3pt, y: 0pt),
        outset: (y: 3pt),
        radius: 2pt,
    )

    // **** PARAGRAPH SETTINGS ****
    set par(justify: true)
    set pagebreak(weak: true)

    // **** TABLES ****
    set table(stroke: theme_aau.blue)

    // **** LISTS ****
    set list(
        marker: ([❖], [◈], [◇], [⋄]),
        tight: true, 
        body-indent: 0.5em, 
        indent: 0.5em, 
        spacing: 0.40cm
    )

    // **** CITATIONS ****
    set cite(style: "council-of-science-editors")

    // **** QUOTATIONS ****
    set quote(block: true)
    show quote: set align(left)
    show quote: set pad(x: 2em)
    show quote: set block(spacing: 1em)

    // **** FIGURES ****
    set figure(numbering: (..nums) => 
        [#counter(heading).display((..heading_nums) => heading_nums.pos().at(0))\.#nums.pos().at(0)]
    )

    show figure: figure => block[
        #v(.75em)
        #figure
    ]
    
    it  // ← Return the content with styles applied
}
// Apply body-specific heading styles
#let apply_body_heading_styles() = it => {
  // Enable heading numbering for body content
    set heading(numbering: "1.1")

    // Heading supplements
    show heading.where(level: 1): set heading(supplement: "Chapter")
    show heading.where(level: 2): set heading(supplement: "Section")
    show heading.where(level: 3): set heading(supplement: "Subsection")
    show heading.where(level: 4): set heading(supplement: "Subsubsection")
  
    // Chapter heading styling
    show heading.where(level: 1): it => {
        pagebreak(weak: true)
        v(0pt)
        place(left, dx: .5em, text(
            font: sans-font, 
            4em, 
            weight: "extrabold", 
            fill: theme_aau.blue, 
            counter(heading).display()
        ))
        place(right, dy: 1.75em, dx: -.5em, text(
            font: sans-font, 
            1.5em, 
            weight: "extrabold", 
            fill: theme_aau.blue, 
            it.body
        ))
        v(4em)

        // Reset figure counters
        counter(figure.where(kind: table)).update(0)
        counter(figure.where(kind: image)).update(0)
        counter(figure.where(kind: raw)).update(0)       
    }

    // Section heading styling
    show heading.where(level: 2): it => {
        v(par_spacing, weak: true)
        set text(1.25em, font: sans-font, weight: "bold", fill: theme_aau.blue)
        text(counter(heading).display())
        text(" - ")
        text(fill: theme_aau.blue, it.body)
        v(par_text_spacing, weak: true)
    }

    // Subsection heading styling
    show heading.where(level: 3): it => {
        v(par_spacing, weak: true)
        set text(1.125em, font: sans-font, weight: "bold", fill: theme_aau.blue)
        text(counter(heading).display())
        text(" - ")
        text(fill: theme_aau.blue, it.body)
        v(par_text_spacing, weak: true)
    }

    // Subsubsection heading styling
    show heading.where(level: 4): it => {
        v(par_spacing, weak: true)
        set text(1.125em, font: sans-font, weight: "semibold", fill: theme_aau.blue)
        text(fill: theme_aau.blue, it.body)
        v(par_text_spacing, weak: true)
    }
    
    it  // Return the content with styles applied
}

// Apply appendix-specific styles
#let apply_appendix_styles() = it => {
  // Set appendix numbering
    set heading(numbering: "A.1")

    // Figure formatting for appendix
    show heading.where(level: 1): it => {
        counter(heading).step(level: 1)  // Step counter first
        counter(figure.where(kind: table)).update(0)
        counter(figure.where(kind: image)).update(0)
        counter(figure.where(kind: raw)).update(0)
        it
    }
    
    // Custom figure numbering for appendix
    set figure(numbering: (..nums) => {
        let fig_num = nums.pos().at(0)
        let app_letter = counter(heading).display("A").first()
        
        if nums.pos().len() > 0 {
            [Apx. #app_letter\.#fig_num]
        }
    })
    
    // Custom figure supplements for appendix
    show figure.where(kind: table): set figure(supplement: "Table")
    show figure.where(kind: image): set figure(supplement: "Figure") 
    show figure.where(kind: raw): set figure(supplement: "Listing")

    // Set supplement for appendix headings
    show heading.where(level: 1): set heading(supplement: [Appendix])
    show heading.where(level: 2): set heading(supplement: [Appendix])
    show heading.where(level: 3): set heading(supplement: [Appendix])
    show heading.where(level: 4): set heading(supplement: [Appendix])

    // Appendix heading styles
    show heading.where(level: 1): h => {
        v(par_spacing, weak: true)
        set text(1.50em, font: sans-font, weight: "bold", fill: theme_aau.blue)
        text(counter(heading).display())
        text(" - ")
        text(fill: theme_aau.blue, h.body)
        v(par_text_spacing, weak: true)
    }

    show heading.where(level: 2): h => {
        v(par_spacing, weak: true)
        set text(1.25em, font: sans-font, weight: "bold", fill: theme_aau.blue)
        text(counter(heading).display())
        text(" - ")
        text(fill: theme_aau.blue, h.body)
        v(par_text_spacing, weak: true)
    }

    show heading.where(level: 3): h => {
        v(par_spacing, weak: true)
        set text(1.125em, font: sans-font, weight: "bold", fill: theme_aau.blue)
        text(counter(heading).display())
        text(" - ")
        text(fill: theme_aau.blue, h.body)
        v(par_text_spacing, weak: true)
    }

    show heading.where(level: 4): h => {
        v(par_spacing, weak: true)
        set text(1.125em, font: sans-font, weight: "semibold", fill: theme_aau.blue)
        text(counter(heading).display())
        text(" - ")
        text(fill: theme_aau.blue, h.body)
        v(par_text_spacing, weak: true)
    }
    
    it  // Return the content with styles applied
}