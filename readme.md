# AAU Typst Template (Naitsa)
AAU report template written in typst. It has a lot of cosumizability.

Short ieee paper template, with info page and summary page.

## Quick-start Guide for Online Usage (Fingle file Tempalte)
> _**This is the recommended option** becuase of restrictions on the number of files online useres can have in a project, in the free tier of the Typst Online App._
> ! USES ONLINE FONTS, if running in local project, modify fonts or have fonts available.

Copy all the contents of the folder `aau-quick-report/` into your project.

Should look like this: \
![aTypst Online directory for report](docs/typstonlinedir-report.png)

## Full Template (modulised)
Reccomneded if you want it. It is much easier to modify the template, as it is split into multiple modules.
The single file tamplate is a concatened version of the modulised template.

Simply copy the contents the `aau-report/` into any project. (Its template root is in `aau-report/` in this repo).

## ieee Paper with AAU Styled Info Section and Summary Page
> ! USES ONLINE FONTS, if running in local project, modify fonts or have fonts available.

Uses the ieee paper template from Typst, and adds the loved info page, and a the required sumamry.

To use, copy the content of the folder `aau-ieee-paper` into the online app / or other project. (The root of the template is in `aau-ieee-paper/` in this repo). 

Should look like this: \
![Typst Online directory for paper](docs/typstonlinedir-paper.png)




## The Look of it All

FONTS: In the template, under `configs.typ` (or by searching for “FONT CONFIGURATION”), the fonts can be modified.

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
Cover page: \
![report coverpage](docs/report-coverpage.png)

Alternative cover page: \
![report coverpage alt](docs/report-coverpage-alt.png)

Colophon page: \
![report colophon page](docs/report-colophon.png)

Info and abstract page: \
![report info and abstract page](docs/report-info.png)

Preface: \
![report preface page](docs/report-preface.png)

Table of contents page
![report table of contents page](docs/report-toc.png)

#### Main Content Pages

There is a lot of styling that can be shown, but this is the main gist of it.

![report main content page style](docs/report-main-content.png)

#### Back Matter Pages

Bibliography/References pages (other styles exists): \
![repoort reReferences pages](docs/report-ref.png)

Appendices pages: \
![report appendices pages](docs/report-apx.png)

### Paper

Info and abstract page: \
![paper info and abstract page](docs/paper-info.png)

Summary page: \
![apaper summary page](docs/paper-summary.png)

Main content ieee paper pages: \
![paper ieee main content pages](docs/paper-ieee.png)



## Attribution

This project was originally based on [AAU Typst Template](https://github.com/krestenlaust/AAU-Typst-Template)
by Kresten Laust, licensed under MIT License. It has since
evolved into an independent project with significant modifications and coding practices.
