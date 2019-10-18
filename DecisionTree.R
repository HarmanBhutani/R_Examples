set.seed(678)
path <- 'https://raw.githubusercontent.com/guru99-edu/R-Programming/master/titanic_data.csv' 
titanic <-read.csv(path)
head(titanic)
tail(titanic)
shuffle_index <- sample(1:nrow(titanic))
head(shuffle_index)
titanic <- titanic[shuffle_index, ]
head(titanic)

library(dplyr)
library(magrittr)
# Drop variables
# Add label to variable pclass and survived;
# Remove NA observations;

clean_titanic <- titanic % > % select(-c(home.dest, cabin, name, X, ticket)) % > % 
  mutate(pclass = factor(pclass, levels = c(1, 2, 3), labels = c('Upper', 'Middle', 'Lower')), survived = factor(survived, levels = c(0, 1), labels = c('No', 'Yes'))) % > % na.omit()
glimpse(clean_titanic)


subset1 <-select(titanic, -c(home.dest, cabin, name, x, ticket))
subset2 <- mutate(subset1, pclass = factor(pclass, levels = c(1, 2, 3), labels = c('Upper', 'Middle', 'Lower')), survived = factor(survived, levels = c(0, 1), labels = c('No', 'Yes'))) 
clean_titanic <- na.omit(subset2)
glimpse(clean_titanic)

create_train_test <- function(data, size = 0.8, train = TRUE) {
  n_row = nrow(data)
  total_row = size * n_row
  train_sample < -  data[total_row]
  if (train == TRUE) {
    return (data[train_sample, ])
  } else {
    return (data[-train_sample, ])
  }
}



# function brings back a test set if train argument is false;

create_train_test(df, size = 0.8, train = TRUE)
data_train <- create_train_test(clean_titanic, 0.8, train = TRUE)
data_test <- create_train_test(clean_titanic, 0.8, train = FALSE)
dim(data_train)


n = nrow(clean_titanic)
trainIndex = sample(1:n, size = round(0.8*n), replace=FALSE)
train_set = clean_titanic[trainIndex ,]
test_set = clean_titanic[-trainIndex ,]


prop.table(table(train_set$survived))
prop.table(table(test_set$survived))

library(rpart)
library(rpart.plot)
fit <- rpart(survived~., data = train_set, method = 'class')
rpart.plot(fit, extra = 101)


predict(fit, clean_titanic, type = 'class')

predict_unseen <-predict(fit, test_set, type = 'class')

table_mat <- table(test_set$survived, predict_unseen)
table_mat


accuracy_Test <- sum(diag(table_mat)) / sum(table_mat)
print(paste('Accuracy for test', accuracy_Test))
