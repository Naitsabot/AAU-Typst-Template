#import "//template.typ": * // Import of all templating content
#import "../assets/diagrams.typ": *

= HI, im a chapther <ch:im_a_label_that_is_formatted_correctly>


And there is a reference to the chapter label uwu @ch:im_a_label_that_is_formatted_correctly


#figure(
  scale(x: 90%, y: 90%, reflow: true, cetz_ex),
  caption: [A small Example of a CeTZ diagram]
) <fig:cetz_ex>








= HAHAHAHAHAHAHAHAAAAAAAaaa <ch:test>

#lorem(100)@einstein_1905

This is @ch:test
== this is a section
== this is a section also <sec:test>
This is @sec:test
=== this is a subsection <sec:test2>
This is @sec:test2
==== this is a sub-subsection <sec:test3>
This is @sec:test3

hello /* #gls("lod") */

hi /* #gls("lod") */

#lorem(400)

#lorem(200)


@apz:1.1

#figure(
  caption: [Event table],
  table(
    stroke: theme_aau.blue, 
    columns: 8,
    fill: (_, row) => if calc.odd(row) {
      theme_aau.light_blue_opaque
    } else if row == 0 {
      theme_aau.light_blue
    },
    align: (col, _) => {
      if col > 0 { center } 
      else       { left }
    },
    [Events \\ Classes], [User], [Admin], [Media\ Planner], [Time\ Slot], [Display\ Device], [Visual\ Media], [Slideshow],
    [User created],                [\+],[  ],[  ],[  ],[  ],[  ],[  ],
    [User disabled],               [\+],[\*],[\+],[  ],[  ],[  ],[  ],
    [User Role modified],          [\*],[\*],[\*],[  ],[  ],[  ],[  ],
    [User modified],               [\*],[  ],[  ],[  ],[  ],[  ],[  ],
    [User notification enabled],   [\*],[  ],[  ],[  ],[  ],[  ],[  ],
    [User notification disabled],  [\*],[  ],[  ],[  ],[  ],[  ],[  ],
    [Display Device created],      [  ],[  ],[  ],[  ],[\+],[  ],[  ],
    [Display Device deleted],      [  ],[  ],[  ],[  ],[\+],[  ],[  ],
    [Display Device connected],    [\*],[  ],[  ],[  ],[\*],[  ],[  ],
    [Display Device\ disconnected],[\*],[  ],[  ],[  ],[\*],[  ],[  ],
    [Display Device assigned],     [  ],[  ],[  ],[\*],[\*],[  ],[  ],
    [Display Device unassigned],   [  ],[  ],[  ],[\*],[\*],[  ],[  ],
    [Display Device modified],     [  ],[  ],[  ],[  ],[\*],[  ],[  ], 
    [Time Slot created],           [  ],[  ],[  ],[\+],[  ],[  ],[  ],
    [Time Slot deleted],           [  ],[  ],[  ],[\+],[  ],[  ],[  ],
    [Time Slot time modified],     [  ],[  ],[  ],[\*],[\*],[  ],[  ],
    [Visual Media created],        [  ],[  ],[  ],[  ],[  ],[\+],[  ],
    [Visual Media deleted],        [  ],[  ],[  ],[  ],[  ],[\+],[  ],
    [Visual Media added],          [  ],[  ],[  ],[  ],[  ],[\*],[\*],
    [Visual Media removed],        [  ],[  ],[  ],[  ],[  ],[\*],[\*],
    [Slideshow assigned],          [  ],[  ],[  ],[\*],[  ],[  ],[\*],
    [Slideshow unassigned],        [  ],[  ],[  ],[\*],[  ],[  ],[\*],
    [Slideshow created],           [  ],[  ],[\*],[  ],[  ],[  ],[\+],
    [Slideshow deleted],           [  ],[  ],[\*],[  ],[  ],[  ],[\+],
    [Slideshow modified],          [  ],[  ],[\*],[  ],[  ],[  ],[\*],
  )
)


como estas hi 
