/* 
 * AAU Software Typst Template 3.0
 * Modular refactored version
 */

// **** IMPORTS ****
#import "@preview/mitex:0.2.6": *
#import "@preview/cetz:0.4.1"

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
    settings: default_settings,  // Use default_settings here
    body,
) = {
    // **** BASIC DOCUMENT SETTINGS ****
    set document(
        author: meta.participants.map(a => a.name), 
        title: meta.title, 
        keywords: (if meta.university != none {meta.university} else {""}, if meta.faculty != none {meta.faculty} else {""}, if meta.department != none {meta.department} else {""}, if meta.project_group != none {meta.project_group} else {""})
    )

    // **** APPLY GLOBAL STYLES ****
    apply_styles(localisation, meta)

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

    apply_body_heading_styles()
    
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
        align(center, text(font: sans-font, 3em, weight: "extrabold", theme_aau.blue)[References])
        v(1em)
        v(par_text_spacing, weak: true)
    }
    
    bibliography(settings.bibs, title: "References", style: "springer-vancouver")

    // **** APPENDIX ****
    if settings.qappendix {
        apply_appendix_styles()
        
        set page(numbering: "A", number-align: center)
        counter(page).update(1)

        set heading(numbering: "A.1")
        counter(heading).update(0)

        pagebreak(weak: true)
        align(center, text(font: sans-font, 3em, weight: "extrabold", theme_aau.blue)[Appendices])
        v(0em)
        include settings.appendix
    }
}