setwd("C:/llpDigital/WebSys_Virtualha/dataAnalysis")

if(!require(RMySQL))
  install.packages("RMySQL")
library(RMySQL)

if(!require(dplyr))
  install.packages("dplyr")
library(dplyr)

if(!require(tidyr))
  install.packages("tidyr")
library(tidyr)

if(!require(psych))
  install.packages("psych")
library(psych)

if(!require(RColorBrewer))
  install.packages("RColorBrewer")
library(RColorBrewer)

# ========= deprecated ===========
#localidades <- read.csv("C:/llpDigital/WebSys_Virtualha/dataAnalysis/data/localidades.csv", header=TRUE, sep = ";", fileEncoding = 'latin1')
#localidades$DATA_FUND <- as.Date(localidades$DATA_FUND, format = "%Y-%m-%d")
#View(localidades)

#str(localidades)
#head(localidades)
#=================================

#-->passando cores da paleta RColorBrewer<--
#brewer.pal.info
#color <- brewer.pal(09, "Reds")
#par(mar=c(14,4,2,1))
#barplot(height = localidades$POPULACAO, names = localidades$NOME, col = color, las=2)
#box()

database <- dbConnect(MySQL(), user='llpdigital', password='password', dbname='virtualha', host='192.168.0.110')
dbListTables(database)
dbListFields(database, 'localidades')
table  <- dbSendQuery(database, "select * from localidades")
localidades  <-  fetch(table, n=-1)
localidades$DATA_FUND <- as.Date(localidades$DATA_FUND, format = "%Y-%m-%d")
str(localidades)
View(localidades)

par(mar=c(14,4,2,1))
barplot(height = localidades$POPULACAO, names = localidades$NOME, main = "Distribuição Populacional",
        col = "cornflowerblue", las=2)
box()

par(mar=c(4,14,1,2))
barplot(height = localidades$POPULACAO, names = localidades$NOME, main = "Distribuição Populacional",
        col = "cornflowerblue", horiz = TRUE, las=2)
box()

descritiva <- localidades[ ,c(-1,-2,-3,-15,-17)]
head(descritiva)
tail(descritiva)

sapply(descritiva, min)
sapply(descritiva, mean)
sapply(descritiva,median)
sapply(descritiva, max)

typeof(descritiva$VIS_TUR)

head(descritiva)
unique(localidades$NOME)
print(localidades$NOME[localidades$ZONA == "C", ])

print(localidades$NOME)

# Analises de variaveis categoricas

glimpse(localidades)
table(localidades$VALOR_MED_TERRENO)
table(localidades$NOME, localidades$POPULACAO)

names(localidades)

select(localidades, NOME, ZONA, POPULACAO, ATIV)

as.list(localidades)
class(localidades[17])

localidades[1,]
sum(localidades[,4])
sum(localidades[,5])
sum(localidades[,6])
sum(localidades[,7])
sum(localidades[,8])

deficitTrabDispo <- sum((localidades[,7]-localidades[,8])*-1)
print(c("O total de vagas de trabalho não preenchidas é:", deficitTrabDispo))

popDecrescente <-   arrange(select(localidades, NOME, ZONA, POPULACAO, ATIV),desc(POPULACAO))
print(popDecrescente)


table(popDecrescente$ZONA)
table(popDecrescente$ATIV)
table(popDecrescente$ZONA, popDecrescente$ATIV)
pie(table(popDecrescente$ZONA))

par(mar=c(2,2,2,2))
  pie(table(popDecrescente$ZONA), col = blues9, main = "Quantidades por Zona")
    box()
  
par(mar=c(2,2,2,2))
  pie(table(popDecrescente$ATIV), col = blues9, main = "Distribuição das Atividades")
    box()

    
par(mar=c(2,2,2,2))
  barplot(table(popDecrescente$POPULACAO, popDecrescente$ATIV), col = "cornflowerblue", main = "Distribuição Populacional por Tipo de Atividade")
  box()
  