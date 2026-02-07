# AAU Typst Template (Naitsa)

AAU report template written in Typst with extensive customizability.

Includes a short IEEE paper template with info page and summary page.

## Quick-start Guide for Online Usage (Single File Template)
> _**This is the recommended option** because of restrictions on the number of files online users can have in a project in the free tier of the Typst Online App._
> 
> **Note:** Uses online fonts. If running in a local project, modify fonts or ensure fonts are available locally.

Copy all the contents of the folder `aau-quick-report/` into your project.

Should look like this:

![Typst Online directory for report](docs/typstonlinedir-report.png)

## Full Template (Modularized)

Recommended if you want more flexibility. It is much easier to modify the template, as it is split into multiple modules.
The single file template is a concatenated version of the modularized template.

Simply copy all files from the `aau-report/` folder into your project's main folder (where your main.typ file will be).

## IEEE Paper with AAU Styled Info Section and Summary Page

> **Note:** Uses online fonts. If running in a local project, modify fonts or ensure fonts are available locally.

Uses the IEEE paper template from Typst, and adds the AAU info page and required summary.

To use, copy all files from the `aau-ieee-paper/` folder into your project's main folder (where your main.typ file will be).

Should look like this:

![Typst Online directory for paper](docs/typstonlinedir-paper.png)


## Configuration

All configuration for the report template is done in `main.typ`.

All this info is also present in the `main.typ files`!

### Report Template

**Basic Information:**
- `title` - Main document title
- `subtitle` - Document subtitle
- `theme` - Academic topic area (set to `none` to hide)
- `project_type` - Type of project (e.g., "Bachelor's Thesis", "Semester Project")
- `project_period` - Academic period (e.g., "Spring 2026") (set to `none` to hide)
- `project_group` - Group identifier (e.g., "cs-26-sw-6-03") (set to `none` to hide)

**People:**
- `participants` - List of authors with `name` and `email`
- `supervisors` - List of supervisors with `name` and `email`

**Institution:**
- `university` - University name
- `university_link` - University website
- `faculty` - Faculty name (set to `none` to hide)
- `faculty_link` - Faculty website
- `department` - Department name (set to `none` to hide)
- `department_link` - Department website
- `link_name` - Custom link label (e.g., "GitHub") (set to `none` to hide)
- `link` - Custom link URL

**Content:**
- `abstract` - Document summary (~190 words recommended)
- `preface` - Introduction from authors
- `colophon` - Document production info
- `date` - Document date (by default it uses the current date). \
  (Set to some `datetime(year: 2026, month: 6, day: 24)` for static date)

**Page Toggles** (set to `true` or `false`):
- `qcover` - Include cover page
- `qcovertype2` - Use alternative cover with image
- `qcolophon` - Include colophon page
- `qabstract` - Include abstract page
- `qpreface` - Include preface page
- `qsignature` - Include signature lines on preface
- `qtableofcontents` - Include table of contents
- `qappendix` - Include appendices

**File Paths:**
- `bibs` - Bibliography file(s), e.g., `("//sources.bib")`
- `appendix` - Appendix content file, e.g., `"//assets/appendix.typ"`

**Signature configurations:** \
The signature lines can be configured.

**Abstract page configurations:** \
the logo, logo width, the availability notice, and if the number of pages are shown can be changed.

**Codly code block configuration:** \
Controls appearance of code blocks throughout the document.  \
Can also be changed in the template itself.

### Paper Template

Configuration for the IEEE paper template is done in the `main.typ`:
- `title` - Paper title
- `participants` - Authors with `name`, `department`, `location`, `email`
- `supervisors` - Supervisors with `name` and `email`
- `abstract` - Paper abstract (150-250 words)

All info fields on the info/abstract page can be changed removed or added.




## The Look of it All

### Fonts

In the template, under `configs.typ` (or by searching for "FONT CONFIGURATION"), the fonts can be modified.

There are two fonts: the body font for the main text, and the sans font for headings and similar elements.
```typst
// **** FONT CONFIGURATION ****
#let body-font = "Libertinus Serif"
#let sans-font = "New Computer Modern"
```
By default, the template uses “Libertinus Serif” and “New Computer Modern”, as they are bundled with Typst.
For the demonstration, however, the fonts “Barlow” and “Source Sans Pro” (provided by browsers) are used instead, as they better suit the author’s preferences (Naitsabot).

### Report

#### Front Matter Pages
Cover page:

![report coverpage](docs/report-coverpage.png)

Alternative cover page:

![report coverpage alt](docs/report-coverpage-alt.png)

Colophon page:

![report colophon page](docs/report-colophon.png)

Info and abstract page:

![report info and abstract page](docs/report-info.png)

Preface:

![report preface page](docs/report-preface.png)

Table of contents:

![report table of contents page](docs/report-toc.png)

#### Main Content Pages

There is a lot of styling that can be shown, but this is the main gist of it.

![report main content page style](docs/report-main-content.png)

#### Back Matter Pages

Bibliography/References pages (other styles exist):

![report References pages](docs/report-ref.png)

Appendices pages:

![report appendices pages](docs/report-apx.png)

### Paper

Info and abstract page:

![paper info and abstract page](docs/paper-info.png)

Summary page:

![paper summary page](docs/paper-summary.png)

Main content IEEE paper pages:

![paper ieee main content pages](docs/paper-ieee.png)



## Attribution

This project was originally based on [AAU Typst Template](https://github.com/krestenlaust/AAU-Typst-Template) by Kresten Laust, licensed under MIT License. It has since evolved into an independent project with significant modifications and enhanced coding practices.
