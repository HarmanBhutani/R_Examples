library("rpart")
library("rattle")
require(caTools)
library(ggplot2)
library(car)

dataset <- read.csv("eBayAuctions.csv",TRUE,",")

class(dataset)                

head(dataset)

# Changing the Duration feature into factor
dataset$Duration <- as.factor(dataset$Duration)

sapply (dataset, class)

# Changing the class label into factor
dataset$Competitive. <- factor(dataset$Competitive.)

sapply(dataset, class)

dataset$ClosePrice =scale(dataset$ClosePrice)
dataset$OpenPrice =scale(dataset$OpenPrice)


#  set seed to ensure you always have same random numbers generated
set.seed(123)   

# splits the data in the ratio mentioned in SplitRatio. After splitting marks these rows as logical TRUE and the the remaining are marked as logical FALSE
sample = sample.split(dataset,SplitRatio = 0.60) 

# creates a training dataset named train1 with rows which are marked as TRUE
train_set = subset(dataset,sample ==TRUE) 
validation_set = subset(dataset, sample==FALSE)

# Creating the unseen testing data 
test <- data.frame("Category" = c("Music/Movie/Game","Automotive","SportingGoods"),"currency"=c("US","US","US"),"sellerRating"=c(3249,142,1),
                   "Duration"=c("5","7","7"), 
                   "endDay"=c("Mon","Sat","Fri"), 
                   "ClosePrice"=c(0.01,521.55,417.99), "OpenPrice"=c(0.01,200.00,200.00),"Competitive." =c("0","1","1"), stringsAsFactors = T )
test

#creating the Decision Tree Model A
model_a <- rpart(Competitive. ~ Category + currency + sellerRating + Duration + endDay + ClosePrice + OpenPrice, data = dataset,
              control = rpart.control(minbucket = 50, cp = 0.01, maxdepth = 7),method = "class")

model_a

#Plotiing the decision tree Model A
fancyRpartPlot(model_a)

#the details of the decision tree Model A
printcp(model_a)
model_a$variable.importance

#Pruning the decision tree Model A
pruned <- prune.rpart(model_a, cp = 0.05)

# Printing the Pruned decision tree Model A
fancyRpartPlot(pruned)


#creating the Decision Tree Model B
model_b <- rpart(Competitive. ~ ClosePrice + OpenPrice, data = dataset, method = "class",
             control = rpart.control(minbucket = 50, cp = 0.05, maxdepth = 7))

#Plotiing the decision tree Model B
fancyRpartPlot(model_b)

#the details of the decision tree Model B
printcp(model_b)
model_b$variable.importance


scatterplot(ClosePrice ~ OpenPrice | Competitive., data=dataset,
            xlab="Close Price of the ebay auction", ylab="Open Price of the ebay auction",legend = TRUE)


#Testing the unseen data for the Model A
predict_unseen_fit_modelA<-predict(model_a,test,type = "class")

#Confusion Matrix  of the Model A on the unseen testing data
table_mat_1 <- table(test$Competitive., predict_unseen_fit_modelA)
table_mat_1

#Accuracy of the Model A on the unseen testing data
accuracy_Test_1 <- sum(diag(table_mat_1)) / sum(table_mat_1)
accuracy_Test_1

#Testing the unseen data for the Model B
predict_unseen_fit_modelB<-predict(model_b,test,type = "class")

#Confusion Matrix  of the Model B on the unseen testing data
table_mat_2 <- table(test$Competitive., predict_unseen_fit_modelB)
table_mat_2

#Accuracy of the Model B on the unseen testing data
accuracy_Test_2 <- sum(diag(table_mat_2)) / sum(table_mat_2)
accuracy_Test_2

require("tree")
library("ggplot2")
library("tree")
plot(dataset$ClosePrice,dataset$OpenPrice,pch=19,col=as.numeric(dataset$Competitive.))
partition.tree(model_a,label="Competitive.",add=TRUE)

graph <- qplot(dataset$ClosePrice,dataset$OpenPrice, data=dataset, colour=Competitive., size=I(4))
graph
graph + geom_hline(aes(yintercept=0)) + geom_vline(aes(xintercept=0))


