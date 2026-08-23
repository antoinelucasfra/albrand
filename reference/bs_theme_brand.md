# bslib theme matching the al-brand identity

Wraps
[`bslib::bs_theme()`](https://rstudio.github.io/bslib/reference/bs_theme.html)
pointed at the `brand.yml` bundled in this package, so Shiny apps share
the exact palette and typography used by branded Quarto outputs
(requires bslib \>= 1.3 for brand support).

## Usage

``` r
bs_theme_brand(...)
```

## Arguments

- ...:

  Arguments passed to
  [`bslib::bs_theme()`](https://rstudio.github.io/bslib/reference/bs_theme.html)
  (`preset`, `bg`, `fg`, ...).

## Value

A `bs_theme()` object.

## Examples

``` r
if (FALSE) { # \dontrun{
library(shiny)
ui <- fluidPage(
  theme = albrand::bs_theme_brand(preset = "cosmo"),
  "Branded Shiny"
)
} # }
```
