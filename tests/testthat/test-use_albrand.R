test_that("bundled assets exist", {
  expect_true(file.exists(albrand_brand_path()))
  theme <- albrand_theme()
  expect_true(file.exists(tail(theme$light, 1)))
  expect_true(file.exists(tail(theme$dark, 1)))
})

test_that("use_albrand copies the extension", {
  dir <- file.path(tempdir(), paste0("albrand-", as.integer(Sys.time())))
  on.exit(unlink(dir, recursive = TRUE), add = TRUE)
  target <- use_albrand(dir)
  expect_true(dir.exists(target))
  expect_true(file.exists(file.path(target, "_extension.yml")))
  expect_true(file.exists(file.path(target, "brand.yml")))
})
