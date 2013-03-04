\name{mixmodMap_M2V}
\alias{mixmodMap_M2V}
\title{
Matrix of Class Assignments to Vector of Labels Conversion
}
\description{
Converts a matrix of class assignments to a vector of labels.}
\usage{
mixmodMap_M2V(M, n = nrow(M), K = ncol(M))
}
\arguments{
  \item{M}{
  		matrix of class assignments. Rows correspond to observations and
  columns correspond to classes. Each row contains only zeros except for the column corresponding to the class to which the observation is assigned, which value is one.}
  \item{n}{
  		number of observations.
  		}
  \item{K}{
		number of classes.
	}
}
\value{
a vector of labels of length n. }
\references{
J.-P. Baudry, A. E. Raftery, G. Celeux, K. Lo and R. Gottardo (2010). Combining mixture components for clustering. \emph{Journal of Computational and Graphical Statistics, 19(2):332-353.}
}
\author{
J.-P. Baudry and G. Celeux}
\examples{

set.seed(1) 

data(Baudry_etal_2010_JCGS_examples)
res <- mixmodCombi(ex4.1, nbCluster = 1:8)

res@hierarchy[[3]]@proba[1:10,] # Is the matrix of posterior probabilities of each of the combined
# classes in the 3-class solution, for the 10 first observations

mixmodMap(res@hierarchy[[3]]@proba[1:10,]) # Is the matrix of corresponding class assignments for
# the 10 first observations 

mixmodMap_M2V(mixmodMap(res@hierarchy[[3]]@proba[1:10,])) # Is the labels vector of the classes
# assigned to the 10 first observations

}
\keyword{ cluster }
