/* 
 * Document appendix
 */

#import "//template.typ": *

/* 
 * IMPORTANT!
 * Appendix label formatting: <apx:mylabel>
 */

= How to Use Appendices <apx:how_to>

Appendices provide supplementary material that supports your main document but would interrupt the flow if included in the body text. Common uses include detailed data tables, technical specifications, source code, survey instruments, or extended mathematical proofs.

== Creating Appendix Sections

In this template, appendices are special in that each new appendix is created using a level 1 heading (`=`). The appendix numbering (A, B, C, etc.) is handled automatically by the template.

Sub-sections within an appendix use level 2 headings (`==`). These should only be used when you have multiple related items that belong under the same appendix category. For example:
- Multiple related tables in a database schema
- Different versions of a survey or questionnaire
- Related code modules or functions

== Labeling Appendices

Label your appendices using the `<apx:label-name>` convention for consistency:

```typst
= My Appendix Title <apx:mylabel>
```

You can then reference the appendix in your main text using `@apx:mylabel`, which will display as @apx:how_to.

Generally, only label level 1 headings (main appendices) rather than sub-sections, as appendices are typically referenced as complete units.

== Best Practices

- *Keep it relevant*: Only include material that genuinely supports your main text
- *Reference from main text*: Always mention appendices in your document body
- *Be descriptive*: Use clear, informative titles for each appendix
- *Maintain quality*: Appendices should be as carefully prepared as your main content

== Important: No Figures in Appendices

*Do not wrap content in `#figure(...)` within appendices.* The appendix template handles numbering and formatting automatically. Simply include your tables, code blocks, images, or other content directly without the figure wrapper.

Wrapping content in figures within appendices can cause numbering conflicts and formatting issues.

= Additional Resources <apx:resources>

This appendix contains supplementary materials and resources.

== Useful Links and References

- Typst Documentation: https://typst.app/docs
- Typst Tutorial: https://typst.app/docs/tutorial/
- Typst Community Discord: https://discord.gg/2uDybryKPe
- CeTZ Package: https://typst.app/universe/package/cetz
- Typst Examples Book: https://sitandr.github.io/typst-examples-book/book/basics/

== Acronyms and Abbreviations

#table(
  columns: (auto, 1fr),
  
  fill: (_, row) => if calc.odd(row) {
    theme_aau.light_blue_opaque
  } else if row == 0 {
    theme_aau.light_blue
  },
  
  [*Acronym*], [*Definition*],
  [AAU], [Aalborg University],
  [API], [Application Programming Interface],
  [CI/CD], [Continuous Integration / Continuous Deployment],
  [JSON], [JavaScript Object Notation],
  [LaTeX], [Lamport TeX],
  [PDF], [Portable Document Format],
  [UI/UX], [User Interface / User Experience],
)

Alternativly is the use of the Glossarium package. This not been added to the template (actually it has been removed) becuase it keeps breaking in updates.

From experience, acronyms are all a mess if you dont do them from the start.
