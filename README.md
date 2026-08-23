# albrand <img src="man/figures/logo.svg" align="right" width="120" alt="albrand logo">

<!-- badges: start -->
[![R-CMD-check](https://github.com/antoinelucasfra/albrand/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/antoinelucasfra/albrand/actions/workflows/R-CMD-check.yaml)
[![pkgdown](https://img.shields.io/badge/pkgdown-site-informational)](https://antoinelucasfra.github.io/albrand/)
[![License: MIT](https://img.shields.io/badge/license-MIT-informational)](LICENSE)
<!-- badges: end -->

Antoine Lucas' brand as an R package — bundles the
[`al-brand`](https://github.com/antoinelucasfra/quarto-al-brand) Quarto brand
extension (sky-blue identity, Space Grotesk / DM Sans / JetBrains Mono, paired
light + dark modes) so **any R workflow can produce branded outputs**:
one-function report rendering, Quarto project scaffolding, and Shiny theming.

Pattern inspired by [Mickaël Canouil (@mcanouil)](https://github.com/mcanouil)
and his work shipping Quarto extensions inside R packages to deliver branded
reports from R and Shiny workflows — see <https://github.com/mcanouil> and
<https://mickael.canouil.fr/>.

## Installation

```r
# install.packages("remotes")
remotes::install_github("antoinelucasfra/albrand")
```

## One-function branded reports

Render any `.qmd` with zero project setup — brand and theme layers are
injected at render time:

```r
albrand::render_report("analysis.qmd", output_file = "analysis.html")
```

## Use in a Quarto project

```r
albrand::use_albrand("reports/q3")
```

Then reference the extension from your `_quarto.yml`:

```yaml
format:
  html:
    theme:
      light: [cosmo, al-brand-light.scss]
      dark:  [cosmo, al-brand-dark.scss]
```

## Theme Shiny apps identically

The bundled `brand.yml` drives bslib (>= 1.3):

```r
library(shiny)
fluidPage(
  theme = albrand::bs_theme_brand(preset = "cosmo"),
  ...
)
```

Try the bundled demo app without installing anything:

```r
shiny::runGitHub("antoinelucasfra/albrand", subdir = "inst/shiny-demo")
```

Site, reports, and apps — one identity.

## API

| Function | Purpose |
| ---------- | --------- |
| `render_report()` | Render any `.qmd` branded, no setup |
| `use_albrand(dir)` | Copy the extension into a Quarto project |
| `bs_theme_brand(...)` | `bslib::bs_theme()` pointed at the bundled brand |
| `albrand_brand_path()` | Path to the bundled `brand.yml` |
| `albrand_theme(base)` | Light/dark SCSS paths for custom configs |

## License

MIT © Antoine Lucas
