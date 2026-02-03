// AAU Typst Template - Page Layouts

#import "config.typ": *
#import "helpers.typ": get-body-page-count, info_field

// Cover page with waves background
#let page_cover(meta) = {
    page(
        background: image("//assets/AAU/aau_waves.svg", width: 100%, height: 100%), 
        numbering: none,
    )[
        #grid(
            columns: (100%), 
            rows: (50%, 25%, 25%),
            
            // Title box
            align(center + bottom)[
                #box(
                    fill: theme_aau.blue, 
                    inset: 18pt, 
                    radius: 1pt, 
                    width: 100%,
                )[
                    #set par(justify: false)
                    #set text(fill: white, 12pt)
                    #set align(center)
                    
                    #text(font: sans-font, 3em, weight: "extrabold")[#meta.title]\
                    
                    #if meta.subtitle != none and meta.subtitle != "" [
                        #text(font: body-font, 1.5em, weight: "regular")[#meta.subtitle]\ \
                    ] else [
                        \
                    ]
                    
                    #if meta.department != none and meta.department != "" [
                        #text(font: sans-font, 1.5em, weight: "extrabold")[Department of ]
                        #text(font: sans-font, 1.5em, weight: "extrabold")[#meta.department]\
                    ]
                    
                    #if (meta.project_group != none and meta.project_group != "") or (meta.project_period != none and meta.project_period != "") [
                        #let parts = ()
                        #if meta.project_group != none and meta.project_group != "" {
                            parts.push(meta.project_group)
                        }
                        #if meta.project_period != none and meta.project_period != "" {
                            parts.push(meta.project_period)
                        }
                        #text(font: body-font, 1.5em, weight: "regular")[#parts.join(" | ")]\
                    ]
                    
                    #text(font: sans-font, 1.5em, weight: "extrabold")[#meta.project_type]
                ]
            ],
            
            // Spacer
            [],
            
            // Logo
            align(center)[
                #image("//assets/AAU/aau_logo_circle_en.svg", width: 25%)
            ]
        )
    ]
}

// Cover page with image
#let page_cover_image(meta) = {
    page(
        background: image("//assets/AAU/aau_waves.svg", width: 100%, height: 100%, fit: "cover"), 
        margin: 0em,
        numbering: none,
    )[
        #image("//assets/AAU/frontpageImage.jpg", width: 100%, height: 37%)
        #v(-2%)
        
        #align(center + top)[
            #box(
                fill: white, 
                inset: 18pt, 
                radius: 1pt, 
                width: 100%,
            )[
                #set par(justify: false)
                #set text(fill: theme_aau.blue, 12pt)
                #set align(center)
                
                #text(font: sans-font, 3em, weight: "extrabold")[#meta.title]\
                
                #if meta.subtitle != none and meta.subtitle != "" [
                    #text(font: body-font, 1.5em, weight: "regular")[#meta.subtitle]\ \
                ] else [
                    \
                ]
                
                #if meta.department != none and meta.department != "" [
                    #text(font: sans-font, 1.5em, weight: "extrabold")[Department of ]
                    #text(font: sans-font, 1.5em, weight: "extrabold")[#meta.department]\
                ]
                
                #if (meta.project_group != none and meta.project_group != "") or (meta.project_period != none and meta.project_period != "") [
                    #let parts = ()
                    #if meta.project_group != none and meta.project_group != "" {
                        parts.push(meta.project_group)
                    }
                    #if meta.project_period != none and meta.project_period != "" {
                        parts.push(meta.project_period)
                    }
                    #text(font: body-font, 1.5em, weight: "regular")[#parts.join(" | ")]\
                ]
                
                #text(font: sans-font, 1.5em, weight: "extrabold")[#meta.project_type]
            ]
        ]
        
        #align(bottom + center)[
            #image("//assets/AAU/aau_logo_circle_en.svg", width: 25%)
        ]
        #v(10%)
    ]
}

