# Render a document with the al-brand identity, zero setup

Renders any `.qmd` branded *without* editing the project: the bundled
brand and both theme layers are injected as render metadata. Requires
the quarto R package and a Quarto installation \>= 1.9.

## Usage

``` r
render_report(input, output_file = NULL, ...)
```

## Arguments

- input:

  Path to the `.qmd` document.

- output_file:

  Output file name passed on to
  [`quarto::quarto_render()`](https://quarto-dev.github.io/quarto-r/reference/quarto_render.html).

- ...:

  Additional arguments passed to
  [`quarto::quarto_render()`](https://quarto-dev.github.io/quarto-r/reference/quarto_render.html).

## Value

The path of the rendered output (invisibly).

## Examples

``` r
if (FALSE) { # \dontrun{
albrand::render_report("analysis.qmd", output_file = "analysis.html")
} # }
```
