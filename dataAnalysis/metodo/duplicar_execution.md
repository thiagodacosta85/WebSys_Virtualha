# Procedimentos invariáveis para análise de dados

## Execução.

Procedimentos padrão para elaboração dos scripts:

- Abertura:
1. Instalação de bilbiotecas necessárias para a análise.
2. Importação das bibliotecas necessárias para a análise.
3. Conexão com a fonte de dados.
4. Conversão da fonte de dados para "data frame" idealemnte tipado.

- Sumarização:
1. Análise visual do data frame, identificando tipos e distribuição.
2. Descrecer as colunas e sumarização de dados necessários para satisfazer o objetivo da análise, ex:
````
col_POPULACAO ("typeof_data") = SUMARIZACAO | FILTRAGEM | ORDENACAO | CONVERSAO | etc
col_ZONA ("typeof_data") = AGREGACAO | PIVOTAMENTO | CLASSIFICACAO | etc
col_ID_LOCAL ("typeof_data") = EXCLUSAO
````
3. Estabelecimento das variaveis resultantes das operacoes com dados, ex:
````
poplucao_total
nomes_localidades
quantidade_zonas
````

4. Quais datafarames derivados serão geradas por agrupamentos e/ou reordenação de dados?
````
df_populacao_total
df_populacao_grupos
df_moradias
````
5. Estabelecimento das plotagens necessárias para apresentação da análise.
