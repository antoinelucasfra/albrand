\name{bs_theme_brand}
\alias{bs_theme_brand}
\title{bslib theme matching the al-brand identity}
\usage{
bs_theme_brand(...)
}
\arguments{
\item{...}{Arguments passed to \code{\link[bslib:bs_theme]{bslib::bs_theme()}}
(\code{preset}, \code{bg}, \code{fg}, ...).}
}
\description{
Wraps \code{\link[bslib:bs_theme]{bslib::bs_theme()}} pointed at the
\code{brand.yml} bundled in this package, so Shiny apps share the exact palette
and typography used by branded Quarto outputs (requires bslib >= 1.3 for
brand support).
}
\value{
A \code{bs_theme()} object.
}
\examples{
\dontrun{
library(shiny)
ui <- fluidPage(
  theme = albrand::bs_theme_brand(preset = "cosmo"),
  "Branded Shiny"
)
}
}
