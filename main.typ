/* 
 * AAU Typst Template - Main Document Configuration
 * 
 * This file is where you configure your document's metadata and settings.
 * Read the comments carefully to understand what each option does.
 */

// ============================================================================
// TEMPLATE IMPORT
// ============================================================================
// DO NOT MODIFY: This imports the AAU template
#import "//template.typ": *

// ============================================================================
// DOCUMENT CONFIGURATION
// ============================================================================
#show: doc.with(
  
  // ==========================================================================
  // METADATA - Information about your document
  // ==========================================================================
  meta: (
        // ----------------------------------------------------------------------
        // BASIC INFORMATION (Required)
        // ----------------------------------------------------------------------
        
        // Main title - appears on cover and throughout document
        title: "This is a Title, and it can be Quite Long if That's What You're Into",
        
        // Subtitle - appears below main title on cover
        subtitle: "Here is the subtitle",
        
        // ----------------------------------------------------------------------
        // PROJECT INFORMATION
        // ----------------------------------------------------------------------
        
        // Theme - academic topic area (set to none to hide)
        theme: "The Theme of the Paper",
        
        // Type of project (e.g., Bachelor's Thesis, Master's Thesis, Semester Project)
        project_type: "Bachelor's Semester Project",
        
        // Academic period (set to none to hide)
        project_period: "Fall 2025",
        
        // Your group identifier (set to none to hide)
        project_group: "cs-25-sw-5-04",
        
        // ----------------------------------------------------------------------
        // PEOPLE
        // ----------------------------------------------------------------------
        
        // List of participants/authors
        // Each entry needs: name and email
        // Add or remove entries as needed
        participants: (
            (name: "Sebastian H. Lorenzen", email: "sed@domain.dk"),
            (name: "Kresten Laust", email: "kre@domain.dk"),
            (name: "Mr. White", email: "whi@domain.dk"),
            (name: "Mr. Orange", email: "ora@domain.dk"),
            (name: "Mr. Blonde", email: "blo@domain.dk"),
            (name: "Mr. Blue", email: "blu@domain.dk"),
        ),
        
        // List of supervisors/advisors
        // Each entry needs: name and email
        // Use empty array () if no supervisors
        supervisors: (
            (name: "Mr Pink", email: "pin@domain.dk"),
            (name: "Mr Typst", email: "typ@domain.dk"),
        ),
        
        // ----------------------------------------------------------------------
        // INSTITUTION INFORMATION
        // ----------------------------------------------------------------------
        
        // University name - appears in headers and metadata
        university: "Aalborg University",
        
        // University website link
        university_link: link("https://www.aau.dk"),
        
        // Faculty name (set to none to hide)
        faculty: "The Technical Faculty of IT and Design",
        
        // Faculty website link
        faculty_link: link("https://www.tech.aau.dk/"),
        
        // Department name (set to none to hide)
        department: "Computer Science",
        
        // Department website link
        department_link: link("https://cs.aau.dk"),
        
        // ----------------------------------------------------------------------
        // CUSTOM LINK (Optional)
        // ----------------------------------------------------------------------
        
        // Label for your custom link (e.g., "GitHub", "Project Website")
        // Both link_name and link must be set for link to appear
        // Set both to none to hide
        link_name: "GitHub Organisation",
        
        // URL for your custom link
        link: link("https://github.com/YourUsername"),
        
        // ----------------------------------------------------------------------
        // DATES AND COPYRIGHT
        // ----------------------------------------------------------------------
        
        // Document date - appears on abstract page
        // Use datetime.today() for current date, or specify:
        // datetime(year: 2025, month: 12, day: 15)
        date: datetime.today(),
        
        // Copyright holder - used in colophon page
        // Set to none for no copyright notice
        copyright_holder: "Aalborg University",
        
        // Custom copyright text - overrides default if set
        // Leave as none to use auto-generated text from copyright_holder
        // Example: "Copyright © 2025 Your Name. All rights reserved."
        copyright_text: none,
        
        // ----------------------------------------------------------------------
        // CONTENT SECTIONS
        // ----------------------------------------------------------------------
        
        // Colophon - additional info about document production
        // (tools used, acknowledgments, etc.)
        colophon: "This document was typeset using Typst and compiled with the AAU template.",
        
        // Abstract - summary of your document
        // Recommended length: ~190 words
        abstract: "Your abstract goes here. Around 190 words should be the limit of its length. Otherwise it is just too long and fills too much space.",
        
        // Preface - introduction from the authors
        // Can include acknowledgments, dedications, etc.
        preface: "Your preface goes here. A preview of your writing that introduces you as its author. It can also be used to give praise and dedications to people or organizations.",
    ),

    // ==========================================================================
    // LOCALIZATION - Language and region settings
    // ==========================================================================
    localisation: (
        // Language code (affects hyphenation and date formatting)
        // Common values: "en", "da", "de", "fr"
        lang: "en", 
        
        // Region code (affects date and number formatting)
        // Common values: "gb", "us", "dk", "de"
        region: "gb"
    ),

    // ==========================================================================
    // SETTINGS - Template behavior and appearance
    // ==========================================================================
    settings: (
        // ----------------------------------------------------------------------
        // FILE PATHS
        // ----------------------------------------------------------------------
        
        // Path to bibliography file(s)
        // Can be single file: ("//sources.bib")
        // Or multiple files: ("//refs/main.bib", "//refs/extra.bib")
        bibs: ("//sources.bib"),
        
        // Path to appendix content file
        // Only used if qappendix is true
        appendix: "//assets/appendix.typ",
        
        // ----------------------------------------------------------------------
        // PAGE TOGGLES
        // These control which pages appear in your document
        // Set to true to include, false to exclude
        // ----------------------------------------------------------------------
        
        // Include cover page
        qcover: true,
        
        // Use alternative cover page style (with image)
        // Only applies if qcover is true
        // Note: Requires image at assets/AAU/frontpageImage.jpg
        qcovertype2: false,
        
        // Include colophon page (copyright and production info)
        qcolophon: true,
        
        // Include abstract and project information page
        qabstract: true,
        
        // Include signature lines on preface page
        // Only applies if qpreface is true
        qsignature: true,
        
        // Include preface page
        qpreface: true,
        
        // Include table of contents
        qtableofcontents: true,
        
        // Include appendices
        qappendix: true,
        
        // ----------------------------------------------------------------------
        // SIGNATURE CONFIGURATION
        // Controls appearance of signature section on preface page
        // Only applies if qsignature is true
        // ----------------------------------------------------------------------
        
        // Number of columns for signature layout
        // Options: auto (max 3 columns based on participant count), 1, 2, 3, etc.
        signature_columns: 2,
        
        // Length of signature line
        // Options: percentage (80%, 100%) or absolute (15cm)
        signature_line_length: 80%,
        
        // Vertical spacing between signature rows
        signature_spacing: 5em,
        
        // ----------------------------------------------------------------------
        // ABSTRACT PAGE CONFIGURATION
        // ----------------------------------------------------------------------
        
        // Path to logo on abstract page
        // Set to none to hide logo
        logo_path: "//assets/AAU/aau_logo_en.svg",
        
        // Width of logo on abstract page
        logo_width: 50%,
        
        // Availability notice at bottom of abstract page
        // Set to none to hide notice
        availability_notice: "The content of this report is freely available, but publication (with reference) may only be pursued after agreement with the author.",
        
        // Show page count on abstract page
        show_page_numbers: true,
    ),
)

