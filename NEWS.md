# albrand (development version)

# albrand 0.1.1

- Bundles the `quarto-al-brand` extension snapshot tagged
  [v1.2.0](https://github.com/antoinelucasfra/quarto-al-brand/releases/tag/v1.2.0);
  the bundled version is now recorded in `DESCRIPTION`
  (`Config/Bundled/quarto-al-brand`).
- New tests: `render_report()` smoke test (branded output carries the identity)
  and `bs_theme_brand()` check; R-CMD-check CI installs Quarto so the render
  test runs there too.
- `bs_theme_brand()` test requires the `brand.yml` R package (added to
  Suggests), which bslib needs to resolve the bundled brand.
