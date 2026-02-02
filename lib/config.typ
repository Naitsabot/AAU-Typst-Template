// AAU Typst Template - Configuration Module

// **** FONT CONFIGURATION ****
#let body-font = "Libertinus Serif"
#let sans-font = "New Computer Modern"

// **** SPACING CONFIGURATION ****
#let par_spacing = 1.2em
#let par_text_spacing = 0.65em

// **** AAU COLOR THEME ****
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

// **** DEFAULT METADATA STRUCTURE ****
#let default_meta = (
    title: "Document Title",
    subtitle: "Document Subtitle",
    theme: none,  // Optional
    project_type: "Project Type",
    project_period: none,  // Optional
    project_group: none,  // Optional
    participants: (),
    supervisors: (),
    university: "Aalborg University",
    university_link: link("https://www.aau.dk"),
    faculty: none,  // Optional - can be empty string or none
    faculty_link: none,
    department: none,  // Optional
    department_link: none,
    link_name: none,  // Custom link label (e.g., "GitHub", "Project Page")
    link: none,  // Custom link URL
    date: datetime.today(),

    // Colophon configuration
    copyright_holder: "Aalborg University",  // Who holds the copyright
    copyright_text: none,  // Custom copyright text (overrides default if set)
    colophon: "",  // Additional colophon text (tools used, acknowledgments, etc.)

    abstract: "",
    preface: "",
)

// **** DEFAULT SETTINGS STRUCTURE ****
#let default_settings = (
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
    
    // Abstract page configuration
    logo_path: "//assets/AAU/aau_logo_en.svg",
    logo_width: 50%,
    availability_notice: "The content of this report is freely available, but publication (with reference) may only be pursued after agreement with the author.",
    show_page_numbers: true,

    // Signature configuration
    signature_columns: auto,  // auto, 1, 2, 3, etc.
    signature_line_length: 100%,
    signature_spacing: 5em,
)