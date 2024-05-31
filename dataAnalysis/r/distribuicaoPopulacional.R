# <setup>

setwd("C:/llpDigital/WebSys_Virtualha/dataAnalysis")

if(!require(RMySQL))
  install.packages("RMySQL")
library(RMySQL)

if(!require(tidyverse))
  install.packages("tidyverse")
library(tidyverse)

# </setup>

# <data>

database <- dbConnect(MySQL(), user='llpdigital', password='password', 
                      dbname='virtualha', host='192.168.0.110')
dbListTables(database)
dbListFields(database, 'localidades')
table  <- dbSendQuery(database, "select * from localidades")
localidades  <-  fetch(table, n=-1)
localidades$DATA_FUND <- as.Date(localidades$DATA_FUND, format = "%Y-%m-%d")
str(localidades)
View(localidades)

# </data>

# <dataCheck>

str(localidades)
summary(localidades)
head(localidades)
tail(localidades)
is.na(localidades)
is.vector(localidades$DATA_FUND)
class(localidades$DATA_FUND)

localidades %>% select(NOME, ZONA, POPULACAO, ATIV)

# </dataCheck>

# <charts>

ggplot(localidades, aes(x = NOME, y = POPULACAO, fill = ZONA)) +
  geom_bar(stat = 'identity') +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1),
        axis.text.y = element_text(angle = 0, vjust = 0.5, hjust = 1)) +
  labs(x = "Localidades", 
       y = "População", 
       title = "Distribuição Populacional", 
       subtitle = NULL)

# </charts>

