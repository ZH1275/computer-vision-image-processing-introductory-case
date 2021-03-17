#To disable the line, simply add # at the front.
#training
i <- 1
trainxone <- list()
for(i in 1:60000){
  trainxone[[i]] <- image_read(trainxjpeg[[i]], density = NULL, depth = NULL, strip = FALSE)
  image_reducenoise(trainxone[i])
  image_contrast(trainxone[i], sharpen = 1)
  image_normalize(trainxone[i])
  image_equalize(trainxone[i])
  image_quantize(trainxone[i])
  image_convert(trainxone[[i]], "jpg")
  i <- i + 1
}

#testing
i <- 1
testxone <- list()
for(i in 1:10000){
  testxone[[i]] <- image_read(testxjpeg[[i]], density = NULL, depth = NULL, strip = FALSE)
  image_reducenoise(testxone[i])
  image_contrast(testxone[i], sharpen = 1)
  image_normalize(testxone[i])
  image_equalize(testxone[i])
  image_quantize(testxone[i])
  image_convert(testxone[[i]], "jpg")
  i <- i + 1
}