\name{mixmodMap_V2M}
\alias{mixmodMap_V2M}
\title{
Vector of Labels to Matrix of Class Assignments Conversion
}
\description{
Converts a vector of labels to a matrix of class assignments.}
\usage{
mixmodMap_V2M(z, n = length(z), K = max(z))
}
\arguments{
  \item{z}{
  		vector of labels corresponding to the class assigned to each observation.}
  \item{n}{
  		number of observations.
  		}
  \item{K}{
		number of classes.
	}
}
\value{
  		matrix of class assignments. Rows correspond to observations and
  columns correspond to classes. Each row contains only zeros except for the column corresponding to the class to which the observation is assigned, which value is one.
}
\references{
J.-P. Baudry, A. E. Raftery, G. Celeux, K. Lo and R. Gottardo (2010). Combining mixture components for clustering. \emph{Journal of Computational and Graphical Statistics, 19(2):332-353.}
}
\author{
J.-P. Baudry and G. Celeux}
\examples{

set.seed(1)

data(Baudry_etal_2010_JCGS_examples)
res <- mixmodCombi(ex4.1, nbCluster = 1:8)

res@hierarchy[[3]]@partition[1:10] # Is the labels vector of the classes assigned to the 10 first 
# observations

mixmodMap_V2M(res@hierarchy[[3]]@partition[1:10]) #  Is the corresponding matrix of class 
# assignments for the 10 first observations 

}
\keyword{ cluster }
