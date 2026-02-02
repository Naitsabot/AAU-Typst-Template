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
        bibs: ("//sources.bib"),
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
