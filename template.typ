/* 
 * AAU Software Typst Template 3.0
 * Modular refactored version
 */

// **** IMPORTS ****
#import "@preview/mitex:0.2.6": *
#import "@preview/cetz:0.4.1"
#import "@preview/codly:1.3.0": *  // Add codly import. Cool code blocks / listings

// Import all modules
#import "lib/config.typ": *
#import "lib/helpers.typ": *
#import "lib/pages.typ": *
#import "lib/styles.typ": *
#import "lib/components.typ": *

// **** MAIN DOCUMENT FUNCTION ****
#let doc(
    meta: default_meta,
    localisation: (lang: "en", region: "gb"),
    settings: default_settings,
    body,
) = {
    // **** BASIC DOCUMENT SETTINGS ****
    set document(
        author: meta.participants.map(a => a.name), 
        title: meta.title, 
        keywords: (
            if meta.university != none {meta.university} else {""}, 
            if meta.faculty != none {meta.faculty} else {""}, 
            if meta.department != none {meta.department} else {""}, 
            if meta.project_group != none {meta.project_group} else {""}
        )
    )

    // **** APPLY GLOBAL STYLES ****
    show: apply_styles(localisation, meta)  // Now wraps all content below

    // **** INITIALIZE CODLY ****
    show: codly-init.with()
    
    // Configure codly styling to match AAU theme
    codly(
        languages: (
            python: (name: "Python", color: theme_aau.blue),
            rust: (name: "Rust", color: theme_aau.blue),
            javascript: (name: "JavaScript", color: theme_aau.blue),
            typescript: (name: "TypeScript", color: theme_aau.blue),
            java: (name: "Java", color: theme_aau.blue),
            c: (name: "C", color: theme_aau.blue),
            cpp: (name: "C++", color: theme_aau.blue),
            csharp: (name: "C#", color: theme_aau.blue),
            bash: (name: "Bash", color: theme_aau.blue),
            sql: (name: "SQL", color: theme_aau.blue),
        ),
    )
    
    // Set codly appearance
    codly(
        number-format: (number) => text(fill: theme_aau.blue, str(number)),
        zebra-fill: theme_aau.light_blue_opaque,
        stroke: 1pt + theme_aau.blue,
    )

    // **** FRONT MATTER ****
    set page(numbering: "I", number-align: center)

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
        table_of_contents(settings)
    }

    // **** MAIN BODY ****
    place(hide[#heading(level: 2, outlined: false, bookmarked: false, numbering: none)[] <body-start>])
    
    set page(
        numbering: "1", 
        number-align: center,
        header: page_header(meta)
    )
    counter(page).update(1)

    // Apply body heading styles
    show: apply_body_heading_styles()
    
    body

    place(hide[#heading(level: 2, outlined: false, bookmarked: false, numbering: none)[] <body-end>])

    // **** BIBLIOGRAPHY ****
    show bibliography: body => {
        counter(heading).step()
        body
    }
    
    pagebreak(weak: true)
    
    show heading.where(level: 1): h => {
        v(par_spacing, weak: true)
        align(center, text(font: sans-font, 3em, weight: "extrabold", fill: theme_aau.blue)[References])
        v(1em)
        v(par_text_spacing, weak: true)
    }
    
    bibliography(settings.bibs, title: "References", style: "springer-vancouver")

    // **** APPENDIX ****
    if settings.qappendix {
        show: apply_appendix_styles()
        
        set page(numbering: "A", number-align: center)
        counter(page).update(1)

        set heading(numbering: "A.1")
        counter(heading).update(0)

        pagebreak(weak: true)
        align(center, text(font: sans-font, 3em, weight: "extrabold", fill: theme_aau.blue)[Appendices])
        v(0em)
        include settings.appendix
    }
}