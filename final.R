library(rattle)
library(rpart.plot)
library(RColorBrewer)
#importar dados de treinamento
dados_treino_cc_em <- read.csv("~/Documentos/ufcg/analise-de-dados-2/analise-de-dados-2-p5/data/corretos/dadostreino.csv", sep=";")
#dividir dados em CC, EM e CC_EM
dados_treino_cc <- subset(dados_treino_cc_em, dados_treino_cc_em$CURSO == 14102100)
dados_treino_em <- subset(dados_treino_cc_em, dados_treino_cc_em$CURSO == 11124100)
#Export de dados divididos
write.csv(dados_treino_cc, file = "~/Documentos/ufcg/analise-de-dados-2/analise-de-dados-2-p5/data/corretos/dados_treino_cc.csv", row.names = FALSE, quote=FALSE)
write.csv(dados_treino_em, file = "~/Documentos/ufcg/analise-de-dados-2/analise-de-dados-2-p5/data/corretos/dados_treino_em.csv", row.names = FALSE, quote=FALSE)
write.csv(dados_treino_cc_em, file = "~/Documentos/ufcg/analise-de-dados-2/analise-de-dados-2-p5/data/corretos/dados_treino_cc_em.csv", row.names = FALSE, quote=FALSE)
#Tratamento dos dados em JAVA e importacao dos novos dados de treinamento
dados_treino_cc_em_tratado <- read.csv("~/Documentos/ufcg/analise-de-dados-2/analise-de-dados-2-p5/data/corretos/dados_treino_cc_em_tratado.csv", sep=";")
dados_treino_cc_tratado <- read.csv("~/Documentos/ufcg/analise-de-dados-2/analise-de-dados-2-p5/data/corretos/dados_treino_cc_tratado.csv", sep=";")
dados_treino_em_tratado <- read.csv("~/Documentos/ufcg/analise-de-dados-2/analise-de-dados-2-p5/data/corretos/dados_treino_em_tratado.csv", sep=";")
dados_treino_cc_em_tratado$curso_nome <- 'teste'
dados_treino_cc_em_tratado$curso_nome[dados_treino_cc_em_tratado$curso == 14102100] <- 'CC'
dados_treino_cc_em_tratado$curso_nome[dados_treino_cc_em_tratado$curso == 11124100] <- 'EM'

#importar dados de teste
dados_teste_cc_em <- read.csv("~/Documentos/ufcg/analise-de-dados-2/analise-de-dados-2-p5/data/corretos/dadosteste.csv", sep=";", row.names = FALSE)
#dividir dados em CC, EM e CC_EM
dados_teste_cc <- subset(dados_teste_cc_em, dados_teste_cc_em$CURSO == 14102100)
dados_teste_em <- subset(dados_teste_cc_em, dados_teste_cc_em$CURSO == 11124100)
#Export de dados divididos
write.csv(dados_teste_cc, file = "~/Documentos/ufcg/analise-de-dados-2/analise-de-dados-2-p5/data/corretos/dados_teste_cc.csv", row.names = FALSE, quote=FALSE)
write.csv(dados_teste_em, file = "~/Documentos/ufcg/analise-de-dados-2/analise-de-dados-2-p5/data/corretos/dados_teste_em.csv", row.names = FALSE, quote=FALSE)
write.csv(dados_teste_cc_em, file = "~/Documentos/ufcg/analise-de-dados-2/analise-de-dados-2-p5/data/corretos/dados_teste_cc_em.csv", row.names = FALSE, quote=FALSE)
#Tratamento dos dados em JAVA e importacao dos novos dados de treinamento
dados_teste_cc_em_tratado <- read.csv("~/Documentos/ufcg/analise-de-dados-2/analise-de-dados-2-p5/data/corretos/dados_teste_cc_em_tratado.csv", sep=";")
dados_teste_cc_tratado <- read.csv("~/Documentos/ufcg/analise-de-dados-2/analise-de-dados-2-p5/data/corretos/dados_teste_cc_tratado.csv", sep=";")
dados_teste_em_tratado <- read.csv("~/Documentos/ufcg/analise-de-dados-2/analise-de-dados-2-p5/data/corretos/dados_teste_em_tratado.csv", sep=";")


#Apos tartamento de tableas
summary(dadosTreinamento)
#Verifiar proporcao entre o numero de alunos que evadiram e que não evadiram
prop.table(table(dadosTreinamento$codevasao))
#Verifiar se existe proporcao entre o numero de cadeira e a evasao
prop.table(table(dadosTreinamento$totalcadeira))
prop.table(table(dadosTreinamento$totalcadeira, dadosTreinamento$codevasao), 1)
#Dividir as medias em categorias

prop.table(table(dadosTreinamento$perido, dadosTreinamento$codevasao), 1)

