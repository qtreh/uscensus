library(caret)
training <- read.csv("census_income_learn.csv",header=FALSE)

# TRAINING - 1er essai

# Toutes les variables continues + Variables nominales transformées

training1 <- training[sample(nrow(training)),]
training1 <- training1[1:5000,]
A <- model.matrix( ~ training1$V1 + training1$V2 
+ training1$V3 + training1$V4 + training1$V5+ training1$V7
+ training1$V8+ training1$V9+ training1$V10+ training1$V11
+ training1$V12+ training1$V13+ training1$V14+ training1$V15
+ training1$V16+ training1$V20+ training1$V21+ training1$V22
+ training1$V23+ training1$V24+ training1$V25+ training1$V26
+ training1$V27+ training1$V28+ training1$V29+ training1$V31
+ training1$V32+ training1$V33+ training1$V34+ training1$V35
+ training1$V36+ training1$V37+ training1$V38+ training1$V40
,training1)
A <- A[,-1]
training2 <- cbind(training1,A)
nums <- sapply(training2[1,], is.numeric)
training2 <- cbind(training2[,nums],training2[,42])
cv <- training2
training2 <- training2[1:1000,]

logReg1000 <- train(training2[,-386], training2[,386],method="LogitBoost",tuneGrid=NULL,prox=TRUE,na.action=na.omit)

rf1000 <- train(training2[,-386], training2[,386],method="rf",tuneGrid=NULL,tuneLength=3,weights=NULL,data=training2,prox=TRUE,na.action=na.omit)

cv <- cv[sample(nrow(cv)),]
prediction <- predict(logReg1000 ,cv[,-386])
print(prediction)
confusionMatrix(prediction,cv[,386])
prediction <- predict(rf1000 ,cv[,-386])
print(prediction)
confusionMatrix(prediction,cv[,386])
