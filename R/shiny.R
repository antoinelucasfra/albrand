# Shiny integration ----------------------------------------------

#' bslib theme matching the al-brand identity
#'
#' Wraps [bslib::bs_theme()] pointed at the `brand.yml` bundled in this
#' package, so Shiny apps share the exact palette and typography used by
#' branded Quarto outputs (requires bslib >= 1.3 for brand support).
#'
#' @param ... Arguments passed to [bslib::bs_theme()] (`preset`, `bg`, `fg`,
#'   ...).
#' @return A `bs_theme()` object.
#' @examples
#' \dontrun{
#' library(shiny)
#' ui <- fluidPage(
#'   theme = albrand::bs_theme_brand(preset = "cosmo"),
#'   "Branded Shiny"
#' )
#' }
#' @export
bs_theme_brand <- function(...) {
  if (!requireNamespace("bslib", quietly = TRUE)) {
    stop("Install bslib >= 1.3 to use bs_theme_brand().", call. = FALSE)
  }
  # ponytail: canonical brand.yml uses Quarto light/dark nesting the R
  # brand.yml package can't parse yet; flat light-mode subset shipped alongside.
  # Switch to albrand_brand_path() when the R brand.yml lands mode support.
  bslib::bs_theme(brand = system.file("quarto", "brand-shiny.yml",
                                     package = "albrand"), ...)
}
