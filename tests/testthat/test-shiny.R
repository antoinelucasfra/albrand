test_that("bs_theme_brand returns a bslib theme with the bundled brand", {
  skip_if_not_installed("bslib")
  skip_if_not_installed("brand.yml")

  theme <- bs_theme_brand()
  expect_s3_class(theme, "bs_theme")
  # bslib parses the bundled brand.yml onto the theme (color/typography applied)
  brand <- attr(theme, "brand")
  expect_false(is.null(brand))
  expect_true(grepl("brand-shiny.yml", brand$path, fixed = TRUE))
})
