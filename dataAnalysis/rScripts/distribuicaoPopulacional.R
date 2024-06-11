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
                      dbname='virtualha', host='192.168.0.163')
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

# <manipulations>

localGruposRes <- select(localidades, NOME, ZONA, POPULACAO, CRIANCAS, ADOLESC,
                         JOVENS_ADUL, ADULTOS, IDOSOS)
localGrupos  <-  pivot_longer(localGruposRes,c(
  CRIANCAS, ADOLESC, JOVENS_ADUL, ADULTOS, IDOSOS),
  names_to = "Grupo",
  values_to = "Quantidade")
rm(localGruposRes)
view(localGrupos)

empregabilidadeRes <- localidades %>% 
  select(NOME, ZONA, TRABALHADORES_EFET, VAGAS_DISP)
empregabilidade <- pivot_longer(empregabilidadeRes, c(TRABALHADORES_EFET, VAGAS_DISP),
                                names_to = "Condição",
                                values_to = "Quantidade")
rm(empregabilidadeRes)
view(empregabilidade)

distribAtividade <- localidades %>% 
  select(NOME, ATIV)
view(distribAtividade)

atividade  <-  distribAtividade %>% 
  group_by(ATIV) %>% 
  summarise(
    n = n()
  )
view(atividade)


# </manipulations>

# <charts>

  # <barplotDistribuicaoPopulacional>
  ggplot(localidades, aes(x = NOME, y = POPULACAO, fill = ZONA, label = localidades$POPULACAO)) +
    geom_bar(stat = 'identity') +
    theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1),
          axis.text.y = element_text(angle = 0, vjust = 0.5, hjust = 1)) +
    labs(x = "Localidade",
         y = "População", 
         title = "Distribuição Populacional", 
         subtitle = NULL) +
    geom_label(size = 3, fill="gray95")
  # </barplotDistribuicaoPopulacional>
  
  # <barplotDistribuicaoPopulacionalPorGrupo>
  localGrupos %>%
    filter(POPULACAO > 0) %>% 
  ggplot(aes(x = NOME, y = Quantidade, fill = Grupo, label = Quantidade)) +
    geom_bar(stat = 'identity', position = "dodge") +
    geom_label(size = 3, fill = "white", position = position_dodge(width = 1), alpha = 1) +
    theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1),
          axis.text.y = element_text(angle = 0, vjust = 0.5, hjust = 1)) +
    labs(x = "Localidade",
         y = "População", 
         title = "Distribuição Populacional", 
         subtitle = "(excluindo os locais não habitados)")
  # </barplotDistribuicaoPopulacionalPorGrupo>
  
  # <barplotValorMedioTerreno>
  ggplot(localidades, aes(x = NOME, y = VALOR_MED_TERRENO, fill = ZONA, label = VALOR_MED_TERRENO)) +
    geom_bar(stat = 'identity') +
    theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1),
          axis.text.y = element_text(angle = 0, vjust = 0.5, hjust = 1)) +
    labs(x = "Localidade",
         y = "Valor Médio", 
         title = "Valor médio dos terrenos por localidade", 
         subtitle = NULL) +
    geom_label(size = 3, fill="gray95")
  # </barplotValorMedioTerreno>
  
  # <barplotLocalidadesPorZona>
  
  localidades %>%
    group_by(ZONA) %>%
    summarise(
      contador = n()
    ) %>%
    ggplot(aes(ZONA,contador,label=contador, fill=ZONA))+
    geom_bar(stat = "identity")+
    labs(title="Distribuição das localidades por Zona",
         subtitle = NULL,
         x="Zona",
         y= NULL)+
    theme(axis.text.y = element_blank()) +
    theme(axis.ticks.y.left = element_blank()) +
    geom_label(size = 4, fill="gray95", alpha = 1)
  
  # </barplotLocalidadesPorZona>
  

  # <barplotEmpregabilidade>
    
  empregabilidade %>% 
    ggplot(aes(NOME, Quantidade, fill = Condição, label= Quantidade)) +
    geom_bar(stat = "identity", position = "dodge") +
    labs(title="Empregabilidade",
         subtitle = NULL,
         x="Localidade",
         y= "Relação trabalhadores e vagas") + 
    theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1),
          axis.text.y = element_text(angle = 0, vjust = 0.5, hjust = 1))+
    scale_fill_manual(values = c("#FF61CC","#00A9FF"))
  
  # </barplotEmpregabilidade>
  
  # <barplotDistribAtividades>
  
  atividade %>% 
    ggplot(aes(y = ATIV, x = n, fill = ATIV, label = n)) +
    geom_bar(stat = "identity") +
    labs(title="Insidência de localidades por atividade",
         subtitle = NULL,
         x=NULL,
         y= NULL) +
    coord_flip() +
    geom_label(size = 4, fill="gray95", alpha = 1)
  
  # </barplotDistribAtividades>
 
  
# </charts>
  
    