\name{RmixmodCombi-package}
\alias{RmixmodCombi-package}
\alias{RmixmodCombi}
\docType{package}
\title{
Combining Mixture Components for Clustering
}
\description{
The Rmixmod package provides model-based clustering by fitting a mixture model (e.g. Gaussian components for quantitative continuous data) to the data and identifying each cluster with one of its components. The number of components can be determined from the data, typically using the BIC criterion. In practice, however, individual clusters can be poorly fitted by Gaussian distributions, and in that case model-based clustering tends to represent one non-Gaussian cluster by a mixture of two or more Gaussian components. This package, RmixmodCombi, following the article in the references, combines the components of the EM/BIC solution (provided by the Rmixmod package) hierarchically according to an entropy criterion. This yields a clustering for each number of clusters less than or equal to K. These clusterings can be compared on substantive grounds, and we also provide a way of selecting the number of clusters via a piecewise linear regression fit to the (possibly rescaled) entropy plot. }
\details{
\tabular{ll}{
Package: \tab RmixmodCombi\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2013-09-20\cr
Depends: \tab Rmixmod, Rcpp\cr
}

See the Rmixmod package documentation for more details about fitting mixture models. See the cited article for more details about the combining methodology.
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
plot(res) # This is a simulated example where the clusters should obviously not be identified to 
# Gaussian components...

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

\dontrun{
plot(res)

barplot(res)
}

}
\author{
J.-P. Baudry and G. Celeux
Maintainer: J.-P. Baudry <RmixmodCombi@gmail.com>
}
\references{
J.-P. Baudry, A. E. Raftery, G. Celeux, K. Lo and R. Gottardo (2010). Combining mixture components for clustering. \emph{Journal of Computational and Graphical Statistics, 19(2):332-353.}
}
\keyword{ cluster }
