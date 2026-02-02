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
    theme: "Document Theme",
    project_type: "Project Type",
    project_period: "Semester Year",
    project_group: "Group ID",
    participants: (),
    supervisors: (),
    university: "Aalborg University",
    university_link: link("https://www.aau.dk"),
    faculty: "The Technical Faculty of IT and Design",
    faculty_link: link("https://www.tech.aau.dk/"),
    department: "Computer Science",
    department_link: link("https://cs.aau.dk"),
    github_link: none,
    date: datetime.today(),
    colophon: "",
    abstract: "",
    preface: "",
)


