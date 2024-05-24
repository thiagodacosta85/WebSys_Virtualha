setwd("C:/llpDigital/WebSys_Virtualha/dataAnalysis")

localidades <- read.csv("C:/llpDigital/WebSys_Virtualha/dataAnalysis/data/localidades.csv", header=TRUE, sep = ";", fileEncoding = 'latin1')
localidades$DATA_FUND <- as.Date(localidades$DATA_FUND, format = "%Y-%m-%d")
View(localidades)

str(localidades)
head(localidades)

par(mar=c(14,4,2,1))
barplot(height = localidades$POPULACAO, names = localidades$NOME, col = blues9, las=2)
box()


