/* 
 * AAU Software Typst Template 2.2
 * Cleaned up version of Sebastian's rework of Kresten's AAU template
 */

// **** IMPORTS ****
#import "@preview/mitex:0.2.6": *
#import "@preview/cetz:0.4.1"
#import "@preview/hydra:0.6.2": hydra

// **** CONFIGURATION ****
#let body-font = "Libertinus Serif"
#let sans-font = "New Computer Modern"
#let par_spacing = 1.2em
#let par_text_spacing = 0.65em

// AAU color theme
#let theme_aau = (
    aau_blue: rgb(33, 26, 82),
    aau_blue_opaque: rgb(33, 26, 82, 20),
    aau_light_blue: rgb(153, 143, 220),
    aau_light_blue_opaque: rgb(153, 143, 220, 20),
    blue: rgb(33, 26, 82),
    blue_opaque: rgb(33, 26, 82, 20),
    light_blue: rgb(153, 143, 220),
    light_blue_opaque: rgb(153, 143, 220, 20),
)

// **** HELPER FUNCTIONS ****

// For large documents - reference placeholder
#let no-ref(it) = {
    show ref: _ => [[?]]
    it
}

// Function to get page count for body content
#let get-body-page-count() = context {
    let body-start = query(selector(<body-start>))
    let body-end = query(selector(<body-end>))
    
    if body-start.len() > 0 and body-end.len() > 0 {
        let start-page = body-start.first().location().page()
        let end-page = body-end.first().location().page()
        str(end-page - start-page)
    } else {
        "0"
    }
}

// **** PAGE LAYOUTS ****

// Cover page with waves background
#let page_cover(meta) = {
    page(
        background: image("//assets/AAU/aau_waves.svg", width: 100%, height: 100%), 
        numbering: none,
        {
            grid(
                columns: (100%), 
                rows: (50%, 25%, 25%),
                align(center + bottom,
                    box(
                        fill: theme_aau.blue, 
                        inset: 18pt, 
                        radius: 1pt, 
                        width: 100%,
                        {
                            set par(justify: false)
                            set text(fill: white, 12pt)
                            align(center)[
                                #text(font: sans-font, 3em, weight: "extrabold", meta.title)\
                                #text(font: body-font, 1.5em, weight: "regular", meta.subtitle)\ \
                                #text(font: sans-font, 1.5em, weight: "extrabold", "Department of ") 
                                #text(font: sans-font, 1.5em, weight: "extrabold", meta.department)\
                                #text(font: body-font, 1.5em, weight: "regular", meta.project_group + " | " + meta.project_period)\ \
                                #text(font: sans-font, 1.5em, weight: "extrabold", meta.project_type)
                            ]
                        }
                    )
                ),
                [],
                align(center, image("//assets/AAU/aau_logo_circle_en.svg", width: 25%))
            )
        }
    )
}

// Cover page with image
#let page_cover_image(meta) = {
    page(
        background: image("//assets/AAU/aau_waves.svg", width: 100%, height: 100%, fit: "cover"), 
        margin: 0em,
        numbering: none,
        {
            image("assets/AAU/frontpageImage.jpg", width: 100%, height: 37%)
            v(-2%)
            align(center + top,
                box(
                    fill: white, 
                    inset: 18pt, 
                    radius: 1pt, 
                    width: 100%,
                    {
                        set par(justify: false)
                        set text(fill: theme_aau.blue, 12pt)
                        align(center)[
                            #text(font: sans-font, 3em, weight: "extrabold", meta.title)\
                            #text(font: body-font, 1.5em, weight: "regular", meta.subtitle)\ \
                            #text(font: sans-font, 1.5em, weight: "extrabold", "Department of ") 
                            #text(font: sans-font, 1.5em, weight: "extrabold", meta.department)\
                            #text(font: body-font, 1.5em, weight: "regular", meta.project_group + " | " + meta.project_period)\ \
                            #text(font: sans-font, 1.5em, weight: "extrabold", meta.project_type)
                        ]
                    }
                )
            )
            align(bottom + center, image("//assets/AAU/aau_logo_circle_en.svg", width: 25%))
            v(10%)
        }
    )
}

// Colophon page
#let page_colophon(meta) = {
    page({
        align(bottom, {
            par(justify: true, text(font: body-font, "Copyright \u{00A9} Aalborg University " + meta.date.display("[year]")))
            par(justify: true, text(font: body-font, meta.colophon))
            v(5em)
        })
    })
}

