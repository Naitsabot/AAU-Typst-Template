// AAU Typst Template v3.0 - Main Export
// This file re-exports everything from the lib/ modules

#import "lib/config.typ": *
#import "lib/helpers.typ": *
#import "lib/pages.typ": *
#import "lib/styles.typ": *
#import "lib/components.typ": *

// Re-export the main doc function from template.typ
#import "template.typ": doc

// Re-export everything for users who want granular control
// (they can do #import "@preview/aau-template:3.0.0": doc, theme_aau, etc.)