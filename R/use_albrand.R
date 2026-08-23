#' Path to the bundled brand.yml
#'
#' @return Full path to the `brand.yml` shipped with the package.
#' @export
albrand_brand_path <- function() {
  system.file("quarto", "_extensions", "al-brand", "brand.yml",
              package = "albrand")
}

#' Absolute paths of the bundled theme entry points
#'
#' Quarto accepts absolute SCSS paths in its theme list, which lets reports
#' use the extension without copying it into the project first.
#'
#' @param base Bootstrap/Bootswatch base theme(s) prepended to each mode.
#'   Default `"cosmo"`, the variant the identity was tuned on.
#' @return Named list with `light` and `dark` character vectors, ready to be
#'   dropped under `format: html: theme:` or passed via
#'   [render_report()].
#' @examples
#' str(albrand_theme())
#' @export
albrand_theme <- function(base = "cosmo") {
  light <- system.file("quarto", "_extensions", "al-brand",
                       "al-brand-light.scss", package = "albrand")
  dark <- system.file("quarto", "_extensions", "al-brand",
                      "al-brand-dark.scss", package = "albrand")
  if (!nzchar(light) || !nzchar(dark)) {
    stop("Bundled al-brand themes not found; reinstall the package.",
         call. = FALSE)
  }
  list(light = c(base, light), dark = c(base, dark))
}

#' Copy the bundled Quarto extension into a project
#'
#' Places `_extensions/al-brand/` next to your documents so plain
#' `quarto render` picks the branding up without any helper. Existing
#' copies are replaced, keeping the bundle fresh across package updates.
#'
#' @param dir Project directory (created if needed). Default current dir.
#' @return Invisibly, the path to the copied extension.
#' @examples
#' \dontrun{
#' use_albrand("reports/q3")
#' # then in _quarto.yml:
#' #   format:
#' #     html:
#' #       theme:
#' #         light: [cosmo, al-brand-light.scss]
#' #         dark:  [cosmo, al-brand-dark.scss]
#' }
#' @export
use_albrand <- function(dir = ".") {
  src <- system.file("quarto", "_extensions", "al-brand", package = "albrand")
  if (!nzchar(src)) {
    stop("Bundled al-brand extension not found; reinstall the package.",
         call. = FALSE)
  }
  target_dir <- file.path(dir, "_extensions")
  dir.create(target_dir, recursive = TRUE, showWarnings = FALSE)
  target <- file.path(target_dir, "al-brand")
  if (dir.exists(target)) unlink(target, recursive = TRUE)
  ok <- file.copy(src, target_dir, recursive = TRUE)
  if (!ok || !dir.exists(target)) {
    stop("Failed to copy the al-brand extension to ", target_dir,
         call. = FALSE)
  }
  invisible(target)
}
