setwd("C:/llpDigital/WebSys_Virtualha/dataAnalysis")

library(RColorBrewer)

localidades <- read.csv("C:/llpDigital/WebSys_Virtualha/dataAnalysis/data/localidades.csv", header=TRUE, sep = ";", fileEncoding = 'latin1')
localidades$DATA_FUND <- as.Date(localidades$DATA_FUND, format = "%Y-%m-%d")
View(localidades)

str(localidades)
head(localidades)



#-->passando cores da paleta RColorBrewer<--
#brewer.pal.info
#color <- brewer.pal(09, "Reds")
#par(mar=c(14,4,2,1))
#barplot(height = localidades$POPULACAO, names = localidades$NOME, col = color, las=2)
#box()

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
      