#import "template.typ": *

#show: doc.with(
  meta: (
    title: "AAU Typst Template Documentation",
    subtitle: "Configuration Reference Guide",
    theme: none,
    project_type: "Template Documentation",
    project_period: none,
    project_group: none,
    participants: (
      (name: "Template Contributors", email: ""),
    ),
    supervisors: (),
    university: "Aalborg University",
    university_link: link("https://www.aau.dk"),
    faculty: none,
    faculty_link: none,
    department: "Computer Science",
    department_link: link("https://cs.aau.dk"),
    link_name: "GitHub",
    link: link("https://github.com/Naitsabot/AAU-Typst-Template"),
    date: datetime.today(),
    copyright_holder: "AAU Typst Template Contributors",
    copyright_text: none,
    colophon: "This documentation was generated using the AAU Typst Template itself.",
    abstract: "This document provides comprehensive documentation for all configuration options available in the AAU Typst Template, including metadata fields and settings parameters.",
    preface: "This documentation is designed to help users understand and customize the AAU Typst Template for their academic reports and documents.",
  ),

  localisation: (lang: "en", region: "gb"),

  settings: (
    bibs: ("//sources.bib"),
    appendix: "//assets/appendix.typ",
    qcover: true,
    qcovertype2: false,
    qcolophon: true,
    qabstract: true,
    qsignature: false,
    qpreface: true,
    qtableofcontents: true,
    qappendix: false,
    signature_columns: auto,
    signature_line_length: 100%,
    signature_spacing: 5em,
    logo_path: "//assets/AAU/aau_logo_en.svg",
    logo_width: 50%,
    availability_notice: "The content of this report is freely available, but publication (with reference) may only be pursued after agreement with the author.",
    show_page_numbers: true,
  ),
)

= Introduction

This document provides complete documentation for the AAU Typst Template configuration system. The template uses two main configuration dictionaries: `meta` for document metadata and `settings` for template behavior.

= Metadata Configuration (`meta`)

The `meta` dictionary contains all document-specific information that appears throughout your document, including cover pages, abstract pages, and headers.

== Basic Document Information

=== `title` (Required)
*Type:* String \
*Default:* `"Document Title"` \
*Description:* The main title of your document. Appears on the cover page, abstract page, and document metadata.

*Example:*
```typ
title: "Machine Learning in Embedded Systems"
```

=== `subtitle` (Optional)
*Type:* String \
*Default:* `"Document Subtitle"` \
*Description:* A subtitle or secondary title for your document. Appears below the main title on the cover page.

*Example:*
```typ
subtitle: "A Comparative Analysis of TensorFlow Lite and ONNX Runtime"
```

=== `theme` (Optional)
*Type:* String or `none` \
*Default:* `none` \
*Description:* The academic theme or topic area of your project. Only appears on the abstract page if provided.

*Example:*
```typ
theme: "Artificial Intelligence and Embedded Systems"
```

== Project Information

=== `project_type` (Required)
*Type:* String \
*Default:* `"Project Type"` \
*Description:* The type of academic work (e.g., Bachelor's Thesis, Master's Thesis, Semester Project).

*Example:*
```typ
project_type: "Master's Thesis"
```

=== `project_period` (Optional)
*Type:* String or `none` \
*Default:* `none` \
*Description:* The academic period when the project was conducted.

*Example:*
```typ
project_period: "Spring 2026"
```

=== `project_group` (Optional)
*Type:* String or `none` \
*Default:* `none` \
*Description:* Your project group identifier or course code.

*Example:*
```typ
project_group: "cs-26-sw-6-12"
```

== People

=== `participants` (Required)
*Type:* Array of dictionaries with `name` and `email` keys \
*Default:* `()` (empty array) \
*Description:* List of all authors/participants in the project. Appears on cover page, abstract page, and optionally in signature section.

*Example:*
```typ
participants: (
    (name: "Alice Johnson", email: "alice@student.aau.dk"),
    (name: "Bob Smith", email: "bob@student.aau.dk"),
    (name: "Carol Davis", email: "carol@student.aau.dk"),
)
```

=== `supervisors` (Optional)
*Type:* Array of dictionaries with `name` and `email` keys \
*Default:* `()` (empty array) \
*Description:* List of all supervisors or advisors for the project.

