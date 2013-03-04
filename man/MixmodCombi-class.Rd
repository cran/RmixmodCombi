\name{MixmodCombi-class}
\alias{MixmodCombi-class}
\title{[\code{\linkS4class{MixmodCombi}}] class}
\description{
  Class of an output from the \code{mixmodCombi} function
}
  \details{ \describe{
\item{mixmodOutput}{[\code{\linkS4class{MixmodCluster}}] object. EM/BIC solution from which the hierarchy is computed. Either provided by the user or computed by a call to the \code{mixmodCluster} function}
		\item{hierarchy}{list of \code{MixmodCombiSol} objects, each of which is the solution for the corresponding number of clusters obtained by hierarchically combining the EM/BIC solution according to the method proposed in the article in the references. Each one contains: the number of clusters, the partition of the data, the posterior probabilities of each class for each observation, the entropy value for the solution and a "combining matrix" \code{combiM} which enables to get the K-cluster solution from the (K+1)-cluster solution (please see the \code{combMat} function documentation about the combining matrices and how to use them).}
		\item{ICLNbCluster}{number of clusters selected by ICL, according to the mixmodOutput solution (if the \code{criterion} option has not been changed when calling the \code{mixmodCombi} function).}
		}}
		
\references{
J.-P. Baudry, A. E. Raftery, G. Celeux, K. Lo and R. Gottardo (2010). Combining mixture components for clustering. \emph{Journal of Computational and Graphical Statistics, 19(2):332-353.}}
\examples{
set.seed(1)

data(Baudry_etal_2010_JCGS_examples)

res <- mixmodCombi(ex4.1, nbCluster = 1:8)

res # is of class MixmodCombi

getSlots("MixmodCombi")
}

