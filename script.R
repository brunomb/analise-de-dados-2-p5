# Tutorial R Trevor Stephens
# Parte 01
# Importando dados

test <- read.csv("~/Documentos/ufcg/analise-de-dados-2/analise-de-dados-2-p5/data/train.csv")
train <- read.csv("~/Documentos/ufcg/analise-de-dados-2/analise-de-dados-2-p5/data/train.csv")
#Estrutura dos dados
str(train)
#Tabela do campo sobreviventes
table(train$Survived)
#Proporcao da coluna de sobreviventes
prop.table(table(train$Survived))
#Repeticoes
test$Survived <- rep(0, 418)
#Criacao de um novo dataframe usando o PassengerId e Survived
submit <- data.frame(PassengerId = test$PassengerId, Survived = test$Survived)
#Criacao do csv do dataframe submit
write.csv(submit, file = "~/Desktop/all-dead.csv", row.names = FALSE)
#Summary e proporcao de sex
summary(train$Sex)
prop.table(table(train$Sex))
#Proporcao de sobreviventes entre homem e mulheres
prop.table(table(train$Sex, train$Survived), 1)
#Ajustando sobreviventes a apenas mulheres
test$Survived[test$Sex == 'female'] <- 1
#Summary de idade
summary(train$Age)
#Inserindo uma coluna Child no dataframe de train, com os valores '0'
train$Child <- 0
#Povoado coluna Child
train$Child[train$Age < 18] <- 1
#Aggregate de sobreviventes: Child + Sex
aggregate(Survived ~ Child + Sex, data=train, FUN=sum)
aggregate(Survived ~ Child + Sex, data=train, FUN=length)
aggregate(Survived ~ Child + Sex, data=train, FUN=function(x) {sum(x)/length(x)})
#Inserinfo uma nova coluna Fare2 e separando em categorias
train$Fare2 <- '30+'
train$Fare2[train$Fare < 30 & train$Fare >= 20] <- '20-30'
train$Fare2[train$Fare < 20 & train$Fare >= 10] <- '10-20'
train$Fare2[train$Fare < 10] <- '<10'
#Agregate de sobreviventes: Fare2 + Pclass + sex
aggregate(Survived ~ Fare2 + Pclass + Sex, data=train, FUN=function(x) {sum(x)/length(x)})
#ADicionando verificacaoo de classe e de preco na tabela de resultado
test$Survived <- 0
test$Survived[test$Sex == 'female'] <- 1
test$Survived[test$Sex == 'female' & test$Pclass == 3 & test$Fare >= 20] <- 0
library(rpart)
fit <- rpart(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked, data=train, method="class")
plot(fit)
text(fit)

install.packages('rattle')
install.packages('rpart.plot')
install.packages('RColorBrewer')
library(rattle)
library(rpart.plot)
library(RColorBrewer)

fancyRpartPlot(fit)

png(file="~/Documentos/ufcg/analise-de-dados-2/analise-de-dados-2-p5/data/mygraphic.png",width=800,height=600)
fancyRpartPlot(fit)
dev.off()

Prediction <- predict(fit, test, type = "class")
submit <- data.frame(PassengerId = test$PassengerId, Survived = Prediction)
write.csv(submit, file = "myfirstdtree.csv", row.names = FALSE)

test$Survived <- NA
combi <- rbind(train, test)

fit <- rpart(Survived ~ Age + Pclass + SibSp, data=train, method="class")
fancyRpartPlot(fit)




