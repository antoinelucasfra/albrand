\name{render_report}
\alias{render_report}
\title{Render a document with the al-brand identity, zero setup}
\usage{
render_report(input, output_file = NULL, ...)
}
\arguments{
\item{input}{Path to the \code{.qmd} document.}
\item{output_file}{Output file name passed on to \code{quarto::quarto_render()}.}
\item{...}{Additional arguments passed to \code{\link[quarto:quarto_render]{quarto::quarto_render()}}.}
}
\description{
Renders any \code{.qmd} branded \emph{without} editing the project: the bundled
brand and both theme layers are injected as render metadata. Requires the
quarto R package and a Quarto installation >= 1.9.
}
\value{
The path of the rendered output (invisibly).
}
\examples{
\dontrun{
albrand::render_report("analysis.qmd", output_file = "analysis.html")
}
}
