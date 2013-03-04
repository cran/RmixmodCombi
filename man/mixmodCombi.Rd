\name{mixmodCombi}
\alias{mixmodCombi}
\title{
Combining Mixture Components for Clustering
}
\description{
Provides a hierarchy of combined clusterings from the EM/BIC mixture solution provided by Rmixmod to one class, following the methodology proposed in the article cited in the references.}
\usage{
mixmodCombi(data = NULL, nbCluster = NULL, mixmodOutput = NULL,
criterion = c("BIC", "ICL"), ...)
}
\arguments{
  \item{data}{
  		matrix or data frame containing quantitative
  or qualitative data. Rows correspond to observations and
  columns correspond to variables.}
  \item{nbCluster}{
  		numeric listing the numbers of clusters to consider.
  		}
  \item{mixmodOutput}{
		[\code{\linkS4class{MixmodCluster}}] object, as returned by the \code{mixmodCluster} function, containing the optimal mixture (according to BIC) associated to the data in \code{data}. Please see the Rmixmod documentation for the details of the components. Default value is NULL, in which case \code{mixmodCluster} is called.
	}
  \item{criterion}{
  		as for the \code{mixmodCluster} function, list of characters defining the criterion
  to select the best model. The best model is the one with
  the lowest criterion value. Possible values: "BIC",
  "ICL", "NEC", c("BIC", "ICL", "NEC"). Unlike the \code{mixmodCluster} function, the default value is c("BIC", "ICL") and should only be modified with care (the plot and print functions may then wrongly refer to the "BIC" and "ICL" solutions).
}
  \item{\dots}{
		any optional argument that should be passed to the \code{mixmodCluster} function, for example the list of models to consider... Please see the \code{mixmodCluster} function documentation.
}
}
\details{
\code{mixmodCluster} provides a mixture fitted to the data by maximum likelihood through the EM algorithm, for the model and number of components selected according to BIC. The corresponding components are hierarchically combined according to an entropy criterion, following the methodology described in the article cited in the references section. The combined clusterings with numbers of classes between the one selected by BIC and one are returned as a [\code{\linkS4class{MixmodCombi}}] object.
}
\value{
[\code{\linkS4class{MixmodCombi}}] object:
		\item{mixmodOutput}{[\code{\linkS4class{MixmodCluster}}] object. EM/BIC solution from which the hierarchy  is computed. Either provided by the user or computed by a call to the \code{mixmodCluster} function}
		\item{hierarchy}{a list of \code{MixmodCombiSol} objects, each of which is the solution for the corresponding number of clusters obtained by hierarchically combining the EM/BIC solution according to the method proposed in the article in the references. Each one contains: the number of cluters, the partition of the data, the posterior probabilities of each class for each observation, the entropy value for the solution and a "combining matrix" \code{combiM} which enables to get the K-cluster solution from the (K+1)-cluster solution (please see the \code{combMat} function documentation about the combining matrices and how to use them).}
		\item{ICLNbCluster}{number of clusters selected by ICL, according to the mixmodOutput solution (if the \code{criterion} option has not been changed).}
}
\references{
J.-P. Baudry, A. E. Raftery, G. Celeux, K. Lo and R. Gottardo (2010). Combining mixture components for clustering. \emph{Journal of Computational and Graphical Statistics, 19(2):332-353.}
}
\author{
J.-P. Baudry and G. Celeux}
\note{
Be careful: the hierarchy is computed from the solution in \code{mixmodOutput@bestResult}. This is notably the solution selected with the first criterion specified in the \code{criterion} option. By default, this is the BIC solution, as suggested in the paper.  The \code{criterion} should then be changed only with care (the plot and print function may then wrongly refer to  the "BIC" and "ICL" solutions).
}
\examples{

##### Example of quantitative data #####

set.seed(1)

data(Baudry_etal_2010_JCGS_examples)
res <- mixmodCombi(ex4.1, nbCluster = 1:8)

res # is of class MixmodCombi

res@mixmodOutput # is the initial EM/BIC solution (provided by mixmodCluster or by the user as a
# [\code{\linkS4class{MixmodCluster}}] object) from which the hierarchy is computed

res@hierarchy[[3]] # is the 3-cluster solution obtained by hierarchically combining the initial
# EM/BIC solution

\dontrun{
plot(res)

hist(res, nbCluster = 4)
}

##### Example of qualtitative data #####

set.seed(1)

data(car)
res <- mixmodCombi(car[1:300,], nbCluster = 1:10) # Only the 300 first observations for a 
# quick example

res # is of class MixmodCombi

res@mixmodOutput # is the initial EM/BIC solution (provided by mixmodCluster or by the user as a 
# [\code{\linkS4class{MixmodCluster}}] object) from which the hierarchy is computed

res@hierarchy[[res@ICLNbCluster]] # is the solution obtained by hierarchically combining the initial
# EM/BIC solution for the number of clusters selected with ICL

\dontrun{plot(res)

barplot(res)
}

}
\keyword{ cluster }
