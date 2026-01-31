#import "//template.typ": * // Import of all templating content

= Introduction
Getting started with Typst shouldn't be that difficult. The language is pretty similar to JavaScript #footnote([A programming language which is known for its incredible type system!]). It is also pretty similar to writing in Markdown.

This showcase is meant as a guide in some basic typst functionallity. Have the Typst file (editor) open togehter with the generated document (preview) to see how things work.

== Getting Started
You can start by modifying this template, or using the empty report template.

=== Write Typst Collaboratively
You can use #link("https://typst.app/")[Typst.app] to write collaboratively. Just download #link("https://github.com/Naitsabot/AAU-Typst-Template/")[this project] as zip, and upload either template to the empty typst project.

== Other Functions
This is the lorem ipsum function, it can be useful to get a sense of the layout: \
#lorem(20)

== Usage

The `main.typ` contains a bunch of settings for the document. These are outlined in @tab:settings.

#figure(
  table(
    columns: (auto, 1fr),
    
    fill: (_, row) => if calc.odd(row) {
      theme_aau.light_blue_opaque
    } else if row == 0 {
      theme_aau.light_blue
    },
    
    align: (col, row) => {
      if row > 0 { left } 
      else       { center }
    },
    
    [*Setting*], [*Description*],
    [`meta.title`], [Main title of the document],
    [`meta.subtitle`], [Subtitle of the document],
    [`meta.theme`], [Theme or topic of the paper],
    [`meta.project_type`], [Type of project (e.g., "Bachelor's Semester Project")],
    [`meta.project_period`], [Time period of the project],
    [`meta.project_group`], [Project group identifier],
    [`meta.participants`], [Array of participants with name and email],
    [`meta.supervisors`], [Array of supervisors with name and email],
    [`meta.university`], [University name],
    [`meta.faculty`], [Faculty name],
    [`meta.department`], [Department name],
    [`meta.date`], [Date of the document],
    [`meta.colophon`], [Information about tools and software used],
    [`meta.abstract`], [Abstract text (around 190 words)],
    [`meta.preface`], [Preface text],
    [`localisation.lang`], [Language code (e.g., "en" for English)],
    [`localisation.region`], [Region code (e.g., "gb" for Great Britain)],
    [`settings.bibs`], [Path(s) to bibliography files],
    [`settings.appendix`], [Path to appendix file],
    [`settings.qcover`], [Show cover page (true/false)],
    [`settings.qcovertype2`], [Use alternative cover style (true/false)],
    [`settings.qcolophon`], [Show colophon page (true/false)],
    [`settings.qabstract`], [Show abstract page (true/false)],
    [`settings.qabstractgithub`], [Show GitHub link on abstract (true/false)],
    [`settings.qsignature`], [Show signature page (true/false)],
    [`settings.qpreface`], [Show preface page (true/false)],
    [`settings.qtableofcontents`], [Show table of contents (true/false)],
    [`settings.qappendix`], [Show appendix (true/false)],
  ),
  caption: [Document settings in main.typ]
) <tab:settings>

