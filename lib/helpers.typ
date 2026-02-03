// AAU Typst Template - Helper Functions

#import "config.typ": *

// Configure codly for a specific code block
#let code-block(
    lang: none,
    caption: none,
    label: none,
    code
) = {
    figure(
        code,
        caption: caption,
        kind: raw,
        supplement: [Listing]
    )
}

// Helper to create info field
#let info_field(label, value, label_font: sans-font, value_font: body-font) = {
    if value != none and value != "" [
        #text(font: label_font, 1em, weight: "extrabold")[#label:]\
        #text(font: value_font, 1em, weight: "regular")[#value]
    ]
}

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

// Bit field table helper
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

// Trimmed image helper
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

// TeX logo
#let TeX = {
  set text(font: "New Computer Modern", weight: "regular")
  box(width: 1.7em, {
    [T]
    place(top, dx: 0.56em, dy: 0.22em)[E]
    place(top, dx: 1.1em)[X]
  })
}

// LaTeX logo
#let LaTeX = {
  set text(font: "New Computer Modern", weight: "regular")
  box(width: 2.55em, {
    [L]
    place(top, dx: 0.3em, text(size: 0.7em)[A])
    place(top, dx: 0.7em)[#TeX]
  })
}