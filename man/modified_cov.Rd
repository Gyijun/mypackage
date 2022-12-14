% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/modified_cov.R
\name{modified_cov}
\alias{modified_cov}
\title{modified_cov}
\usage{
modified_cov(x, y = NULL)
}
\arguments{
\item{x}{a numeric vector, matrix or data frame with complete cases.}

\item{y}{NULL(default) or a numeric vector, matrix or data frame with complete cases and compatible dimensions to \code{x}.}
}
\value{
the covariances between x,y or columns of x matrix
}
\description{
Gets the covariances between two vectors or columns of matrices with complete cases.
}
\details{
A matrix/data frame for \code{x} or both \code{x}, \code{y} vectors/matrices should be given to calculate covariances.
The inputs must be numeric or logical, without missing values. For \code{modified_cov()}, covariances will be calculated under method \code{pearson}, which produces same results for function \code{cov(x,y,use="all.obs", method="pearson")}
The denominator \code{n-1} is used when computing unbiased estimators of the covariances for i.i.d. observations(when only one observation for both \code{x}, \code{y} are given, the function will return \code{NaN}).
}
\note{
Pearson method performs better on normal distributed samples.While Spearman and Kendall methods are usually applied on samples that are not in normal distribution.
}
\examples{
## For complete matrices and vectors with compatible dimensions.
## x,y are both vectors with one element
modified_cov(1,1) # NaN

## x,y are both vectors
modified_cov(c(1,3,5,FALSE),c(FALSE,TRUE,1,3)) # -1.083333

## One of x,y is a matrix, and the other is a vector
x1<-matrix(rnorm(1000,0,1),100,10)
y1<-c(rnorm(100,0,1))
stopifnot(all.equal(cov(x1,y1,use="all.obs",method="pearson"), modified_cov(x1,y1)))


}
\seealso{
\code{\link[=modified_cor]{modified_cor()}} for pearson correlation computation for complete vectors/matrices.
}
