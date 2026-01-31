# AAU Typst Template (Naitsa)
AAU report template written in typst

## Running

### Running in the Typst Online App

Copy the following files into the online app:
- `main.typ` - This contains you costum configs
- `sources.bib` - for you bibtex soruces
- `template.typ` - Contains the template
- `assets/appendix.typ` - Contains appendix entries
- `assets/AAU/*` - Each AAU grapthic in this folder

E voila

### Running Locally

#### Prerequisites

- [Typst](https://typst.app/) - Install the Typst CLI

#### Compiling the Document

To compile the document to PDF:

```bash
typst compile main.typ
typst compile --font-path ./fonts main.typ # with fonts folder
```

To watch for changes and auto-recompile:

```bash
typst watch main.typ
typst watch --font-path ./fonts main.typ # with fonts folder
```

#### Fonts

This template requires the following fonts to be installed in a `fonts/` folder in the project root:

- **Source Sans Pro 3** - Download from [Google Fonts](https://fonts.google.com/specimen/Source+Sans+3) or [Adobe Fonts](https://github.com/adobe-fonts/source-sans)
- **Barlow** - Download from [Google Fonts](https://fonts.google.com/specimen/Barlow)

Create a `fonts/` directory and place the `.ttf` or `.otf` font files there:

```
AAU-Typst-Template/
  fonts/
    SourceSans3-Regular.ttf
    SourceSans3-Bold.ttf
    Barlow-Regular.ttf
    Barlow-Bold.ttf
    ...
  main.typ
```

Typst will automatically discover and use these fonts when compiling.

> IMPORTANT:
> Online Source Sans is "Sources Sans Pro" while locally it is "Source Sans 3"
> Change this in the configurations

##### Changing Fonts

To change the font to some other fonts (like the system font) go to `template.typ` and change the fonts under:
```typ
// **** CONFIGURATION ****
#let body-font = "Barlow"
#let sans-font = "Source Sans Pro"
#let par_spacing = 1.2em
#let par_text_spacing = 0.65em
```

## Attribution

This project was originally based on [AAU Typst Template](https://github.com/krestenlaust/AAU-Typst-Template)
by Kresten Laust, licensed under MIT License. It has since
evolved into an independent project with significant modifications.
