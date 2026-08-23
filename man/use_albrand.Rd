\name{use_albrand}
\alias{use_albrand}
\title{Copy the bundled Quarto extension into a project}
\usage{
use_albrand(dir = ".")
}
\arguments{
\item{dir}{Project directory (created if needed). Default current dir.}
}
\description{
Places \code{_extensions/al-brand/} next to your documents so plain
\code{quarto render} picks the branding up without any helper. Existing copies
are replaced, keeping the bundle fresh across package updates.
}
\value{
Invisibly, the path to the copied extension.
}
\examples{
\dontrun{
use_albrand("reports/q3")
}
}
