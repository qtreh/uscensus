# TRAINING - 2nd essai

# Suppression de la variable "instance weight"
training1 <- training[sample(nrow(training)),-25]

# Nom des variables : V0 à V39, V40 est l'objectif (-50000/50000+).
for(i in 1:41)
{
	names(training1)[i] <- paste("V",(i-1),sep="")
}

# VARIABLES MODIFIEES
# Supprimer : 39 (année), 11 (hispanic origin), 2 et 3 (recode), 20/21 (previous area),
# 28 (migr sunbelt), 24/25/26 (migration code), 27 (in house for 1yr), 36 (veterans quest)
# V16 <- V16 - V17
# 31/32/33 => count(US) => nouvelle variable score entre 0 et 3 pour l'immigration
# Hourly wage > 0 (on peut d'ailleurs remarquer que les individus ayant cette variable à 0 ont
# aussi " Not in universe" dans la variable "Class of worker"
# V18 : Dividendes => nominal (présence ou non de dividendes)

training1 <- training1[,-c(3,4,12,21,22,25,26,27,28,29,37,40)]
training1$V16 <- training1$V16 - training1$V17
training1$V31 <- (training1$V31==" United-States")+(training1$V32==" United-States")+(training1$V33==" United-States")
training1$V18 <- (training1$V18>0)+1-1
training1 <- training1[,-c(15,23,24)]
training1 <- training1[training1$V5>0,]
training1 <- training1[1:5000,]

# Transformation des variables nominales restantes en variables binaires
A <- model.matrix( ~ training1$V1
+ training1$V4+ training1$V6+ training1$V7
+ training1$V8+ training1$V9+ training1$V10
+ training1$V12+ training1$V13+ training1$V14+ training1$V15
+ training1$V19+ training1$V22
+ training1$V23+ training1$V30+ training1$V34+ training1$V35
+ training1$V37
,training1)
A <- A[,-1]

# On prend seulement les valeurs continues, que l'on met à l'échelle
# Retirer colonnes 111 à 119 (non présentes dans le set testing)
training2 <- data.frame(training1$V0,training1$V5,training1$V16,training1$V29,training1$V31,training1$V38)
training2 <- scale(training2)
training2 <- data.frame(training2,training1$V18,A,training1$V40)
training2 <- training2[,-(111:119)]

# Renommage des colonnes (juste pour rester cohérent avec les noms des variables de testing)
for(i in 1:146)
{
	names(training2)[i] <- paste("V",(i-1),sep="")
}

# /!\ Après l'apprentissage, cv doit être construit en reprenant tout le code ci dessus sans 
# la ligne où l'on filtre suivant training1$V5 si l'on veut un score sur le set entier
cv <- training2
training2 <- training2[1:1000,]

# Apprentissage. Modifier indice variable cible si besoin.
rf1000 <- train(training2[,-146], training2[,146],method="rf",tuneGrid=NULL,tuneLength=3,weights=NULL,data=training2,prox=TRUE,na.action=na.omit)
tree1000 <- train(training2[,-146], training2[,146],method="rpart")
logReg1000 <- train(training2[,-146], training2[,146],method="LogitBoost",tuneGrid=NULL,prox=TRUE,na.action=na.omit)
svm1000 <- train(training2[,-146], training2[,146],method="svmPoly",degree=3,scale=FALSE)

cv <- cv[sample(nrow(cv)),]
prediction <- predict(logReg1000,cv[1:1000,-146])
print(prediction)
confusionMatrix(prediction,cv[1:1000,146])
prediction <- predict(rf1000 ,cv[1:1000,-146])
print(prediction)
confusionMatrix(prediction,cv[1:1000,146])
prediction <- predict(svm1000 ,cv[1:1000,-146])
print(prediction)
confusionMatrix(prediction,cv[1:1000,146])
plot(tree1000$finalModel, uniform=TRUE, main = "Classification Tree")
text(tree1000$finalModel, use.n=TRUE, all=TRUE, cex=.8)
prediction <- predict(tree1000,cv[1:1000,-146])
print(prediction)
confusionMatrix(prediction,cv[1:1000,146])
