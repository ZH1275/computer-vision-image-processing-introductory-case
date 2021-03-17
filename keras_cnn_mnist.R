#resize
for (i in 1:60000) {trainxone[[i]] <- resize(trainxone[[i]], 28, 28)}
for (i in 1:10000) {testxone[[i]] <- resize(testxone[[i]], 28, 28)}

#reshape
for(i in 1:60000){trainxone[[i]] <- array_reshape(trainxone[[i]], c(28,28,3))}
for(i in 1:10000){testxone[[i]] <- array_reshape(testxone[[i]], c(28,28,3))}

#one-hot encoding
trainy <- to_categorical(trainy, 10)
testy <- to_categorical(testy, 10)

#model
model <- keras_model_sequential()
#model
model <- keras_model_sequential()
model %>% 
  layer_conv_2d(model,32,3,3,activation='relu') %>%
  layer_max_pooling_2d(model,pool_size=c(2,2)) %>%
  layer_conv_2d(model,64,3,3,activation='relu') %>%
  layer_max_pooling_2d(model,pool_size=c(2,2)) %>%
  layer_flatten(model) %>%
  layer_dense(units = 32, activation = 'relu', input_shape = c(784)) %>%
  layer_dropout(rate = 0.01) %>% 
  layer_dense(units = 64, activation = 'relu', input_shape = c(784)) %>%
  layer_dropout(rate = 0.01) %>% 
  layer_dense(units = 128, activation = 'relu', input_shape = c(784)) %>%
  layer_dropout(rate = 0.01) %>% 
  layer_dense(units = 10, activation = 'softmax')

#Compile
model %>% compile(
  loss = "categorical_crossentropy",
  optimizer = optimizer_sgd(lr = 0.1),
  metrics = "accuracy"
)

summary(model)

#train
history <- model %>% 
  fit(trainxone,
      trainy,
      epochs = 50,
      batch_size = 32)
plot(history)

#evaluation
model %>% evaluate(testxone, testy)