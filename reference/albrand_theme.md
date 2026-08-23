# Absolute paths of the bundled theme entry points

Quarto accepts absolute SCSS paths in its theme list, which lets reports
use the extension without copying it into the project first.

## Usage

``` r
albrand_theme(base = "cosmo")
```

## Arguments

- base:

  Bootstrap/Bootswatch base theme(s) prepended to each mode. Default
  `"cosmo"`, the variant the identity was tuned on.

## Value

Named list with `light` and `dark` character vectors, ready for
`format: html: theme:` or
[`render_report()`](https://antoinelucasfra.github.io/albrand/reference/render_report.md).

## Examples

``` r
str(albrand_theme())
#> List of 2
#>  $ light: chr [1:2] "cosmo" "/home/runner/work/_temp/Library/albrand/quarto/_extensions/al-brand/al-brand-light.scss"
#>  $ dark : chr [1:2] "cosmo" "/home/runner/work/_temp/Library/albrand/quarto/_extensions/al-brand/al-brand-dark.scss"
```