*Example:*
```typ
supervisors: (
    (name: "Dr. Jane Professor", email: "janep@aau.dk"),
    (name: "Dr. John Lecturer", email: "johnl@aau.dk"),
)
```

== Institution Information

=== `university` (Required)
*Type:* String \
*Default:* `"Aalborg University"` \
*Description:* The name of your university or institution. Appears in headers and document metadata.

*Example:*
```typ
university: "Technical University of Denmark"
```

=== `university_link` (Optional)
*Type:* Link or `none` \
*Default:* `link("https://www.aau.dk")` \
*Description:* Website link for your university.

*Example:*
```typ
university_link: link("https://www.dtu.dk")
```

=== `faculty` (Optional)
*Type:* String or `none` \
*Default:* `none` \
*Description:* The faculty name. Only appears on abstract page if provided.

*Example:*
```typ
faculty: "Faculty of Engineering and Science"
```

=== `faculty_link` (Optional)
*Type:* Link or `none` \
*Default:* `none` \
*Description:* Website link for your faculty.

*Example:*
```typ
faculty_link: link("https://www.en.aau.dk")
```

=== `department` (Optional)
*Type:* String or `none` \
*Default:* `none` \
*Description:* Your department name. Appears on cover page and abstract page if provided.

*Example:*
```typ
department: "Computer Science"
```

=== `department_link` (Optional)
*Type:* Link or `none` \
*Default:* `none` \
*Description:* Website link for your department.

*Example:*
```typ
department_link: link("https://cs.aau.dk")
```

== Custom Links

=== `link_name` (Optional)
*Type:* String or `none` \
*Default:* `none` \
*Description:* Label for a custom link (e.g., "GitHub", "Project Website", "Repository"). Only appears if both `link_name` and `link` are provided.

*Example:*
```typ
link_name: "Project Repository"
```

=== `link` (Optional)
*Type:* Link or `none` \
*Default:* `none` \
*Description:* The URL for your custom link. Only appears if both `link_name` and `link` are provided.

*Example:*
```typ
link: link("https://github.com/username/project")
```

== Dates and Copyright

=== `date` (Required)
*Type:* Datetime \
*Default:* `datetime.today()` \
*Description:* The completion or submission date of your document.

*Example:*
```typ
date: datetime(year: 2026, month: 6, day: 15)
```

=== `copyright_holder` (Optional)
*Type:* String or `none` \
*Default:* `"Aalborg University"` \
*Description:* The entity that holds copyright for the document. Used in the colophon page to generate default copyright text.

*Example:*
```typ
copyright_holder: "Project Group CS-26-SW-6-12"
```

=== `copyright_text` (Optional)
*Type:* String or `none` \
*Default:* `none` \
*Description:* Custom copyright text. If provided, overrides the default copyright message generated from `copyright_holder`.

*Example:*
```typ
copyright_text: "Copyright © 2026 Alice Johnson, Bob Smith. All rights reserved."
```

== Content Sections

=== `colophon` (Optional)
*Type:* String \
*Default:* `""` (empty string) \
*Description:* Additional information about document production, tools used, acknowledgments, etc. Appears on the colophon page.

*Example:*
```typ
colophon: "This document was typeset using Typst. Simulations were performed using Python 3.11 with NumPy and SciPy. Figures were created using Matplotlib and TikZ. Special thanks to the AAU Computer Science department for their support."
```

=== `abstract` (Required)
*Type:* String or content \
*Default:* `""` (empty string) \
*Description:* The abstract of your document. Appears on the abstract page.

*Example:*
```typ
abstract: "This thesis investigates the performance of machine learning inference on embedded systems. We compare TensorFlow Lite and ONNX Runtime across three different hardware platforms, measuring latency, throughput, and energy consumption. Results show that ONNX Runtime achieves 23% lower latency on ARM Cortex-M7 processors."
```

=== `preface` (Optional)
*Type:* String or content \
*Default:* `""` (empty string) \
*Description:* The preface of your document. Appears on the preface page if enabled.

*Example:*
```typ
preface: "This project was conducted during the spring semester of 2026 as part of our Master's degree in Computer Science at Aalborg University. We would like to thank our supervisors for their guidance and the embedded systems lab for providing access to testing equipment."
```

= Settings Configuration (`settings`)