// ============================================================================
// SPECIAL FEATURES
// ============================================================================

// Uncomment the following to render with no references (all refs become "?")
// Useful for large documents during initial writing phase
// #show: no-ref

// ============================================================================
// YOUR CONTENT STARTS HERE
// ============================================================================

/* 
 * Write your document content below
 * 
 * Tips:
 * - Use = for level 1 headings (chapters)
 * - Use == for level 2 headings (sections)
 * - Use === for level 3 headings (subsections)
 * - Use ==== for level 4 headings (subsubsections)
 * - Reference figures with @label-name
 * - Cite sources with @citation-key
 */

= Welcome

This template provides a comprehensive formatting solution for AAU reports, including automated styling, page layouts, and document components.

The key features are summarized in @tab:template_features.

#figure(
    table(
        columns: 2,
        fill: (_, row) => if calc.odd(row) {
            theme_aau.light_blue_opaque
        } else if row == 0 {
            theme_aau.light_blue
        },
        align: (col, row) => {
            if row > 0 and col >= 0 { left } 
            else { center }
        },
        [*Thing*], [*Explanation*],
        [Theme], [Theme colors (AAU) \ Font definitions \ Spacing constants],
        [Styling], [Text and font styling \ Heading styles (all levels 1-4) \ Link and reference styling \ Code block styling (inline and block) \ Math equation styling \ List and table styling \ Quote styling \ Footnote styling \ Citation styling],
        [Page layouts], [Cover page \ Alternative cover page \ Copyright/colophon \ Abstract/project info \ Preface/signatures],
        [Components], [Header component (with Hydra integration) \ Footer component \ Figure numbering system \ Chapter styling component \ Body markers for page counting \ Reusable layout components],
    ),
    caption: [Template features overview]
) <tab:template_features>

