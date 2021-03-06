\name{stitch}
\alias{stitch}
\alias{stitch_rhtml}
\alias{stitch_rmd}
\title{Automatically create a report based on an R script and a template}
\usage{
stitch(script, template = system.file("misc", "knitr-template.Rnw", package = "knitr"), 
    output = NULL, envir = parent.frame())

stitch_rhtml(...)

stitch_rmd(...)
}
\arguments{
  \item{script}{path to the R script}

  \item{template}{path of the template to use (by default
  the Rnw template in this package; there is also an HTML
  template in \pkg{knitr})}

  \item{output}{the output filename (passed to
  \code{\link{knit}}); by default it uses the base filename
  of the script}

  \item{...}{arguments passed to \code{stitch()}}

  \item{envir}{the environment in which the code chunks are
  to be evaluated (can use \code{\link{new.env}()} to
  guarantee an empty new environment)}
}
\value{
  path of the output document
}
\description{
  This is a convenience function for small-scale automatic
  reporting based on an R script and a template. The
  default template is an Rnw file (LaTeX);
  \code{stitch_rhtml()} and \code{stitch_rmd()} are
  wrappers on top of \code{stitch()} using the R HTML and R
  Markdown templates respectively.
}
\details{
  The first two lines of the R script can contain the title
  and author of the report in comments of the form \samp{##
  title:} and \samp{## author:}. The template must have a
  token \samp{\%sCHUNK_LABEL_HERE}, which will be used to
  input all the R code from the script. See the examples
  below.

  The R script may contain chunk headers of the form
  \samp{## @knitr label}, which will be copied to the
  template; if no chunk headers are found, the whole R
  script will be inserted into the template as one code
  chunk.
}
\examples{
s = system.file("misc", "stitch-test.R", package = "knitr")
\dontrun{
stitch(s)
}

# HTML report
stitch(s, system.file("misc", "knitr-template.Rhtml", package = "knitr"))

# or convert markdown to HTML
stitch(s, system.file("misc", "knitr-template.Rmd", package = "knitr"))
}
\seealso{
  \code{\link{spin}} (turn a specially formatted R script
  to a report)
}
