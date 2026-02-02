// AAU Typst Template - Page Layouts

#import "config.typ": *
#import "helpers.typ": get-body-page-count

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