// Abstract and information page
#let page_abstract(meta, settings) = {
    page({
        grid(
            columns: (100%),
            rows: (60%, 37.5%, 2.5%),
            // Main content grid
            grid(
                columns: (49%, 2%, 49%),
                rows: (100%),
                // Left column - Project information
                box(width: 100%, height: 100%)[
                    #text(font: sans-font, 1em, weight: "extrabold", "Title:")\
                    #text(font: body-font, 1em, weight: "regular", meta.title)
                    
                    #v(0em)
                    #text(font: sans-font, 1em, weight: "extrabold", "Theme:")\
                    #text(font: body-font, 1em, weight: "regular", meta.theme)
                    
                    #v(0em)
                    #text(font: sans-font, 1em, weight: "extrabold", "Project Period:")\
                    #text(font: body-font, 1em, weight: "regular", meta.project_period)
                    
                    #v(0em)
                    #text(font: sans-font, 1em, weight: "extrabold", "Project Group:")\
                    #text(font: body-font, 1em, weight: "regular", meta.project_group)
                    
                    #v(0em)
                    #text(font: sans-font, 1em, weight: "extrabold", "Participant(s):")\
                    #text(font: body-font, 1em, weight: "regular", meta.participants.map(e => e.name).join("\n"))
                    
                    #v(0em)
                    #text(font: sans-font, 1em, weight: "extrabold", "Supervisor(s):")\
                    #text(font: body-font, 1em, weight: "regular", meta.supervisors.map(e => e.name).join("\n"))

                    #if(settings.qabstractgithub) {[
                        #v(0em)
                        #text(font: sans-font, 1em, weight: "extrabold", "GitHub Organisation:")\
                        #text(font: body-font, 1em, weight: "regular", meta.github_link)
                    ]}
                    
                    #v(0em)
                    #text(font: sans-font, 1em, weight: "extrabold", "Page Numbers:")\
                    #text(font: body-font, 1em, weight: "regular", get-body-page-count())
                    
                    #v(0em)
                    #text(font: sans-font, 1em, weight: "extrabold", "Date of Completion:")\
                    #text(font: body-font, 1em, weight: "regular", meta.date.display())
                    
                    #v(0em)
                    #text(font: sans-font, 1em, weight: "extrabold", meta.faculty + ":")\
                    #text(font: body-font, 1em, weight: "regular", meta.faculty_link)
                ],
                // Spacer
                [],
                // Right column - Department info and abstract
                box(width: 100%, height: 100%)[
                    #text(font: sans-font, 1em, weight: "extrabold", "Department of ")
                    #text(font: sans-font, 1em, weight: "extrabold", meta.department + ":")\
                    #text(font: body-font, 1em, weight: "regular", meta.department_link)
                    
                    #v(0em)
                    #text(font: sans-font, 1em, weight: "extrabold", "Abstract:")
                    #par(justify: true, meta.abstract)
                ]
            ),
            // AAU Logo
            align(center + horizon, image("//assets/AAU/aau_logo_en.svg", width: 50%)),
            // Availability notice
            align(center,
                text(
                    font: body-font, 
                    .75em, 
                    style: "italic", 
                    weight: "regular"
                )[The content of this report is freely available, but publication (with reference) may only be pursued after agreement with the author.]
            )
        )
    })
}

// Preface page
#let page_preface(meta, settings) = {
    page({
        align(center, text(font: sans-font, 3em, weight: "extrabold", theme_aau.blue)[Preface])
        par(justify: true, text(font: body-font, meta.preface))
        
        if settings.qsignature {
            align(
                center + bottom,
                grid(
                    columns: (auto, auto),
                    row-gutter: 5em,
                    column-gutter: 2em,
                    ..meta.participants.map(e => {
                        align(center)[
                            #line(length: 100%)
                            #text(font: sans-font, 12pt, e.name)\
                            #text(font: sans-font, 10pt, e.email)
                        ]
                    })
                )
            )
        }
    })
}

// **** MAIN DOCUMENT FUNCTION ****

