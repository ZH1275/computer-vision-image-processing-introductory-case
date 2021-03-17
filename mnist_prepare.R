install.packages("keras")
library(keras)
install_keras(method = "conda")

library(keras)
mnist <- dataset_mnist()
str(mnist)

trainx <- mnist$train$x
trainy <- mnist$train$y
testx <- mnist$test$x
testy <- mnist$test$y