\name{Baudry_etal_2010_JCGS_examples}
\alias{Baudry_etal_2010_JCGS_examples}
\alias{Test1D}
\alias{ex4.1}
\alias{ex4.2}
\alias{ex4.3}
\alias{ex4.4.1}
\alias{ex4.4.2}
\docType{data}
\title{Simulated Example Datasets From Baudry et al. (2010)}
\description{
Simulated Datasets used in Baudry et al. (2010) to illustrate the proposed mixture components combining method for clustering. 

Please see the cited article for a detailed presentation of these datasets. The data frame with name exN.M is presented in Section N.M in the paper.

Test1D (not in the article) has been simulated from a Gaussian mixture distribution in R.

ex4.1 and ex4.2 have been simulated from a Gaussian mixture distribution in R^2.

ex4.3 has been simulated from a mixture of a uniform distribution on a square and a spherical Gaussian distribution in R^2.

ex4.4.1 has been simulated from a Gaussian mixture model in R^2

ex4.4.2 has been simulated from a mixture of two uniform distributions in R^3.
}
\usage{data(Baudry_etal_2010_JCGS_examples)}
\format{

  ex4.1 is a data frame with 600 observations of 2 real variables.

  ex4.2 is a data frame with 600 observations of 2 real variables.

  ex4.3 is a data frame with 200 observations of 2 real variables.

  ex4.4.1 is a data frame with 800 observations of 2 real variables.
 
  ex4.4.2 is a data frame with 300 observations of 3 real variables.
  
  Test1D is a data frame with 200 observations of 1 real variable.
  
}
\references{
J.-P. Baudry, A. E. Raftery, G. Celeux, K. Lo and R. Gottardo (2010). Combining mixture components for clustering. \emph{Journal of Computational and Graphical Statistics, 19(2):332-353.}
}
\examples{

set.seed(1)

data(Baudry_etal_2010_JCGS_examples)

output <- mixmodCombi(ex4.4.2, nbCluster = 1:10, 
models = mixmodGaussianModel(listModels = "Gaussian_pk_Lk_Ck")) 

output # is of class MixmodCombi

\dontrun{
plot(output) # plots the hierarchy of combined solutions, then some "entropy plots" 
# which may help to select the number of classes
}

}
\keyword{datasets}
