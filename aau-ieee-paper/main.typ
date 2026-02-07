#import "@preview/charged-ieee:0.1.4": ieee

// *******************************************************
// COMMON VARIABLES ACROSS INFO PAGE AND THE ACTUAL PAAPER
// *******************************************************

#let title = "Paper Title Here"
#let participants = (
    (
      name: "Author 1",
      department: [Department of Computer Science],
      location: [Aalborg University, Denmark],
      email: "author1@student.aau.dk"
    ),
    (
      name: "Author 2",
      department: [Department of Computer Science],
      location: [Aalborg University, Denmark],
      email: "author2@student.aau.dk"
    ),
    (
      name: "Author 3",
      department: [Department of Computer Science],
      location: [Aalborg University, Denmark],
      email: "author3@student.aau.dk"
    ),
    (
      name: "Author 4",
      department: [Department of Computer Science],
      location: [Aalborg University, Denmark],
      email: "author4@student.aau.dk"
    ),
).sorted(key: it => (it.name))

#let supervisors = (
    (name: "Supervisor Name", email: "supervisor@aau.dk"),
).sorted(key: it => (it.name))

// ABSTRACT GUIDE: Summarizes the entire paper in 150-250 words.
// Include: problem context, your approach, key results, and significance.
// No citations, past tense for completed work.

#let abstract = "Summarizes the entire paper in 150-250 words. Include: problem context, your approach, key results, and significance. No citations, past tense for completed work."


// *******************************************************
// INFO PAGE
// *******************************************************

#let info_field(label, value, label_font: "Source Sans Pro", value_font: "Barlow") = {
    if value != none and value != "" [
        #text(font: label_font, 1em, weight: "extrabold")[#label:]\
        #text(font: value_font, 1em, weight: "regular")[#value]
    ]
}

#page[
    #grid(
        columns: (100%),
        rows: (60%, 37.5%, 2.5%),
        
        // Main content grid
        grid(
            columns: (49%, 2%, 49%),
            rows: (100%),
            
            // Left column - Project information
            box(width: 100%, height: 100%)[
                #info_field("Title", title)

                #info_field("Theme", "Cyber ​​Physical Systems ") 

                #info_field("Project Period", "Spring 2026")
                
                #info_field("Project Type", "6th Semesters Bachelor Project")
                
                #info_field("Project Group", "Group XX")

                #if participants.len() > 0 [
                    #info_field("Participant(s)", participants.map(e => e.name).join("\n"))
                ]
                
                #if supervisors.len() > 0 [
                    #info_field("Supervisor(s)", supervisors.map(e => e.name).join("\n"))
                ]
                
                #info_field("GitHub Organisation", "[Organization Name]")
                
                #info_field("Page Numbers", "IDK MAAAAN")
                
                #info_field("Date of Completion", datetime.today().display())
            ],
            
            // Spacer column
            [],
            
            // Right column - Department info and abstract
            box(width: 100%, height: 100%)[
                #info_field("University", "Aalborg University")
                
                #info_field("The Technical Faculty of IT and Design", "https://www.tech.aau.dk/")
                
                #info_field("Department of Computer Science", "https://cs.aau.dk")

                #set par(justify: true)
                #info_field("Abstract", abstract)
            ]
        ),
        
        // Logo
        {
            align(center + horizon, image("//aau_logo_en.svg", width: 50%))
        },
        
        // Availability notice
        {
            text(font: "Barlow", .75em, style: "italic", weight: "regular", "The content of this report is freely available, but publication (with reference) may only be pursued after agreement with the author.")
        }
    )
]


// *******************************************************
// SUMMARY PAGE
// *******************************************************

#context[
#set text(font: "Barlow")
#show heading.where(level:1): set text(font: "Source Sans Pro", 2em)
/* #set page(margin: (
  top: 3cm,
  bottom: 3cm,
  x: 3cm,
)) */
= Summary

Provide a summary of your paper here. This should capture the essence of your work, including the problem, approach, key findings, and implications.

]

// *******************************************************
// THE ACTUAL PAAPER
// *******************************************************

#show: ieee.with(
  title: title,
  abstract: abstract,
  authors: participants,
  //index-terms: ("a", "b"),
  bibliography: bibliography("refs.bib"),
  paper-size: "a4",
  figure-supplement: [Fig.],
)


= Introduction

Introduce the problem domain and establish the context. Explain why this research is important and what gap you're addressing. Clearly state your research question or objective. Finally, outline the structure of the paper.

== Structure of papers 
A paper can be structured in a variaity of ways, and this is just one of them.

= Related Works

= Method

= Experiments/Results

= Conclusion