== Using This Template

=== Basic Structure

Your document is organized into several sections:
1. *Front matter* - Cover, colophon, abstract, preface, table of contents
2. *Body* - Your main content (chapters and sections)
3. *References* - Automatically generated bibliography
4. *Appendices* - Supplementary material

=== Customization

Most customization is done through the `meta` and `settings` dictionaries at the top of this file. Read the comments carefully to understand each option.

For deeper customization (colors, fonts, spacing), edit the files in the `lib/` directory:
- `lib/config.typ` - Theme colors, fonts, default values
- `lib/styles.typ` - Document-wide styling rules
- `lib/pages.typ` - Page layouts (cover, abstract, etc.)
- `lib/components.typ` - Reusable components
- `lib/helpers.typ` - Utility functions

=== Available Colors

You can use AAU theme colors in your content:

#let color-demo(name, color) = box(
    width: 100%,
    fill: color,
    inset: 10pt,
    radius: 3pt,
    text(fill: white, weight: "bold")[#name]
)

#grid(
    columns: 2,
    column-gutter: 1em,
    row-gutter: 1em,
    color-demo("theme_aau.blue", theme_aau.blue),
    color-demo("theme_aau.light_blue", theme_aau.light_blue),
    color-demo("theme_aau.blue_opaque", theme_aau.blue_opaque),
    color-demo("theme_aau.light_blue_opaque", theme_aau.light_blue_opaque),
)

=== Tips and Tricks

*Figures:* Use `#figure()` for images, tables, and code listings. They'll be automatically numbered by chapter.

*References:* Use `@label` to reference figures, tables, or sections. Define labels with `<label-name>`.

*Citations:* Add your references to `sources.bib` and cite with `@citation-key`.

*Math:* Use `$...$` for inline math and `$ ... $` (with newlines) for display math.

*Code:* Use single backticks for inline code `like this` or triple backticks for code blocks.






=== Code Blocks with Codly

This template uses Codly for professional code formatting with line numbers and syntax highlighting.

==== Inline Code

Use single backticks for inline code: `variable_name`, `function()`, or `npm install`. (This is native to Typst, and ahs nothign to do with the Codly package).

==== Basic Code Block

Simply use triple backticks with a language identifier:

```python
def calculate_average(numbers):
    """Calculate the average of a list of numbers."""
    if not numbers:
        return 0
    return sum(numbers) / len(numbers)

# Example usage
scores = [85, 92, 78, 90, 88]
average = calculate_average(scores)
print(f"Average score: {average}")
```

==== Code Block Options

*Without line numbers:*

#codly(number-format: none)
```javascript
const greeting = "Hello, AAU!";
console.log(greeting);
```
#codly(number-format: (number) => text(fill: theme_aau.blue, str(number)))  // set back to default

*Start line numbers at a different line:*

#codly(offset: 42)
```python
def important_function():
    # This starts at line 42
    return "The answer to everything"
```
#codly(offset: 0)  // set back to default

*Without zebra striping:*

#codly(zebra-fill: none)
```rust
fn main() {
    println!("Clean code without stripes");
}
```
#codly(zebra-fill: theme_aau.light_blue_opaque)  // set back to default

*With custom styling:*

#codly(stroke: 2pt + theme_aau.light_blue, zebra-fill: rgb(240, 240, 255))
```java
public class CustomStyle {
    public static void main(String[] args) {
        System.out.println("Different colors!");
    }
}
```
#codly(stroke: 1pt + theme_aau.blue, zebra-fill: theme_aau.light_blue_opaque)  // set back to default

*Without the border:*

#codly(stroke: none)
```python
def no_border_example():
    print("This code block has no border")
    return True
```
#codly(stroke: 1pt + theme_aau.blue) // set back to default




=== Mathematical Expressions

The template supports both native Typst math and LaTeX via MiTeX.

==== Standard Typst Math

Inline: The area of a circle is $A = pi r^2$.

Display:
$ sum_(i=1)^n i = (n(n+1))/2 $

==== LaTeX with MiTeX

Inline using `#mi()`: #mi(`P(A|B) = \frac{P(B|A) \cdot P(A)}{P(B)}`)

Display using `#mitex()`:
#mitex(`\begin{pmatrix}
1 & 0 & 0 \\
0 & 1 & 0 \\
0 & 0 & 1
\end{pmatrix}`)

Use MiTeX when you need advanced LaTeX environments or when copying equations from LaTeX documents.





= Next Chapter

Continue writing your content here...

== A Section

More content...

=== A Subsection

Even more content...

==== A Subsubsection

The deepest level of headings.
