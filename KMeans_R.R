library(datasets)
library(cluster)
library(fpc)
data(iris)
summary(iris)
head(iris)
Iris.features = iris
Iris.features$class <- NULL
view(Iris.features)
input<- Iris.features[,1:4]
input
results <- kmeans(input,centers = 5, nstart = 20)
results
plotcluster(input, results$cluster)