The `settings` dictionary controls the behavior and appearance of the template itself.

== File Paths

=== `bibs` (Required)
*Type:* String or Array of strings \
*Default:* `("//sources.bib")` \
*Description:* Path(s) to your bibliography file(s) in BibTeX format.

*Example:*
```typ
bibs: ("//references/main.bib", "//references/extra.bib")
```

=== `appendix` (Optional)
*Type:* String or `none` \
*Default:* `"//assets/appendix.typ"` \
*Description:* Path to your appendix content file. Only loaded if `qappendix` is `true`.

*Example:*
```typ
appendix: "//chapters/appendices.typ"
```

== Page Toggles

These boolean settings control which pages appear in your document.

=== `qcover` (Optional)
*Type:* Boolean \
*Default:* `true` \
*Description:* Whether to include the cover page.

=== `qcovertype2` (Optional)
*Type:* Boolean \
*Default:* `false` \
*Description:* Use alternative cover page style with image. Only applies if `qcover` is `true`.

=== `qcolophon` (Optional)
*Type:* Boolean \
*Default:* `true` \
*Description:* Whether to include the colophon page (copyright and production information).

=== `qabstract` (Optional)
*Type:* Boolean \
*Default:* `true` \
*Description:* Whether to include the abstract and project information page.

=== `qpreface` (Optional)
*Type:* Boolean \
*Default:* `true` \
*Description:* Whether to include the preface page.

=== `qsignature` (Optional)
*Type:* Boolean \
*Default:* `true` \
*Description:* Whether to include signature lines on the preface page. Only applies if `qpreface` is `true`.

=== `qtableofcontents` (Optional)
*Type:* Boolean \
*Default:* `true` \
*Description:* Whether to include the table of contents.

=== `qappendix` (Optional)
*Type:* Boolean \
*Default:* `true` \
*Description:* Whether to include appendices.

== Signature Configuration

=== `signature_columns` (Optional)
*Type:* Integer or `auto` \
*Default:* `auto` \
*Description:* Number of columns for signature layout. `auto` automatically chooses based on participant count (max 3 columns).

*Example:*
```typ
signature_columns: 2  // Force 2 columns regardless of participant count
```

=== `signature_line_length` (Optional)
*Type:* Length (relative or absolute) \
*Default:* `100%` \
*Description:* Length of the signature line.

*Example:*
```typ
signature_line_length: 80%  // Shorter signature lines
```

=== `signature_spacing` (Optional)
*Type:* Length \
*Default:* `5em` \
*Description:* Vertical spacing between rows of signatures.

*Example:*
```typ
signature_spacing: 3em  // Tighter spacing
```

== Abstract Page Configuration

=== `logo_path` (Optional)
*Type:* String or `none` \
*Default:* `"//assets/AAU/aau_logo_en.svg"` \
*Description:* Path to institutional logo for the abstract page. Set to `none` to hide logo.

*Example:*
```typ
logo_path: "//assets/custom_logo.png"
```

=== `logo_width` (Optional)
*Type:* Length (relative or absolute) \
*Default:* `50%` \
*Description:* Width of the logo on the abstract page.

*Example:*
```typ
logo_width: 40%
```

=== `availability_notice` (Optional)
*Type:* String or `none` \
*Default:* `"The content of this report is freely available, but publication (with reference) may only be pursued after agreement with the author."` \
*Description:* Notice text at the bottom of the abstract page. Set to `none` to hide.

*Example:*
```typ
availability_notice: "This document is confidential and for internal use only."
```

=== `show_page_numbers` (Optional)
*Type:* Boolean \
*Default:* `true` \
*Description:* Whether to display page count on the abstract page.

*Example:*
```typ
show_page_numbers: false
```

= Complete Configuration Example

Here's a complete example showing all configuration options:

