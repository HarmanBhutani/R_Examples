library(datasets)
library(cluster)
library(fpc)
data(iris)
summary(iris)
head(iris)
Iris.features = iris
Iris.features$class <- NULL
input<- Iris.features[,1:4]
results <- kmeans(input,centers = 5, nstart = 20)
plotcluster(input, results$cluster)

