# Copy the bundled Quarto extension into a project

Places `_extensions/al-brand/` next to your documents so plain
`quarto render` picks the branding up without any helper. Existing
copies are replaced, keeping the bundle fresh across package updates.

## Usage

``` r
use_albrand(dir = ".")
```

## Arguments

- dir:

  Project directory (created if needed). Default current dir.

## Value

Invisibly, the path to the copied extension.

## Examples

``` r
if (FALSE) { # \dontrun{
use_albrand("reports/q3")
} # }
```
