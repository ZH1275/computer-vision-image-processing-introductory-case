trainxr <- trainx
trainxg <- trainx
trainxb <- trainx
testxr <- testx
testxg <- testx
testxb <- testx

#assign figure color
#training data
i <- 1
for(i in 1:60000){
  randomr <- sample (0:255, 1)
  randomg <- sample (0:255, 1)
  randomb <- sample (0:255, 1)
  trainxr[i,,] <- (randomr/255)*(trainx[i,,]/255)
  trainxg[i,,] <- (randomg/255)*(trainx[i,,]/255)
  trainxb[i,,] <- (randomb/255)*(trainx[i,,]/255)
  i <- i + 1
}

#testing data
i <- 1
for(i in 1:10000){
  randomr <- sample (0:255, 1)
  randomg <- sample (0:255, 1)
  randomb <- sample (0:255, 1)
  testxr[i,,] <- (randomr/255)*(testx[i,,]/255)
  testxg[i,,] <- (randomg/255)*(testx[i,,]/255)
  testxb[i,,] <- (randomb/255)*(testx[i,,]/255)
  i <- i + 1
}

#add background
#for training
i <- 1
for(i in 1:60000){
  randomminusr <- sample (0:255, 1)
  randomminusg <- sample (0:255, 1)
  randomminusb <- sample (0:255, 1)
  matrixminusr <- matrix((randomminusr/255):(randomminusr/255), nrow = 28, ncol = 28)
  matrixminusg <- matrix((randomminusg/255):(randomminusg/255), nrow = 28, ncol = 28)
  matrixminusb <- matrix((randomminusb/255):(randomminusb/255), nrow = 28, ncol = 28)
  trainxr[i,,] <- trainxr[i,,] - matrixminusr
  trainxr[i,,] <- abs(trainxr[i,,])
  trainxg[i,,] <- trainxg[i,,] - matrixminusg
  trainxg[i,,] <- abs(trainxg[i,,])
  trainxb[i,,] <- trainxb[i,,] - matrixminusb
  trainxb[i,,] <- abs(trainxb[i,,])
  i <- i + 1
}

#for testing
i <- 1
for(i in 1:10000){
  randomminusr <- sample (0:255, 1)
  randomminusg <- sample (0:255, 1)
  randomminusb <- sample (0:255, 1)
  matrixminusr <- matrix((randomminusr/255):(randomminusr/255), nrow = 28, ncol = 28)
  matrixminusg <- matrix((randomminusg/255):(randomminusg/255), nrow = 28, ncol = 28)
  matrixminusb <- matrix((randomminusb/255):(randomminusb/255), nrow = 28, ncol = 28)
  testxr[i,,] <- testxr[i,,] - matrixminusr
  testxr[i,,] <- abs(testxr[i,,])
  testxg[i,,] <- testxg[i,,] - matrixminusg
  testxg[i,,] <- abs(testxg[i,,])
  testxb[i,,] <- testxb[i,,] - matrixminusb
  testxb[i,,] <- abs(testxb[i,,])
  i <- i + 1
}

#combine rgb channels
install.packages("jpeg")
library(jpeg)
alpha <- matrix(1:1, nrow = 28, ncol = 28)

#for training
trainxabind <- list()
trainxjpeg <- list()
i <- 1
for(i in 1:60000){
  trainxabind[[i]] <- abind:::abind(trainxr[i,,], trainxg[i,,], trainxb[i,,], alpha, along=3)
  trainxjpeg[[i]] <- writeJPEG(trainxabind[[i]])
  i <- i + 1
}

#for testing
testxabind <- list()
testxjpeg <- list()
i <- 1
for(i in 1:10000){
  testxabind[[i]] <- abind:::abind(trainxr[i,,], testxg[i,,], testxb[i,,], alpha, along=3)
  testxjpeg[[i]] <- writeJPEG(testxabind[[i]])
  i <- i + 1
}