#let doc(
    meta: (
        title: "This is a Title, and it can be Quite Long if That's What You're Into",
        subtitle: "Here is the subtitle",
        theme: "The Theme of the Paper",
        project_type: "Bachelor's Semester Project",
        project_period: "Spring 2025",
        project_group: "cs-25-sw-4-15",
        participants: (
            (name: "Sebastian H. Lorenzen", email: "sed@domain.dk"),
            (name: "Kresten Laust", email: "kre@domain.dk"),
            (name: "Mr. White", email: "whi@domain.dk"),
            (name: "Mr. Orange", email: "ora@domain.dk"),
            (name: "Mr. Blonde", email: "blo@domain.dk"),
            (name: "Mr. Blue", email: "blu@domain.dk"),
        ),
        supervisors: (
            (name: "Mr Pink", email: "pin@domain.dk"),
            (name: "Mr Typst", email: "typ@domain.dk"),
        ),
        university: "Aalborg University",
        university_link: link("https://www.aau.dk"),
        faculty: "The Technical Faculty of IT and Design",
        faculty_link: link("https://www.tech.aau.dk/"),
        department: "Computer Science",
        department_link: link("https://cs.aau.dk"),
        github_link: link("https://github.com/Naitsabot"),
        date: datetime.today(),
        colophon: "Here you can write something about which tools and software you have used for typesetting the document, running simulations and creating figures. If you do not know what to write, either leave this page blank or have a look at the colophon in some of your books.",
        abstract: "This is the abstract. Around 190 words should be the limit of its length. Otherwise it is just too long and fills too much space.",
        preface: "A preface is a preview of your writing that introduces you as its author. It can also be used to give praise and dedications to people or organizations",
    ),

    localisation: (
        lang: "en",
        region: "gb",
    ),

    settings: (
        bibs: ("//assets/sources/sources.bib"),
        appendix: "//assets/appendix.typ",
        
        qcover: true,
        qcovertype2: false,
        qcolophon: true,
        qabstract: true,
        qabstractgithub: true,
        qsignature: true,
        qpreface: true,
        qtableofcontents: true,
        qappendix: true,
    ),

    body,
) = {
    // **** BASIC DOCUMENT SETTINGS ****
    set document(
        author: meta.participants.map(a => a.name), 
        title: meta.title, 
        keywords: (meta.university, meta.faculty, meta.department, meta.project_group)
    )

    // **** TEXT AND FORMATTING ****
    set text(font: body-font, lang: localisation.lang, region: localisation.region)
    set heading(numbering: "1.1")
    show heading: set text(font: sans-font, fill: theme_aau.blue)

    // Links styling
    show link: it => {
        if type(it.dest) == str {
            text(weight: "medium", fill: theme_aau.light_blue, underline(stroke: theme_aau.blue, it))
        } else {
            text(weight: "regular", fill: black, it)
        }
    }

    // References styling
    show ref: it => {
        let el = it.element
        if el != none and el.func() == figure and el.kind == "glossarium_entry" {
            text(it) // if glossary item
        } else {
            text(weight: "medium", it) // if not glossary item
        }
    }

    // Footnotes
    show footnote.entry: it => {
        let loc = it.note.location()
        numbering("1: ", ..counter(footnote).at(loc))
        it.note.body
    }

    set footnote.entry(
        separator: line(length: 35% + 0pt, stroke: 1pt + theme_aau.blue),
        clearance: 1em,
    )

    // Math equations
    set math.equation(numbering: "(1)")
    show math.equation: set text(weight: "regular")

    // Code blocks
    show raw.where(block: false): box.with(
        fill: luma(240),
        inset: (x: 3pt, y: 0pt),
        outset: (y: 3pt),
        radius: 2pt,
    )

    show raw.where(block: true): block.with(
        fill: luma(240),
        inset: 10pt,
        radius: 4pt,
    )

    // Paragraph settings
    set par(justify: true)
    set pagebreak(weak: true)

    // Tables
    set table(stroke: theme_aau.blue)

    // Lists
    set list(
        marker: ([❖], [◈], [◇], [⋄]),
        tight: true, 
        body-indent: 0.5em, 
        indent: 0.5em, 
        spacing: 0.40cm
    )

    // Citations
    set cite(style: "council-of-science-editors")

    // Quotations
    set quote(block: true)
    show quote: set align(left)
    show quote: set pad(x: 2em)
    show quote: set block(spacing: 1em)

    // Figure formatting with auto-numbering per chapter
    show heading.where(level: 1): it => {
        it
        counter(figure.where(kind: table)).update(0)
        counter(figure.where(kind: image)).update(0)
        counter(figure.where(kind: raw)).update(0)
    }

    set figure(numbering: (..nums) => 
        [#counter(heading).display((..heading_nums) => heading_nums.pos().at(0))\.#nums.pos().at(0)]
    )

    show figure: figure => block[
        #v(.75em)
        #figure
    ]

    // **** FRONT MATTER ****
    set page(numbering: "I", number-align: center)

    // Include front matter pages based on settings
    if settings.qcover {
        if settings.qcovertype2 { 
            page_cover_image(meta) 
        } else { 
            page_cover(meta) 
        }
    }
    if settings.qcolophon { page_colophon(meta) }
    if settings.qabstract { page_abstract(meta, settings) }
    if settings.qpreface { page_preface(meta, settings) }

    // **** TABLE OF CONTENTS ****
    if settings.qtableofcontents {
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

        context{
            /* show outline.entry.where(
                level: 1
            ): set text(font: sans-font, 1em, theme_aau.blue) */
            
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

    // **** MAIN BODY ****
    // Add invisible marker for body start
    place(hide[heading(level: 2, outlined: false, bookmarked: false, numbering: none)[] <body-start>])
    
    set page(
        numbering: "1", 
        number-align: center,
        header: context {
            align(left, text(
                font: body-font, 
                1em, 
                weight: 400, 
                emph(hydra(2) + h(1fr) + meta.university)
            ))
            line(length: 100%, stroke: .1em + theme_aau.blue)
        }
    )
    counter(page).update(1)

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
            theme_aau.blue, 
            counter(heading).display()
        ))
        place(right, dy: 1.75em, dx: -.5em, text(
            font: sans-font, 
            1.5em, 
            weight: "extrabold", 
            theme_aau.blue, 
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
        set text(1.25em, font: sans-font, weight: "bold", theme_aau.blue)
        text(counter(heading).display())
        text(" - ")
        text(theme_aau.blue, it.body)
        v(par_text_spacing, weak: true)
    }

    // Subsection heading styling
    show heading.where(level: 3): it => {
        v(par_spacing, weak: true)
        set text(1.125em, font: sans-font, weight: "bold", theme_aau.blue)
        text(counter(heading).display())
        text(" - ")
        text(theme_aau.blue, it.body)
        v(par_text_spacing, weak: true)
    }

    // Subsubsection heading styling
    show heading.where(level: 4): it => {
        v(par_spacing, weak: true)
        set text(1.125em, font: sans-font, weight: "semibold", theme_aau.blue)
        text(theme_aau.blue, it.body)
        v(par_text_spacing, weak: true)
    }

    // Insert main body content
    body

    // Add invisible marker for body end
    place(hide[#heading(level: 2, outlined: false, bookmarked: false, numbering: none)[] <body-end>])

    // **** BIBLIOGRAPHY ****
    show bibliography: body => {
        counter(heading).step()
        body
    }
    
    pagebreak(weak: true)
    
    show heading.where(level: 1): h => {
        v(par_spacing, weak: true)
        align(center, text(font: sans-font, 3em, weight: "extrabold", theme_aau.blue)[References])
        v(1em)
        v(par_text_spacing, weak: true)
    }
    
    bibliography(settings.bibs, title: "References", style: "springer-vancouver")

    // **** APPENDIX ****
    if settings.qappendix {
        // Figure formatting for appendix
        show heading.where(level: 1): it => {
            it
            counter(figure.where(kind: table)).update(0)
            counter(figure.where(kind: image)).update(0)
            counter(figure.where(kind: raw)).update(0)
        }
        
        // Custom figure numbering for appendix
        set figure(numbering: (..nums) => {
            let fig_num = nums.pos().at(0)
            let app_letter = counter(heading).display("A").first()
            
            // Check what kind of figure this is
            if nums.pos().len() > 0 {
                [Apx. #app_letter\.#fig_num]
            }
        })
        
        // Custom figure supplements for appendix
        show figure.where(kind: table): set figure(supplement: "Table")
        show figure.where(kind: image): set figure(supplement: "Figure") 
        show figure.where(kind: raw): set figure(supplement: "Listing")

        set page(numbering: "A", number-align: center)
        counter(page).update(1)

        set heading(numbering: "A.1")
        counter(heading).update(0)

        // Set supplement for appendix headings - this applies to references
        show heading.where(level: 1): set heading(supplement: [Appendix])
        show heading.where(level: 2): set heading(supplement: [Appendix])
        show heading.where(level: 3): set heading(supplement: [Appendix])
        show heading.where(level: 4): set heading(supplement: [Appendix])

        // Appendix heading styles
        show heading.where(level: 1): h => {
            v(par_spacing, weak: true)
            set text(1.50em, font: sans-font, weight: "bold", theme_aau.blue)
            text(counter(heading).display())
            text(" - ")
            text(theme_aau.blue, h.body)
            v(par_text_spacing, weak: true)
        }

        show heading.where(level: 2): h => {
            v(par_spacing, weak: true)
            set text(1.25em, font: sans-font, weight: "bold", theme_aau.blue)
            text(counter(heading).display())
            text(" - ")
            text(theme_aau.blue, h.body)
            v(par_text_spacing, weak: true)
        }

        show heading.where(level: 3): h => {
            v(par_spacing, weak: true)
            set text(1.125em, font: sans-font, weight: "bold", theme_aau.blue)
            text(counter(heading).display())
            text(" - ")
            text(theme_aau.blue, h.body)
            v(par_text_spacing, weak: true)
        }

        show heading.where(level: 4): h => {
            v(par_spacing, weak: true)
            set text(1.125em, font: sans-font, weight: "semibold", theme_aau.blue)
            text(counter(heading).display())
            text(" - ")
            text(theme_aau.blue, h.body)
            v(par_text_spacing, weak: true)
        }

        pagebreak(weak: true)
        align(center, text(font: sans-font, 3em, weight: "extrabold", theme_aau.blue)[Appendices])
        v(0em)
        include settings.appendix
    }
}

// **** HELPER FUNCTIONS FOR SPECIALIZED CONTENT ****

#let bit_field_table(bit_group_length: array, descriptions: array) = {
    let description_cells = ()
    
    if type(bit_group_length) == "integer" {
        description_cells.push(table.cell(colspan: bit_group_length)[#descriptions])
    } else {
        for k in range(bit_group_length.len()) {
            description_cells.push(table.cell(colspan: bit_group_length.at(k))[#descriptions.at(k)])
        }
    }
    
    figure(
        table(
            columns: (70pt, auto, auto, auto, auto, auto, auto, auto, auto),
            table.cell(align: left, colspan: 1, fill: luma(80%))[*Bit*], 
            [*7*], [*6*], [*5*], [*4*], [*3*], [*2*], [*1*], [*0*],
            table.cell(align: left, colspan: 1, fill: luma(80%))[*Description*],
            ..description_cells
        )
    )
}

#let trimmed-image = (path, trim: (:), alt: none) => context {
    let img = image(path)
    let dims = measure(img)

    layout(size => {
        let left = trim.at("left", default: 0.0%)
        let right = trim.at("right", default: 0.0%)
        let top = trim.at("top", default: 0.0%)
        let bottom = trim.at("bottom", default: 0.0%)

        let width-rel-trimmed = 100.0% - left - right
        let height-rel-trimmed = 100.0% - top - bottom

        let width-source-trimmed = dims.width * width-rel-trimmed
        let height-source-trimmed = dims.height * height-rel-trimmed

        let aspect-height-layout = size.height / size.width
        let aspect-height-trimmed = height-source-trimmed / width-source-trimmed

        let width-final-trimmed = none
        let height-final-trimmed = none

        if aspect-height-layout >= aspect-height-trimmed {
            width-final-trimmed = size.width
            height-final-trimmed = aspect-height-trimmed * width-final-trimmed
        } else {
            height-final-trimmed = size.height
            width-final-trimmed = size.height / aspect-height-trimmed
        }

        let width-final-untrimmed = width-final-trimmed / float(width-rel-trimmed)
        let height-final-untrimmed = height-final-trimmed / float(height-rel-trimmed)

        box(
            clip: true, 
            inset: (
                top: -(top * height-final-untrimmed), 
                bottom: -(bottom * height-final-untrimmed),
                left: -(left * width-final-untrimmed),
                right: -(right * width-final-untrimmed)
            ), 
            image(path, width: width-final-untrimmed, height: height-final-untrimmed, alt: alt)
        )
    })
}

// Fun

#let TeX = {
  set text(font: "New Computer Modern", weight: "regular")
  box(width: 1.7em, {
    [T]
    place(top, dx: 0.56em, dy: 0.22em)[E]
    place(top, dx: 1.1em)[X]
  })
}

#let LaTeX = {
  set text(font: "New Computer Modern", weight: "regular")
  box(width: 2.55em, {
    [L]
    place(top, dx: 0.3em, text(size: 0.7em)[A])
    place(top, dx: 0.7em)[#TeX]
  })
}
