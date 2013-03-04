\name{mixmodMap}
\alias{mixmodMap}
\title{
Computes a hard clustering corresponding to a soft clustering
}
\description{
Computes the hard clustering through the Maximum A Posteriori rule from the matrix of a posteriori probabilities (soft clustering).}
\usage{
mixmodMap(tau, n = nrow(tau), K = ncol(tau))
}
\arguments{
  \item{tau}{
  		matrix with posterior probabilities of each class for each observation (classes in columns, observations in rows).}
  \item{n}{
  		number of observations. 
  		}
  \item{K}{
		number of classes.
	}
}
\value{
a matrix of same dimensions as \emph{tau}. For each observation (row), only zeros except for the column corresponding to the cluster to which the observation is assigned, which value is one.}
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
# the 10 first observations (available as a labels vector: res@hierarchy[[3]]@partition[1:10])

}
\keyword{ cluster }
