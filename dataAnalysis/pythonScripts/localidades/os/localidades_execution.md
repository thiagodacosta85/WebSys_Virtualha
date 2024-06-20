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
col_NOME ("object") = COUNT | UNIQUE | print("all")
col_ZONA ("object") = COUNT | UNIQUE | print("all") |AGREGACAO | PIVOTAMENTO | CLASSIFICACAO | etc
col_POPULACAO ("int64") = SUMARISE
col_RESIDENCIAS_CONST (int64) = SUMARISE
col_RESIDENCIAS_POS (int64) = SUMARISE
col_TRABALHADORES_EFET (int64) = SUMARISE
col_VAGAS_DISP (int64) = SUMARISE
col_VIS_TUR (int64) = SUMARISE
col_CRIANCAS (int64) = SUMARISE
col_ADOLESC (int64) = SUMARISE
col_JOVENS_ADUL (int64) = SUMARISE
col_ADULTOS (int64) = SUMARISE
col_IDOSOS (int64) = SUMARISE
col_ATIV ("object") = COUNT | UNIQUE | print("all") | SUMARISE
col_VALOR_MED_TERRENO (int64) = SUMARISE
````
3. Estabelecimento das variaveis resultantes das operacoes com dados, ex:
````
nomes_localidades
total_localidades
nomes_zonas
total_zonas
total_populacao
total_residencias_const
total_residencias_pos
total_trabalhadores_efet
total_vagas_disp
saldo_trabalhista
total_turistas
total_criancas
total_adolesc
total_jovens_adul
total_adult
total_idosos
tipos_ativ
total_ativ
valor_med_terreno_geral
````
4. Quais datafarames derivados serão geradas por agrupamentos e/ou reordenação de dados?
````
df_agrupamento_populacao
df_atividades
df_distribuicao_atividades
df_empregabilidade
df_ocupacao_habitacional
````
5. Estabelecimento das plotagens necessárias para apresentação da análise.
````
barplot_distrib_populacional
barplot_distrib_populacional_grupos
barplot_distrib_localidades
barplot_valor_med_terreno
barplot_empregabilidade
barplot_distrib_localidades
````