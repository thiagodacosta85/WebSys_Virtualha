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
    
  
  # scale_fill_manual(values = c("dodgerblue4","mediumaquamarine","coral4", "wheat4", "chocolate4")+
  
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
    #coord_flip()
  
  # </barplotLocalidadesPorZona>
  

  # <barplotEmpregabilidade>
    
  empregabilidade %>% 
    ggplot(aes(NOME, Quantidade, fill = Condição, label= Quantidade)) +
    geom_bar(stat = "identity", position = "dodge") +
    labs(title="Empregabilidade",
         subtitle = NULL,
         x="Localidade",
         y= "Trabalhadores X Vagas") + 
    theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1),
          axis.text.y = element_text(angle = 0, vjust = 0.5, hjust = 1))+
    scale_fill_manual(values = c("tomato","lightseagreen"))
  
  # </barplotEmpregabilidade>
  
  # <pieplotAtividade>
  
  localidades %>% 
    group_by(ATIV) %>% 
    summarise(
      contador = n()
    ) %>% tibble() %>% #isso esta errado, esta atribuindo valor de alguma maneira aos grupos que possuem apenas uma incidência
    ggplot(aes(x = "", y = ATIV, fill = ATIV, label = contador)) +
    geom_bar(stat = "identity") +
    coord_polar(theta = "y", start = 0) +
    theme_void() +
    geom_label(position = position_stack(vjust = 0.5), fill = "gray95") +
    labs(title="Incidência de localidade(s) por atividade") +
    scale_fill_manual(values = c("tomato","lightseagreen", "chartreuse4", "lightblue4", "khaki4", "peru", "cadetblue4", "orangered3", "royalblue4", "darkolivegreen4", "snow4"))
    
    
  
# </pieplotAtividade>
  
  # </charts>
  

  
    localidades %>%
    filter(POPULACAO != 0) %>%
    print()
  
    localidades %>% 
      group_by(ATIV) %>% 
      summarise(
        contador = n()
      ) %>% 
      
      localidades %>% 
      group_by(ATIV) %>% 
      summarise()

    localidades %>% 
      group_by(ATIV) %>% 
      summarise(
        contador = n()
      ) %>% tibble()
      