// Colophon page
#let page_colophon(meta) = {
    page[
        #set align(bottom)
        #set par(justify: true)
        #set text(font: body-font)
        
        // Copyright section
        #if meta.copyright_text != none [
            #meta.copyright_text
        ] else if meta.copyright_holder != none [
            #let year = meta.date.display("[year]")
            #let holder = meta.copyright_holder
            Copyright © #holder #year
        ]
        
        // Additional colophon text
        #if meta.colophon != none and meta.colophon != "" [
            #meta.colophon
        ]
        
        #v(5em)
    ]
}

// Abstract and information page
#let page_abstract(meta, settings) = {
    page[
        #grid(
            columns: (100%),
            rows: (60%, 37.5%, 2.5%),
            
            // Main content grid
            grid(
                columns: (49%, 2%, 49%),
                rows: (100%),
                
                // Left column - Project information
                box(width: 100%, height: 100%)[
                    #info_field("Title", meta.title)

                    #info_field("Theme", meta.theme) 

                    #info_field("Project Period", meta.project_period)
                    
                    #info_field("Project Group", meta.project_group)
                    
                    #if meta.participants.len() > 0 [
                        #info_field("Participant(s)", meta.participants.map(e => e.name).join("\n"))
                    ]
                    
                    #if meta.supervisors.len() > 0 [
                        #info_field("Supervisor(s)", meta.supervisors.map(e => e.name).join("\n"))
                    ]
                    
                    #if meta.link_name != none and meta.link != none [
                        #info_field(meta.link_name, meta.link)
                    ]
                    
                    #if settings.at("show_page_numbers", default: true) [
                        #info_field("Page Numbers", get-body-page-count())
                    ]
                    
                    #info_field("Date of Completion", meta.date.display())

                    #info_field(meta.faculty, meta.faculty_link)
                ],
                
                // Spacer column
                [],
                
                // Right column - Department info and abstract
                box(width: 100%, height: 100%)[
                    #if meta.department != none and meta.department != "" [
                        #text(font: sans-font, 1em, weight: "extrabold")[Department of ]
                        #info_field(meta.department, meta.department_link)
                    ]
                    
                    // Abstract
                    #text(font: sans-font, 1em, weight: "extrabold")[Abstract:]
                    #set par(justify: true)
                    #meta.abstract
                ]
            ),
            
            // Logo
            {
                let logo_path = settings.at("logo_path", default: "//assets/AAU/aau_logo_en.svg")
                let logo_width = settings.at("logo_width", default: 50%)
                align(center + horizon, image(logo_path, width: logo_width))
            },
            
            // Availability notice
            {
                let notice = settings.at("availability_notice", default: none)
                if notice != none [
                    #align(center)[
                        #set text(font: body-font, .75em, style: "italic", weight: "regular")
                        #notice
                    ]
                ]
            }
        )
    ]
}

// Preface page
#let page_preface(meta, settings) = {
    page[
        #set text(font: body-font)
        #set par(justify: true)
        
        // Preface heading
        #align(center)[
            #text(font: sans-font, 3em, weight: "extrabold", fill: theme_aau.blue)[Preface]
        ]
        
        // Preface content
        #meta.preface
        
        // Signature section (if enabled)
        #if settings.qsignature and meta.participants.len() > 0 {
            let cols = if settings.at("signature_columns", default: auto) == auto {
                calc.min(meta.participants.len(), 3)
            } else {
                settings.signature_columns
            }
            
            [
                #v(1fr)
                #align(center)[
                    #grid(
                        columns: (auto,) * cols,
                        row-gutter: settings.at("signature_spacing", default: 5em),
                        column-gutter: 2em,
                        ..meta.participants.map(participant => [
                            #v(1em)
                            #line(length: settings.at("signature_line_length", default: 100%))
                            #text(font: sans-font, 12pt, participant.name)\
                            #text(font: sans-font, 10pt, participant.email)
                        ])
                    )
                ]
            ]
        }
    ]
}