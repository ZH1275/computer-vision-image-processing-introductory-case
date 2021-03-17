#make every pixel randomly adjusted a little
#for training
i <- 1
for(i in 1:60000){
  adjust <- matrix(runif(784, -1, 1), 28)
  trainxr[i,,] <- (trainxr[i,,] + adjust)/256
  trainxg[i,,] <- (trainxg[i,,] + adjust)/256
  trainxb[i,,] <- (trainxb[i,,] + adjust)/256
  i <- i + 1
}

#for testing
i <- 1
for(i in 1:10000){
  adjust <- matrix(runif(784, -1, 1), 28)
  testxr[i,,] <- (testxr[i,,] + adjust)/256
  testxg[i,,] <- (testxg[i,,] + adjust)/256
  testxb[i,,] <- (testxb[i,,] + adjust)/256
  i <- i + 1
}

#add some obvious noise points
#for training
i <- 1
j <- 1
for(i in 1:60000){
  randomrow <- sample(1:28, 10, replace = TRUE)
  randomcol <- sample(1:28, 10, replace = TRUE)
  for(j in 1:2){
    trainxr[i,,][randomrow[j],randomcol[j]] <- 255
    trainxg[i,,][randomrow[j],randomcol[j]] <- 0
    trainxb[i,,][randomrow[j],randomcol[j]] <- 0
  }
  for(j in 3:4){
    trainxr[i,,][randomrow[j],randomcol[j]] <- 0
    trainxg[i,,][randomrow[j],randomcol[j]] <- 255
    trainxb[i,,][randomrow[j],randomcol[j]] <- 0
  }
  for(j in 5:6){
    trainxr[i,,][randomrow[j],randomcol[j]] <- 0
    trainxg[i,,][randomrow[j],randomcol[j]] <- 0
    trainxb[i,,][randomrow[j],randomcol[j]] <- 255
  }
  for(j in 7:8){
    trainxr[i,,][randomrow[j],randomcol[j]] <- 255
    trainxg[i,,][randomrow[j],randomcol[j]] <- 255
    trainxb[i,,][randomrow[j],randomcol[j]] <- 255
  }
  for(j in 9:10){
    trainxr[i,,][randomrow[j],randomcol[j]] <- 0
    trainxg[i,,][randomrow[j],randomcol[j]] <- 0
    trainxb[i,,][randomrow[j],randomcol[j]] <- 0
  }
  i <- i + 1
  j <- j + 1
}

#for testing
i <- 1
j <- 1
for(i in 1:10000){
  randomrow <- sample(1:28, 25, replace = TRUE)
  randomcol <- sample(1:28, 25, replace = TRUE)
  for(j in 1:5){
    testxr[i,,][randomrow[j],randomcol[j]] <- 255
    testxg[i,,][randomrow[j],randomcol[j]] <- 0
    testxb[i,,][randomrow[j],randomcol[j]] <- 0
  }
  for(j in 6:10){
    testxr[i,,][randomrow[j],randomcol[j]] <- 0
    testxg[i,,][randomrow[j],randomcol[j]] <- 255
    testxb[i,,][randomrow[j],randomcol[j]] <- 0
  }
  for(j in 11:15){
    testxr[i,,][randomrow[j],randomcol[j]] <- 0
    testxg[i,,][randomrow[j],randomcol[j]] <- 0
    testxb[i,,][randomrow[j],randomcol[j]] <- 255
  }
  for(j in 16:20){
    testxr[i,,][randomrow[j],randomcol[j]] <- 255
    testxg[i,,][randomrow[j],randomcol[j]] <- 255
    testxb[i,,][randomrow[j],randomcol[j]] <- 255
  }
  for(j in 21:25){
    testxr[i,,][randomrow[j],randomcol[j]] <- 0
    testxg[i,,][randomrow[j],randomcol[j]] <- 0
    testxb[i,,][randomrow[j],randomcol[j]] <- 0
  }
  i <- i + 1
  j <- j + 1
}