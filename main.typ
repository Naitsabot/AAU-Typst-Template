// AAU Typst Template - User-facing Document File

#import "//template.typ": * // document template

#show: doc.with(
  meta: (
        title: "This is a Title, and it can be Quite Long if That's What You're Into",
        subtitle: "Here is the subtitle",
        theme: "The Theme of the Paper",
        project_type: "Bachelor's Semester Project",
        project_period: "Fall 2025",
        project_group: "cs-25-sw-5-04",
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
        link_name: "GitHub Organisation",  // Optional custom link
        link: link("https://github.com/YourUsername"),  // Optional custom link
        date: datetime.today(),
        copyright_holder: "Aalborg University", // set as none, for no copyright
        copyright_text: none,  // Custom copyright text (overrides default if set)
        colophon: "This document was typeset using Typst and compiled with the AAU template.",
        abstract: "Your abstract goes here. Around 190 words should be the limit of its length. Otherwise it is just too long and fills too much space.",
        preface: "Your preface goes here. A preview of your writing that introduces you as its author. It can also be used to give praise and dedications to people or organizations",
    ),

    localisation: (
        lang: "en", 
        region: "gb"
    ),

    settings: (
        bibs: ("//sources.bib"),
        appendix: "//assets/appendix.typ",
        
        // Page toggles
        qcover: true,
        qcovertype2: false,
        qcolophon: true,
        qabstract: true,
        qsignature: true,
        qpreface: true,
        qtableofcontents: true,
        qappendix: true,
        
        // Customize signature layout
        signature_columns: 2,  // Force 2 columns
        signature_line_length: 80%,
        signature_spacing: 5em,
    ),
)

// Uncomment the following, to render with no refrences. all refrences becomes "?".
//#show: no-ref


/* 
 * Your content goes here :)
 */

= Welcome

This template provides a comprehensive formatting solution for AAU reports, including automated styling, page layouts, and document components.

The key features are summarized in @tab:template_fetaures.

#figure(
    table(
        columns: 2,
        [Thing],[Explanation],
        [Theme],[Theme colors (AAU) \ Font definitions \ Spacing constants \ ],
        [Styling],[Text and font styling \ Heading styles (all levels 1-4) \ Link and reference styling \ Code block styling (inline and block) \ Math equation styling \ List and table styling \ Quote styling \ Footnote styling \ Citation styling],
        [Page layouts],[Cover page, alternative cover page, copyright/colophon, abstract/project into, preface/signatures],
        [Components],[Header component (with hydra integration) \ Footer component \ Figure numbering system \ Chapter styling component \ Body markers for page counting \ Reusable layout components ],
    )
) <tab:template_fetaures>
