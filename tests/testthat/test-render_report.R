test_that("render_report produces a branded html file", {
  skip_if_not_installed("quarto")
  skip_if_not(nzchar(Sys.which("quarto")), "quarto CLI not on PATH")

  dir <- file.path(tempdir(), paste0("albrand-render-", as.integer(Sys.time())))
  dir.create(dir)
  on.exit(unlink(dir, recursive = TRUE), add = TRUE)

  qmd <- file.path(dir, "sample.qmd")
  writeLines(c(
    "---",
    'title: "Sample"',
    "---",
    "",
    "Hello, brand."
  ), qmd)

  out <- suppressMessages(
    render_report(qmd, output_file = "sample.html", execute = FALSE)
  )
  expect_true(file.exists(file.path(dir, "sample.html")))
  # The brand identity actually applied: the sky accent is in the compiled CSS
  # (emitted as a separate bootstrap lib file, not inline in the html).
  css <- list.files(dir, "bootstrap.*\\.css$", recursive = TRUE,
                    full.names = TRUE)
  css_text <- paste(unlist(lapply(css, readLines, warn = FALSE)), collapse = "")
  expect_true(grepl("38BDF8", css_text, fixed = TRUE))
  expect_true(grepl("Space Grotesk", css_text, fixed = TRUE))
  invisible(out)
})
