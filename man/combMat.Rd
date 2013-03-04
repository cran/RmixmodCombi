\name{combMat}
\alias{combMat}
\title{
Combining Matrix
}
\description{
Create a combining matrix
}
\usage{
combMat(K,l1,l2)
}
\arguments{
  \item{K}{
	The original number of classes: the matrix will define a combining from K to (K-1) classes.
	}
  \item{l1}{
	Label of one of the two classes to be combined.
	}
  \item{l2}{
	Label of the other class to be combined.
	}
}
\value{
If \code{z} is a vector (length \emph{K}) whose \emph{k}th entry is the probability that an observation belongs to the \emph{k}th class in a \emph{K}-class classification, then \code{combiM \%*\% z} is the vector (length \emph{K-1}) whose \emph{k}th entry is the probability that the observation belongs to the \emph{k}th class in the \emph{K-1}-class classification obtained by combining classes \code{l1} and \code{l2} in the initial classification.
}
\references{
J.-P. Baudry, A. E. Raftery, G. Celeux, K. Lo and R. Gottardo (2010). Combining mixture components for clustering. \emph{Journal of Computational and Graphical Statistics, 19(2):332-353.}
}
\author{
J.-P. Baudry
}
\seealso{
\code{\link{mixmodCombi}}
}
\examples{

set.seed(1)

data(Baudry_etal_2010_JCGS_examples)
res <- mixmodCombi(ex4.1, nbCluster = 1:8)

res@hierarchy[[5]]@proba # each line of this matrix is the vector of the posterior probabilities of
# each class for an observation in the 5-cluster solution

t(combMat(5, 3, 4) \%*\% t(res@hierarchy[[5]]@proba) ) # each line of this matrix is the vector of
# the posterior probabilities of each class for an observation in the 4-cluster solution obtained by
# combining clusters 3 and 4 in the 5-cluster solution

}
\keyword{ cluster }

