# TESTING
# OK pour méthodes 2 et 3

testing1 <- testing[sample(nrow(testing)),-25]
for(i in 1:41)
{
	names(testing1)[i] <- paste("V",(i-1),sep="")
}
testing1 <- testing1[,-c(3,4,12,21,22,25,26,27,28,29,37,40)]
testing1$V16 <- testing1$V16 - testing1$V17
testing1$V31 <- (testing1$V31==" United-States")+(testing1$V32==" United-States")+(testing1$V33==" United-States")
testing1$V18 <- (testing1$V18>0)+1-1
testing1 <- testing1[,-c(15,23,24)]

# Ligne à retirer si besoin (ne sélectionne que les 'hourly wage' > 0)
testing1<- testing1[testing1$V5>0,]

A <- model.matrix( ~ testing1$V1
+ testing1$V4+ testing1$V6+ testing1$V7
+ testing1$V8+ testing1$V9+ testing1$V10
+ testing1$V12+ testing1$V13+ testing1$V14+ testing1$V15
+ testing1$V19+ testing1$V22
+ testing1$V23+ testing1$V30+ testing1$V34+ testing1$V35
+ testing1$V37
,testing1)
A <- A[,-1]

testing2 <- data.frame(testing1$V0,testing1$V5,testing1$V16,testing1$V29,testing1$V31,testing1$V38)
testing2 <- scale(testing2)
testing2 <- data.frame(testing2,testing1$V18,A,testing1$V40)
testing2 <- testing2[,-(111:118)]
for(i in 1:146)
{
	names(testing2)[i] <- paste("V",(i-1),sep="")
}
names(training2)
names(testing2)

prediction <- predict(logReg1000,testing2[,-146])
confusionMatrix(testing2[,146],prediction)

prediction <- predict(rf1000,testing2[,-146])
confusionMatrix(testing2[,146],prediction)

prediction <- predict(svm1000,testing2[,-146])
confusionMatrix(testing2[,146],prediction)

prediction <- predict(tree1000,testing2[,-146])
confusionMatrix(testing2[,146],prediction)