```typ
#import "template.typ": *

#show: doc.with(
  meta: (
    // Basic information
    title: "Advanced Machine Learning Techniques",
    subtitle: "Applications in Computer Vision",
    theme: "Artificial Intelligence",
    project_type: "Master's Thesis",
    project_period: "Spring 2026",
    project_group: "cs-26-sw-6-12",
    
    // People
    participants: (
      (name: "Alice Johnson", email: "alice@student.aau.dk"),
      (name: "Bob Smith", email: "bob@student.aau.dk"),
    ),
    supervisors: (
      (name: "Dr. Jane Professor", email: "janep@aau.dk"),
    ),
    
    // Institution
    university: "Aalborg University",
    university_link: link("https://www.aau.dk"),
    faculty: "Technical Faculty of IT and Design",
    faculty_link: link("https://www.tech.aau.dk/"),
    department: "Computer Science",
    department_link: link("https://cs.aau.dk"),
    
    // Custom link
    link_name: "GitHub",
    link: link("https://github.com/alice/ml-project"),
    
    // Dates and copyright
    date: datetime(year: 2026, month: 6, day: 15),
    copyright_holder: "Project Group CS-26-SW-6-12",
    copyright_text: none,
    
    // Content
    colophon: "Typeset with Typst. Experiments run on Python 3.11.",
    abstract: "This thesis explores deep learning for image classification...",
    preface: "We thank our supervisors for their guidance...",
  ),

  localisation: (
    lang: "en",
    region: "gb",
  ),

  settings: (
    // File paths
    bibs: ("//sources.bib"),
    appendix: "//assets/appendix.typ",
    
    // Page toggles
    qcover: true,
    qcovertype2: false,
    qcolophon: true,
    qabstract: true,
    qpreface: true,
    qsignature: true,
    qtableofcontents: true,
    qappendix: true,
    
    // Signature configuration
    signature_columns: auto,
    signature_line_length: 100%,
    signature_spacing: 5em,
    
    // Abstract page configuration
    logo_path: "//assets/AAU/aau_logo_en.svg",
    logo_width: 50%,
    availability_notice: "The content of this report is freely available...",
    show_page_numbers: true,
  ),
)

= Introduction

Your document content begins here...
```

= Tips and Best Practices

== Minimal Configuration

You can omit most fields and use defaults. Here's a minimal example:

```typ
#show: doc.with(
  meta: (
    title: "My Report",
    subtitle: "A Short Study",
    project_type: "Semester Project",
    participants: (
      (name: "Your Name", email: "you@student.aau.dk"),
    ),
    abstract: "This report examines...",
    preface: "This project was completed...",
  ),
)
```

== Optional Fields

Set fields to `none` or empty strings to hide them:

```typ
meta: (
  theme: none,              // Won't appear on abstract page
  project_period: none,     // Won't appear
  link_name: none,          // No custom link shown
  link: none,
)
```

== Multiple Institutions

For non-AAU institutions, customize all institution fields:

```typ
meta: (
  university: "Technical University of Denmark",
  university_link: link("https://www.dtu.dk"),
  faculty: "Faculty of Engineering",
  department: "Applied Mathematics and Computer Science",
  copyright_holder: "Technical University of Denmark",
)

settings: (
  logo_path: "//assets/dtu_logo.svg",
)
```

== Confidential Documents

For confidential or internal documents:

```typ
settings: (
  availability_notice: "CONFIDENTIAL - For internal use only. Do not distribute.",
)
```

= Localization

The template supports localization through the `localisation` dictionary:

```typ
localisation: (
  lang: "da",    // Danish language
  region: "dk",  // Denmark region
)
```

Common language codes:
- `"en"` - English
- `"da"` - Danish
- `"de"` - German
- `"fr"` - French

This affects date formatting and hyphenation.

= Troubleshooting

== Missing Images

If logo or cover images don't appear, check:
1. File path uses `//` for absolute paths from project root
2. Image file exists at specified location
3. Image format is supported (SVG, PNG, JPG)

== Empty Fields Showing

If optional fields show as empty, ensure they're set to `none` rather than empty string:

```typ
// Wrong - shows empty
theme: ""

// Correct - hidden
theme: none
```

== Bibliography Not Showing

Ensure:
1. Bibliography file path is correct
2. You have citations in your document (use `@citation-key`)
3. Bibliography file is valid BibTeX format

= Advanced Customization

For deeper customization, you can modify the template modules:

- `lib/config.typ` - Theme colors, fonts, spacing
- `lib/styles.typ` - Document styling (headings, code blocks, etc.)
- `lib/pages.typ` - Page layouts
- `lib/components.typ` - Reusable components
- `lib/helpers.typ` - Utility functions

Refer to the module source files for detailed customization options.
