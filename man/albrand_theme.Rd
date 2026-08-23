\name{albrand_theme}
\alias{albrand_theme}
\title{Absolute paths of the bundled theme entry points}
\usage{
albrand_theme(base = "cosmo")
}
\arguments{
\item{base}{Bootstrap/Bootswatch base theme(s) prepended to each mode.
Default \code{"cosmo"}, the variant the identity was tuned on.}
}
\description{
Quarto accepts absolute SCSS paths in its theme list, which lets reports use
the extension without copying it into the project first.
}
\value{
Named list with \code{light} and \code{dark} character vectors, ready for
\code{format: html: theme:} or \code{\link[=render_report]{render_report()}}.
}
\examples{
str(albrand_theme())
}