#Inserir um novo campo mediacat
dadosTreinamento$mediacat <- '0'
dadosTreinamento$mediacat[dadosTreinamento$media < 2.5] <- '0.0 - 2.5'
dadosTreinamento$mediacat[dadosTreinamento$media < 5 & dadosTreinamento$media >= 2.5] <- '2.5 - 5.0'
dadosTreinamento$mediacat[dadosTreinamento$media < 7.5 & dadosTreinamento$media >= 5] <- '5.0 - 7.5'
dadosTreinamento$mediacat[dadosTreinamento$media >= 7.5] <- '7.5 - 10.'

#Verifiar se existe proporcao entre a media e a evasao
prop.table(table(dadosTreinamento$mediacat))
prop.table(table(dadosTreinamento$mediacat, dadosTreinamento$codevasao), 1)

#Inserir um novo campo reprovcat
dadosTreinamento$reprovcat <- '0'
dadosTreinamento$reprovcat[dadosTreinamento$reprovadonota == 0] <- 'Nenhuma'
dadosTreinamento$reprovcat[dadosTreinamento$reprovadonota < 0.5 & dadosTreinamento$reprovadonota > 0] <- 'Ate metade'
dadosTreinamento$reprovcat[dadosTreinamento$reprovadonota >= 0.5] <- 'Mais da metade'

#Verifiar se existe proporcao entre a reprovacao por nota e a evasao
prop.table(table(dadosTreinamento$reprovcat))
prop.table(table(dadosTreinamento$reprovcat, dadosTreinamento$codevasao), 1)

#Inserir um novo campo tranccat
dadosTreinamento$tranccat <- '0'
dadosTreinamento$tranccat[dadosTreinamento$trancado == 0] <- 'Nenhuma'
dadosTreinamento$tranccat[dadosTreinamento$trancado < 0.5 & dadosTreinamento$trancado > 0] <- 'Ate metade'
dadosTreinamento$tranccat[dadosTreinamento$trancado >= 0.5] <- 'Mais da metade'

#Verifiar se existe proporcao entre a tracamento e a evasao
prop.table(table(dadosTreinamento$tranccat))
prop.table(table(dadosTreinamento$tranccat, dadosTreinamento$codevasao), 1)

fit <- rpart(codevasao ~ media + trancado + reprovadofalta + reprovadonota, data=dadosTreinamento, method="class")
fancyRpartPlot(fit)

test <- read.csv("~/Documentos/ufcg/analise-de-dados-2/analise-de-dados-2-p5/data/AAfinalDadosTeste.csv", sep=";", colClasses = c("factor", "numeric", "factor", "numeric", "numeric", "numeric", "factor", "numeric", "factor"))
#Inserir um novo campo mediacat
test$mediacat <- '0'
test$mediacat[test$media < 2.5] <- '0.0 - 2.5'
test$mediacat[test$media < 5 & test$media >= 2.5] <- '2.5 - 5.0'
test$mediacat[test$media < 7.5 & test$media >= 5] <- '5.0 - 7.5'
test$mediacat[test$media >= 7.5] <- '7.5 - 10.'

#Inserir um novo campo reprovcat
test$reprovcat <- '0'
test$reprovcat[test$reprovadonota == 0] <- 'Nenhuma'
test$reprovcat[test$reprovadonota < 0.5 & test$reprovadonota > 0] <- 'Ate metade'
test$reprovcat[test$reprovadonota >= 0.5] <- 'Mais da metade'

#Inserir um novo campo tranccat
test$tranccat <- '0'
test$tranccat[test$trancado == 0] <- 'Nenhuma'
test$tranccat[test$trancado < 0.5 & test$trancado > 0] <- 'Ate metade'
test$tranccat[test$trancado >= 0.5] <- 'Mais da metade'

summary(test)
testCC <- subset(test, test$curso == 14102100)
testEM <- subset(test, test$curso == 11124100)

Prediction <- predict(fit, test, type = "class")
submitTodos <- data.frame(matricula = test$matricula, codevasao = Prediction)
Prediction <- predict(fit, testCC, type = "class")
submitCC <- data.frame(matricula = testCC$matricula, codevasao = Prediction)
Prediction <- predict(fit, testEM, type = "class")
submitEE <- data.frame(matricula = testEM$matricula, codevasao = Prediction)
write.csv(submitTodos, file = "~/Documentos/ufcg/analise-de-dados-2/analise-de-dados-2-p5/data/entrega/bruno_brandao_CC_EM.csv", row.names = FALSE)
write.csv(submitCC, file = "~/Documentos/ufcg/analise-de-dados-2/analise-de-dados-2-p5/data/entrega/bruno_brandao_CC.csv", row.names = FALSE)
write.csv(submitEE, file = "~/Documentos/ufcg/analise-de-dados-2/analise-de-dados-2-p5/data/entrega/bruno_brandao_EM.csv", row.names = FALSE)

