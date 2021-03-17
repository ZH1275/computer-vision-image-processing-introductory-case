#install packages
install.packages("keras")
library(keras)
install_keras(method = "conda")
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install(c("EBImage"))
library(EBImage)

#read images
setwd('File path here')
pics <- c('1.jpg')

picx <- list()
for (i in 1:??) {picx[[i]] <- readImage(pics[i])}
for (i in 1:??) {picx[[i]] <- resize(picx[[i]], ??, ??)}