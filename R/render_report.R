#' Render a document with the al-brand identity, zero setup
#'
#' Renders any `.qmd` branded — no `_quarto.yml` edits, no files copied into
#' your project. The brand and both theme layers are injected as render
#' metadata; light/dark pairing comes straight from the bundled `brand.yml`.
#' Requires the quarto R package and a Quarto installation >= 1.9.
#'
#' @param input Path to the `.qmd` document.
#' @param output_file Output file name passed on to `quarto::quarto_render()`.
#' @param ... Additional arguments passed to [quarto::quarto_render()]
#'   (`execute_params`, `execute_dir`, `quiet`, ...).
#' @return The path of the rendered output (invisibly).
#' @examples
#' \dontrun{
#' albrand::render_report("analysis.qmd", output_file = "analysis.html")
#' }
#' @export
render_report <- function(input, output_file = NULL, ...) {
  if (!requireNamespace("quarto", quietly = TRUE)) {
    stop("Install the quarto package: install.packages('quarto')",
         call. = FALSE)
  }
  args <- list(
    input = input,
    metadata = list(
      brand = albrand_brand_path(),
      theme = albrand_theme()
    ),
    ...
  )
  if (!is.null(output_file)) args$output_file <- output_file
  invisible(do.call(quarto::quarto_render, args))
}
