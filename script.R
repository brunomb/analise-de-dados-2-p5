# Tutorial R Trevor Stephens
# Parte 01
# Importando dados
test <- read.csv("~/Desktop/test.csv")
train <- read.csv("~/Desktop/train.csv")
#Estrutura dos dados
str(train)
#Tabela do campo sobreviventes
table(train$Survived)
#Proporcao da coluna de sobreviventes
prop.table(table(train$Survived))
#Repeti????o
test$Survived <- rep(0, 418)
#Criacao de um novo dataframe usando o PassengerId e Survived
submit <- data.frame(PassengerId = test$PassengerId, Survived = test$Survived)
#Criacao do csv do dataframe submit
write.csv(submit, file = "~/Desktop/all-dead.csv", row.names = FALSE)
