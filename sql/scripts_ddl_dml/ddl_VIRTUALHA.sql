CREATE DATABASE VIRTUALHA;
USE VIRTUALHA;

CREATE TABLE ALOCACOES (
    ID_ALOC INT(4) NOT NULL AUTO_INCREMENT,
    ALOC CHAR(4) NOT NULL,
    NOMENC VARCHAR(90) NOT NULL,
    DESCRI TEXT NOT NULL,
        PRIMARY KEY (ID_ALOC)
);

CREATE TABLE USUARIOS (
    ID_USUARIO INT(4) NOT NULL AUTO_INCREMENT,
    FK_ID_ALOC INT NOT NULL,
    NOME CHAR(45) NOT NULL,
    SOBR CHAR(90) NOT NULL,
    ALOC CHAR(4) NOT NULL,
    NIVEL CHAR(20) NOT NULL,
    LOGIN CHAR(20) NOT NULL,
    SENHA CHAR(6) NOT NULL,
        PRIMARY KEY (ID_USUARIO),
        CONSTRAINT FK_USUARIOS_ALOCACOES
            FOREIGN KEY (FK_ID_ALOC)
                REFERENCES ALOCACOES (ID_ALOC)
);

CREATE TABLE LOCALIDADES (
    ID_LOCAL INT(4) NOT NULL AUTO_INCREMENT,
    NOME CHAR(90) NOT NULL,
    ZONA CHAR(1) NOT NULL,
    POPULACAO INT (10) NOT NULL,
    RESIDENCIAS_CONST INT(6) NOT NULL,
    RESIDENCIAS_POS INT(6) NOT NULL,
    TRABALHADORES_EFET INT(10) NOT NULL,
    VAGAS_DISP INT(10) NOT NULL,
    VIS_TUR INT(10) NOT NULL,
    CRIANCAS INT(10) NOT NULL,
    ADOLESC INT(10) NOT NULL,
    JOVENS_ADUL INT(10) NOT NULL,
    ADULTOS INT(10) NOT NULL,
    IDOSOS INT(10) NOT NULL,
    ATIV CHAR(20) NOT NULL,
    VALOR_MED_TERRENO INT(6) NOT NULL,
    DATA_FUND DATE NOT NULL,
        PRIMARY KEY (ID_LOCAL)
);

CREATE TABLE SUSV (
    ID_UNIDADE INT(4) NOT NULL AUTO_INCREMENT,
    FK_ID_ALOC INT(4) NOT NULL,
    TIPO CHAR(30) NOT NULL,
    DATA_FUND DATE NOT NULL,
    DENOM VARCHAR(90) NOT NULL,
    STATUS TINYINT NOT NULL,
    FK_ID_LOCAL INT(4) NOT NULL,
    COMP VARCHAR(90) NOT NULL,
    ZONA CHAR(1) NOT NULL,
    CUSTO_MANUTEN FLOAT NOT NULL,
    CUSTO_IMPLEMENT FLOAT NOT NULL,
    CONSUMO_AGUA INT(6) NOT NULL,
    POLUICAO_AMB INT(6) NOT NULL,
    POLUICAO_SONORA INT(6) NOT NULL,
    CONSUMO_ENERG INT(6) NOT NULL,
    CAP_DE_ATENDIMENTO INT(6) NOT NULL,
    TOTAL_ATENDIDOS INT(6) NOT NULL,
    ATEND_SEM_ANTERIOR INT(6) NOT NULL,
    TOTAL_AMB_DISP INT(2) NOT NULL,
    TOTAL_AMB_USO INT(2) NOT NULL,
    CONDICAO VARCHAR(45) NOT NULL,
    CAP_VISITANTES INT(6) NOT NULL,
    VISITANTES_SEM_ANT INT(6) NOT NULL,
    QTDE_USUARIOS_CIDADE INT(6) NOT NULL,
    CAP_ARMAZ_CAD INT(6) NOT NULL,
    TOTAL_ARMAZ_CAD INT(6) NOT NULL,
    CAD_PROCESS_ULTIMA_SEM INT(6) NOT NULL,
    TOTAL_RAB_DISP INT(6) NOT NULL,
    TOTAL_RAB_USO INT(6) NOT NULL,
    TOTAL_HELICOP_DISP INT(6) NOT NULL,
    TOTAL_HELICOP_USO INT(6) NOT NULL,
        PRIMARY KEY (ID_UNIDADE),
        CONSTRAINT FK_SUSV_ALOCACOES
            FOREIGN KEY(FK_ID_ALOC)
                REFERENCES ALOCACOES (ID_ALOC),
        CONSTRAINT FK_SUSV_LOCALIDADES
            FOREIGN KEY (FK_ID_LOCAL)
                REFERENCES LOCALIDADES (ID_LOCAL)
);

CREATE TABLE CBMV (
    ID_UNIDADE INT(4) NOT NULL AUTO_INCREMENT,
    FK_ID_ALOC INT(4) NOT NULL,
    TIPO CHAR(30) NOT NULL,
    DATA_FUND DATE NOT NULL,
    DENOM VARCHAR(90) NOT NULL,
    STATUS TINYINT NOT NULL,
    FK_ID_LOCAL INT(4) NOT NULL,
    COMP VARCHAR(90),
    ZONA CHAR(1) NOT NULL,
    CUSTO_MANUTEN FLOAT NOT NULL,
    CUSTO_IMPLEMENT FLOAT NOT NULL,
    CONSUMO_AGUA INT(6) NOT NULL,
    POLUICAO_AMB INT(6) NOT NULL,
    POLUICAO_SONORA INT(6) NOT NULL,
    CONSUMO_ENERG INT(6) NOT NULL,
    QTDE_MAX_VIATURAS INT(6) NOT NULL,
    QTDE_ATUAL_VIATURAS INT(6) NOT NULL,
    QTDE_ATUAL_HELICOP INT(6) NOT NULL,
    ALTURA_TORRE INT(4) NOT NULL,
    VISIBILIDADE_TORRE INT(6) NOT NULL,
    QTDE_HELICOP_USO INT(6) NOT NULL,
        PRIMARY KEY (ID_UNIDADE),
        CONSTRAINT FK_CBMC_ALOCACOES
            FOREIGN KEY (FK_ID_ALOC)
                REFERENCES ALOCACOES (ID_ALOC),
        CONSTRAINT FK_CBMV_LOCALIDADES
            FOREIGN KEY (FK_ID_LOCAL)
                REFERENCES LOCALIDADES (ID_LOCAL)
);

CREATE TABLE DPMV (
    ID_UNIDADE INT(4) NOT NULL AUTO_INCREMENT,
    FK_ID_ALOC INT(4) NOT NULL,
    TIPO CHAR(30) NOT NULL,
    DATA_FUND DATE NOT NULL,
    DENOM VARCHAR(90),
    STATUS TINYINT NOT NULL,
    FK_ID_LOCAL INT(4) NOT NULL,
    COMP VARCHAR(90),
    ZONA CHAR(1) NOT NULL,
    CUSTO_MANUTEN FLOAT NOT NULL,
    CUSTO_IMPLEMENT FLOAT NOT NULL,
    CONSUMO_AGUA INT(6) NOT NULL,
    POLUICAO_AMB INT(6) NOT NULL,
    POLUICAO_SONORA INT(6) NOT NULL,
    CONSUMO_ENERG INT(6) NOT NULL,
    QTDE_MAX_VIATURAS INT(6) NOT NULL,
    QTDE_ATUAL_VIATURAS INT(6) NOT NULL,
    QTDE_ATUAL_HELICOP INT(6) NOT NULL,
    QTDE_MAX_DETENTOS INT(6) NOT NULL,
    QTDE_ATUAL_DETENTOS INT(6) NOT NULL,
    QTDE_HELICOP_USO INT(6) NOT NULL,
        PRIMARY KEY (ID_UNIDADE),
        CONSTRAINT FK_DPMV_ALOCACOES
            FOREIGN KEY (FK_ID_ALOC)
                REFERENCES ALOCACOES (ID_ALOC),
        CONSTRAINT FK_DPMV_LOCALIDADES
            FOREIGN KEY (FK_ID_LOCAL)
                REFERENCES LOCALIDADES (ID_LOCAL)
);

CREATE TABLE SIAP (
    ID_UNIDADE INT(4) NOT NULL AUTO_INCREMENT,
    FK_ID_ALOC INT(4) NOT NULL,
    TIPO CHAR(30) NOT NULL,
    DATA_FUND DATE NOT NULL,
    DENOM VARCHAR(90),
    STATUS TINYINT NOT NULL,
    FK_ID_LOCAL INT(4) NOT NULL,
    COMP VARCHAR(90) NOT NULL,
    ZONA CHAR(1) NOT NULL,
    CUSTO_MANUTEN FLOAT NOT NULL,
    CUSTO_IMPLEMENT FLOAT NOT NULL,
    CONSUMO_AGUA INT(6) NOT NULL,
    POLUICAO_AMB INT(6) NOT NULL,
    POLUICAO_SONORA INT(6) NOT NULL,
    CONSUMO_ENERG INT(6) NOT NULL,
    CAP_MAX_PROD INT(9) NOT NULL,
    CAP_ATUAL_PROD INT(9) NOT NULL,
    QTDE_MAX_CAMINHOES INT(6) NOT NULL,
    TAXA_ATUAL_ARMAZ INT(6) NOT NULL,
    TAXA_ATUAL_PROCESS INT(6) NOT NULL,
    QTDE_ATUAL_CAMINHOES INT(6) NOT NULL,
    TOTAL_VAGAS_TRAB INT(6) NOT NULL,
    TOTAL_ATUAL_TRAB INT(6) NOT NULL,
    VARIACAO CHAR(30) NOT NULL,
    MATERIA_PRIMA VARCHAR(30) NOT NULL,
    PRODUTO_FINAL VARCHAR(30) NOT NULL,
    MODO_ARMAZ VARCHAR(30) NOT NULL,
    CAP_MAX_EST INT(6) NOT NULL,
    CAP_ATUAL_EST INT(6) NOT NULL,
        PRIMARY KEY (ID_UNIDADE),
        CONSTRAINT FK_SIAP_ALOCACOES
            FOREIGN KEY (FK_ID_ALOC)
                REFERENCES ALOCACOES (ID_ALOC),
        CONSTRAINT FK_SIAP_LOCALIDADES
            FOREIGN KEY (FK_ID_LOCAL)
                REFERENCES LOCALIDADES (ID_LOCAL)
);

CREATE TABLE JAEE (
    ID_UNIDADE INT(4) NOT NULL AUTO_INCREMENT,
    FK_ID_ALOC INT(4) NOT NULL,
    TIPO CHAR(30) NOT NULL,
    DATA_FUND DATE NOT NULL,
    DENOM VARCHAR(90) NOT NULL,
    STATUS TINYINT NOT NULL,
    FK_ID_LOCAL INT(4) NOT NULL,
    COMP VARCHAR(90) NOT NULL,
    ZONA CHAR(1) NOT NULL,
    CUSTO_MANUTEN FLOAT NOT NULL,
    CUSTO_IMPLEMENT FLOAT NOT NULL,
    CONSUMO_AGUA INT(6) NOT NULL,
    POLUICAO_AMB INT(6) NOT NULL,
    POLUICAO_SONORA INT(6) NOT NULL,
    CONSUMO_ENERG INT(6) NOT NULL,
    CAP_VISITANTES INT(6) NOT NULL,
    CIDADAOS_VISIT INT(6) NOT NULL,
    TURISTAS_VISIT INT(6) NOT NULL,
    ENTRETENIMENTO INT(6) NOT NULL,
        PRIMARY KEY(ID_UNIDADE),
        CONSTRAINT FK_JAEE_ALOCACOES
            FOREIGN KEY (FK_ID_ALOC)
                REFERENCES ALOCACOES (ID_ALOC),
        CONSTRAINT FK_JAEE_LOCALIDADES
            FOREIGN KEY (FK_ID_LOCAL)
                REFERENCES LOCALIDADES (ID_LOCAL)
);

CREATE TABLE DAPP (
    ID_UNIDADE INT(4) NOT NULL AUTO_INCREMENT,
    FK_ID_ALOC INT(4) NOT NULL,
    TIPO CHAR(30) NOT NULL,
    DATA_FUND DATE NOT NULL,
    DENOM VARCHAR(90) NOT NULL,
    STATUS TINYINT NOT NULL,
    FK_ID_LOCAL INT(4) NOT NULL,
    COMP VARCHAR(90) NOT NULL,
    ZONA CHAR(1) NOT NULL,
    CUSTO_MANUTEN FLOAT NOT NULL,
    CUSTO_IMPLEMENT FLOAT NOT NULL,
    CONSUMO_AGUA INT(6) NOT NULL,
    POLUICAO_AMB INT(6) NOT NULL,
    POLUICAO_SONORA INT(6) NOT NULL,
    CONSUMO_ENERG INT(6) NOT NULL,
    CAP_VISITANTES INT(6) NOT NULL,
    CIDADAOS_VISIT INT(6) NOT NULL,
    TURISTAS_VISIT INT(6) NOT NULL,
    ENTRETENIMENTO INT(6) NOT NULL,
    QTDE_MAX_CAMINHOES INT(6) NOT NULL,
    QTDE_ATUAL_CAMINHOES INT(6) NOT NULL,
        PRIMARY KEY (ID_UNIDADE),
        CONSTRAINT FK_DAPP_ALOCACOES
            FOREIGN KEY (FK_ID_ALOC)
                REFERENCES ALOCACOES (ID_ALOC),
        CONSTRAINT FK_DAPP_LOCALIDADES
            FOREIGN KEY (FK_ID_LOCAL)
                REFERENCES LOCALIDADES (ID_LOCAL)
);

CREATE TABLE SIEF (
    ID_UNIDADE INT(4) NOT NULL AUTO_INCREMENT,
    FK_ID_ALOC INT(4) NOT NULL,
    TIPO CHAR(30) NOT NULL,
    DATA_FUND DATE NOT NULL,
    DENOM VARCHAR(90) NOT NULL,
    STATUS TINYINT NOT NULL,
    FK_ID_LOCAL INT(4) NOT NULL,
    COMP VARCHAR(90) NOT NULL,
    ZONA CHAR(1) NOT NULL,
    CUSTO_MANUTEN FLOAT NOT NULL,
    CUSTO_IMPLEMENT FLOAT NOT NULL,
    CONSUMO_AGUA INT(6) NOT NULL,
    POLUICAO_AMB INT(6) NOT NULL,
    POLUICAO_SONORA INT(6) NOT NULL,
    CONSUMO_ENERG INT(6) NOT NULL,
    CAP_MAX_PROD INT(9) NOT NULL,
    CAP_ATUAL_PROD INT(9) NOT NULL,
    QTDE_MAX_CAMINHOES INT(6) NOT NULL,
    TAXA_ATUAL_ARMAZ INT(6) NOT NULL,
    TAXA_ATUAL_PROCESS INT(6) NOT NULL,
    QTDE_ATUAL_CAMINHOES INT(6) NOT NULL,
    TOTAL_VAGAS_TRAB INT(6) NOT NULL,
    TOTAL_ATUAL_TRAB INT(6) NOT NULL,
    VARIACAO CHAR(30) NOT NULL,
    MATERIA_PRIMA VARCHAR(30) NOT NULL,
    PRODUTO_FINAL VARCHAR(30) NOT NULL,
    MODO_ARMAZ VARCHAR(30) NOT NULL,
    CAP_MAX_EST INT(6) NOT NULL,
    CAP_ATUAL_EST INT(6) NOT NULL,
        PRIMARY KEY (ID_UNIDADE),
        CONSTRAINT FK_SIEF_ALOCACOES
            FOREIGN KEY (FK_ID_ALOC)
                REFERENCES ALOCACOES (ID_ALOC),
        CONSTRAINT FK_SIEF_LOCALIDADES
            FOREIGN KEY (FK_ID_LOCAL)
                REFERENCES LOCALIDADES (ID_LOCAL)
);

CREATE TABLE SSPV (
    ID_UNIDADE INT(4) NOT NULL AUTO_INCREMENT,
    FK_ID_ALOC INT(4) NOT NULL,
    TIPO CHAR(30) NOT NULL,
    DATA DATE NOT NULL,
    DENOM VARCHAR(90) NOT NULL,
    STATUS TINYINT NOT NULL,
    FK_ID_LOCAL INT(4) NOT NULL,
    COMP VARCHAR(90) NOT NULL,
    ZONA CHAR(1) NOT NULL,
    CUSTO_MANUTEN FLOAT NOT NULL,
    CUSTO_IMPLEMENT FLOAT NOT NULL,
    CONSUMO_AGUA INT(6) NOT NULL,
    POLUICAO_AMB INT(6) NOT NULL,
    POLUICAO_SONORA INT(6) NOT NULL,
    CONSUMO_ENERG INT(6) NOT NULL,
        PRIMARY KEY (ID_UNIDADE),
        CONSTRAINT FK_SSPV_ALOCACOES
            FOREIGN KEY (FK_ID_ALOC)
                REFERENCES ALOCACOES (ID_ALOC),
        CONSTRAINT FK_SSPV_LOCALIDADES
            FOREIGN KEY (FK_ID_LOCAL)
                REFERENCES LOCALIDADES (ID_LOCAL)
);

CREATE TABLE SIPA (
    ID_UNIDADE INT(4) NOT NULL AUTO_INCREMENT,
    FK_ID_ALOC INT(4) NOT NULL,
    TIPO CHAR(30) NOT NULL,
    DATA_FUND DATE NOT NULL,
    DENOM VARCHAR(90) NOT NULL,
    STATUS TINYINT NOT NULL,
    FK_ID_LOCAL INT(4) NOT NULL,
    COMP VARCHAR(90) NOT NULL,
    ZONA CHAR(1) NOT NULL,
    CUSTO_MANUTEN FLOAT NOT NULL,
    CUSTO_IMPLEMENT FLOAT NOT NULL,
    CONSUMO_AGUA INT(6) NOT NULL,
    POLUICAO_AMB INT(6) NOT NULL,
    POLUICAO_SONORA INT(6) NOT NULL,
    CONSUMO_ENERG INT(6) NOT NULL,
    CAP_MAX_PROD INT(9) NOT NULL,
    CAP_ATUAL_PROD INT(9) NOT NULL,
    QTDE_MAX_CAMINHOES INT(6) NOT NULL,
    TAXA_ATUAL_ARMAZ INT(6) NOT NULL,
    TAXA_ATUAL_PROCESS INT(6) NOT NULL,
    QTDE_ATUAL_CAMINHOES INT(6) NOT NULL,
    TOTAL_VAGAS_TRAB INT(6) NOT NULL,
    TOTAL_ATUAL_TRAB INT(6) NOT NULL,
    VARIACAO VARCHAR(30) NOT NULL,
    MATERIA_PRIMA VARCHAR(30) NOT NULL,
    PRODUTO_FINAL VARCHAR(30) NOT NULL,
    MODO_ARMAZ VARCHAR(30) NOT NULL,
    CAP_MAX_EST INT(6) NOT NULL,
    CAP_ATUAL_EST INT(6) NOT NULL,
    EFICIENCIA_ROTA INT(3) NOT NULL,
        PRIMARY KEY (ID_UNIDADE),
        CONSTRAINT FK_SIPA_ALOCACOES
            FOREIGN KEY (FK_ID_ALOC)
                REFERENCES ALOCACOES (ID_ALOC),
        CONSTRAINT FK_SIPA_LOCALIDADES
            FOREIGN KEY (FK_ID_LOCAL)
                REFERENCES LOCALIDADES (ID_LOCAL)
);

CREATE TABLE SIEV (
    ID_UNIDADE INT(4) NOT NULL AUTO_INCREMENT,
    FK_ID_ALOC INT(4) NOT NULL,
    TIPO CHAR(30) NOT NULL,
    DATA_FUND DATE NOT NULL,
    DENOM VARCHAR(90) NOT NULL,
    STATUS TINYINT NOT NULL,
    FK_ID_LOCAL INT(4) NOT NULL,
    COMP VARCHAR(90) NOT NULL,
    ZONA CHAR(1) NOT NULL,
    CUSTO_MANUTEN FLOAT NOT NULL,
    CUSTO_IMPLEMENT FLOAT NOT NULL,
    CONSUMO_AGUA INT(6) NOT NULL,
    POLUICAO_AMB INT(6) NOT NULL,
    POLUICAO_SONORA INT(6) NOT NULL,
    CONSUMO_ENERG INT(6) NOT NULL,
    CAP_MAX_PROD INT(9) NOT NULL,
    TAXA_ATUAL_PROD INT(6) NOT NULL,
    QTDE_MAX_CAMINHOES INT(6) NOT NULL,
    QTDE_MP_UTILIZADAS INT(2) NOT NULL,
    PRODUTO_FINAL VARCHAR(30) NOT NULL,
    QTDE_ATUAL_CAMINHOES INT(6) NOT NULL,
    CAP_MAX_ARMAZ INT(6) NOT NULL,
    TOTAL_ATUAL_ARMAZ INT(6) NOT NULL,
    TOTAL_ATUAL_TRAB INT(6) NOT NULL,
    CONDICAO VARCHAR(45) NOT NULL,
    CUSTO_TOTAL_MP FLOAT NOT NULL,
    VALOR_TOTAL_PROD FLOAT NOT NULL,
        PRIMARY KEY (ID_UNIDADE),
        CONSTRAINT FK_SIEV_ALOCACOES
            FOREIGN KEY (FK_ID_ALOC)
                REFERENCES ALOCACOES (ID_ALOC),
        CONSTRAINT FK_SIEV_LOCALIDADES
            FOREIGN KEY (FK_ID_LOCAL)
                REFERENCES LOCALIDADES (ID_LOCAL)
);

CREATE TABLE SECV (
    ID_UNIDADE INT(4) NOT NULL AUTO_INCREMENT,
    FK_ID_ALOC INT(4) NOT NULL,
    TIPO CHAR(30) NOT NULL,
    DATA_FUND DATE NOT NULL,
    DENOM VARCHAR(50) NOT NULL,
    STATUS TINYINT NOT NULL,
    FK_ID_LOCAL INT(4) NOT NULL,
    COMP VARCHAR(90) NOT NULL,
    ZONA CHAR(1) NOT NULL,
    CUSTO_MANUTEN FLOAT NOT NULL,
    CUSTO_IMPLEMENT FLOAT NOT NULL,
    CONSUMO_AGUA INT(6) NOT NULL,
    POLUICAO_AMB INT(6) NOT NULL,
    POLUICAO_SONORA INT(6) NOT NULL,
    CONSUMO_ENERG INT(6) NOT NULL,
    VAGAS_TOTAIS INT(6) NOT NULL,
    ALU_MATRICULADOS INT(6) NOT NULL,
    ALU_APTO_MUN INT(6) NOT NULL,
    VISIT_SEM_PASS INT(6) NOT NULL,
    USUARIOS_CIDADE INT(6) NOT NULL,
    ENTRETENIMENTO INT(6) NOT NULL,
        PRIMARY KEY (ID_UNIDADE),
        CONSTRAINT FK_SECV_ALOCACOES
            FOREIGN KEY (FK_ID_ALOC)
                REFERENCES ALOCACOES (ID_ALOC),
        CONSTRAINT FK_SECV_LOCALIDADES
            FOREIGN KEY (FK_ID_LOCAL)
                REFERENCES LOCALIDADES (ID_LOCAL)
);

CREATE TABLE CEEV (
    ID_UNIDADE INT(4) NOT NULL AUTO_INCREMENT,
    FK_ID_ALOC INT(4) NOT NULL,
    TIPO CHAR(30) NOT NULL,
    DATA_FUND DATE NOT NULL,
    DENOM VARCHAR(30) NOT NULL,
    STATUS TINYINT NOT NULL,
    FK_ID_LOCAL INT(4) NOT NULL,
    COMP VARCHAR(90) NOT NULL,
    ZONA CHAR(1) NOT NULL,
    CUSTO_MANUTEN FLOAT NOT NULL,
    CUSTO_IMPLEMENT FLOAT NOT NULL,
    CONSUMO_AGUA INT(6) NOT NULL,
    PROD_ENERG_TOTAL INT(6) NOT NULL,
    PROD_ENERG_EST INT(6) NOT NULL,
    POLUICAO_AMB INT(6) NOT NULL,
    POLUICAO_SONORA INT(6) NOT NULL,
        PRIMARY KEY (ID_UNIDADE),
        CONSTRAINT FK_CEEV_ALOCACOES
            FOREIGN KEY (FK_ID_ALOC)
                REFERENCES ALOCACOES (ID_ALOC),
        CONSTRAINT FK_CEEV_LOCALIDADES
            FOREIGN KEY (FK_ID_LOCAL)
                REFERENCES LOCALIDADES (ID_LOCAL)
);

CREATE TABLE STGV (
    ID_UNIDADE INT(4) NOT NULL AUTO_INCREMENT,
    FK_ID_ALOC INT(4) NOT NULL,
    TIPO CHAR(30) NOT NULL,
    DATA_FUND DATE NOT NULL,
    DENOM VARCHAR(90) NOT NULL,
    STATUS TINYINT NOT NULL,
    FK_ID_LOCAL INT(4) NOT NULL,
    COMP VARCHAR(30) NOT NULL,
    ZONA CHAR(1) NOT NULL,
    CUSTO_MANUTEN FLOAT NOT NULL,
    CUSTO_IMPLEMENT FLOAT NOT NULL,
    CONSUMO_AGUA INT(6) NOT NULL,
    POLUICAO_AMB INT(6) NOT NULL,
    POLUICAO_SONORA INT(6) NOT NULL,
    CONSUMO_ENERG INT(6) NOT NULL,
    NR_PESSOAS_ATEND INT(6) NOT NULL,
    QTDE_VEICULOS INT(6) NOT NULL,
    QTDE_VEIC_USO INT(6) NOT NULL,
        PRIMARY KEY (ID_UNIDADE),
        CONSTRAINT FK_STGV_ALOCACOES
            FOREIGN KEY (FK_ID_ALOC)
                REFERENCES ALOCACOES (ID_ALOC),
        CONSTRAINT FK_STGV_LOCALIDADES
            FOREIGN KEY (FK_ID_LOCAL)
                REFERENCES LOCALIDADES (ID_LOCAL)
);

CREATE TABLE SIEM (
  ID_UNIDADE INT(4) NOT NULL AUTO_INCREMENT,
  FK_ID_ALOC INT(4) NOT NULL,
  TIPO CHAR(30) NOT NULL,
  DATA_FUND DATE NOT NULL,
  DENOM VARCHAR(90) NOT NULL,
  STATUS TINYINT NOT NULL,
  FK_ID_LOCAL INT(4) NOT NULL,
  COMP VARCHAR(90) NOT NULL,
  ZONA CHAR(1) NOT NULL,
  CUSTO_MANUTEN FLOAT NOT NULL,
  CUSTO_IMPLEMENT FLOAT NOT NULL,
  CONSUMO_AGUA INT(6) NOT NULL,
  POLUICAO_AMB INT(6) NOT NULL,
  POLUICAO_SONORA INT(6) NOT NULL,
  CONSUMO_ENERG INT(6) NOT NULL,
  CAP_MAX_PROD INT(9) NOT NULL,
  CAP_ATUAL_PROD INT(9) NOT NULL,
  QTDE_MAX_CAMINHOES INT(6) NOT NULL,
  TAXA_ATUAL_ARMAZ INT(6) NOT NULL,
  TAXA_ATUAL_PROCESS INT(6) NOT NULL,
  QTDE_ATUAL_CAMINHOES INT(6) NOT NULL,
  TOTAL_VAGAS_TRAB INT(6) NOT NULL,
  TOTAL_ATUAL_TRAB INT(6) NOT NULL,
  VARIACAO CHAR(30) NOT NULL,
  MATERIA_PRIMA VARCHAR(30) NOT NULL,
  PRODUTO_FINAL VARCHAR(30) NOT NULL,
  MODO_ARMAZ VARCHAR(30) NOT NULL,
  CAP_MAX_EST INT(6) NOT NULL,
  CAP_ATUAL_EST INT(6) NOT NULL,
    PRIMARY KEY (ID_UNIDADE),
    CONSTRAINT FK_SIEM_ALOCACOES
        FOREIGN KEY (FK_ID_ALOC)
            REFERENCES ALOCACOES (ID_ALOC),
    CONSTRAINT FK_SIEM_LOCALIDADES
        FOREIGN KEY (FK_ID_LOCAL)
            REFERENCES LOCALIDADES (ID_LOCAL)
);

CREATE TABLE SIEP (
    ID_UNIDADE INT(4) NOT NULL AUTO_INCREMENT,
    FK_ID_ALOC INT(4) NOT NULL,
    TIPO CHAR(30) NOT NULL,
    DATA_FUND DATE NOT NULL,
    DENOM VARCHAR(90) NOT NULL,
    STATUS TINYINT NOT NULL,
    FK_ID_LOCAL INT(4) NOT NULL,
    COMP VARCHAR(90) NOT NULL,
    ZONA CHAR(1) NOT NULL,
    CUSTO_MANUTEN FLOAT NOT NULL,
    CUSTO_IMPLEMENT FLOAT NOT NULL,
    CONSUMO_AGUA INT(6) NOT NULL,
    POLUICAO_AMB INT(6) NOT NULL,
    POLUICAO_SONORA INT(6) NOT NULL,
    CONSUMO_ENERG INT(6) NOT NULL,
    CAP_MAX_PROD INT(9) NOT NULL,
    CAP_ATUAL_PROD INT(9) NOT NULL,
    QTDE_MAX_CAMINHOES INT(6) NOT NULL,
    TAXA_ATUAL_ARMAZ INT(6) NOT NULL,
    TAXA_ATUAL_PROCESS INT(6) NOT NULL,
    QTDE_ATUAL_CAMINHOES INT(6) NOT NULL,
    TOTAL_VAGAS_TRAB INT(6) NOT NULL,
    TOTAL_ATUAL_TRAB INT(6) NOT NULL,
    VARIACAO CHAR(30) NOT NULL,
    MATERIA_PRIMA VARCHAR(30) NOT NULL,
    PRODUTO_FINAL VARCHAR(30) NOT NULL,
    MODO_ARMAZ VARCHAR(30) NOT NULL,
    CAP_MAX_EST INT(6) NOT NULL,
    CAP_ATUAL_EST INT(6) NOT NULL,
        PRIMARY KEY (ID_UNIDADE),
        CONSTRAINT FK_SIEP_ALOCACOES
            FOREIGN KEY (FK_ID_ALOC)
                REFERENCES ALOCACOES (ID_ALOC),
        CONSTRAINT FK_SIEP_LOCALIDADES
            FOREIGN KEY (FK_ID_LOCAL)
                REFERENCES LOCALIDADES (ID_LOCAL)
);

CREATE TABLE CCPL (
    ID_UNIDADE INT(4) NOT NULL AUTO_INCREMENT,
    FK_ID_ALOC INT(4) NOT NULL,
    TIPO CHAR(30) NOT NULL,
    DATA_FUND DATE NOT NULL,
    DENOM VARCHAR(90) NOT NULL,
    STATUS TINYINT NOT NULL,
    FK_ID_LOCAL INT(4) NOT NULL,
    COMP VARCHAR(90) NOT NULL,
    ZONA CHAR(1) NOT NULL,
    CUSTO_MANUTEN FLOAT NOT NULL,
    CUSTO_IMPLEMENT FLOAT NOT NULL,
    CONSUMO_AGUA INT(6) NOT NULL,
    PROD_ENERG_ATUAL INT(6) NOT NULL,
    CAP_MAX_GER_ENERG INT(6) NOT NULL,
    CONSUMO_ENERG INT(6) NOT NULL,
    CAP_MAX_ARMAZ INT(6) NOT NULL,
    CAP_MAX_PROCESS INT(6) NOT NULL,
    QTDE_MAX_CAMINHOES INT(6) NOT NULL,
    QTDE_ATUAL_ARMAZ INT(6) NOT NULL,
    TAXA_ATUAL_PROCESS INT(6) NOT NULL,
    QTDE_ATUAL_CAMINHOES INT(6) NOT NULL,
    POLUICAO_AMB INT(6) NOT NULL,
    POLUICAO_SONORA INT(6) NOT NULL,
        PRIMARY KEY (ID_UNIDADE),
        CONSTRAINT FK_CCPL_ALOCACOES
            FOREIGN KEY (FK_ID_ALOC)
                REFERENCES ALOCACOES (ID_ALOC),
        CONSTRAINT FK_CCPL_LOCALIDADES
            FOREIGN KEY (FK_ID_LOCAL)
                REFERENCES LOCALIDADES (ID_LOCAL)
);

CREATE TABLE DERP (
    ID_UNIDADE INT(4) NOT NULL AUTO_INCREMENT,
    FK_ID_ALOC INT(4) NOT NULL,
    TIPO CHAR(30) NOT NULL,
    DATA_FUND DATE NOT NULL,
    DENOM VARCHAR(90) NOT NULL,
    STATUS TINYINT NOT NULL,
    FK_ID_LOCAL INT(4) NOT NULL,
    COMP VARCHAR(90) NOT NULL,
    ZONA CHAR(1) NOT NULL,
    CUSTO_MANUTEN FLOAT NOT NULL,
    CUSTO_IMPLEMENT FLOAT NOT NULL,
    CONSUMO_AGUA INT(6) NOT NULL,
    POLUICAO_AMB INT(6) NOT NULL,
    POLUICAO_SONORA INT(6) NOT NULL,
    CONSUMO_ENERG INT(6) NOT NULL,
    NR_VIAS INT(2) NOT NULL,
    QTDE_VEIC_PROCESS INT(6) NOT NULL,
    QTDE_MAX_CAMINHOES INT(6) NOT NULL,
    VALOR_CARRO_PASS FLOAT NOT NULL,
    VALOR_VEIC_PESADO FLOAT NOT NULL,
    QTDE_ATUAL_CAMINHOES INT(6) NOT NULL,
        PRIMARY KEY (ID_UNIDADE),
        CONSTRAINT FK_DERP_ALOCACOES
            FOREIGN KEY (FK_ID_ALOC)
                REFERENCES ALOCACOES (ID_ALOC),
        CONSTRAINT FK_DERP_LOCALIDADES
            FOREIGN KEY (FK_ID_LOCAL)
            REFERENCES LOCALIDADES (ID_LOCAL)
);

CREATE TABLE CAEV (
    ID_UNIDADE INT(4) NOT NULL AUTO_INCREMENT,
    FK_ID_ALOC INT(4) NOT NULL,
    TIPO CHAR(30) NOT NULL,
    DATA_FUND DATE NOT NULL,
    DENOM VARCHAR(90) NOT NULL,
    STATUS TINYINT NOT NULL,
    FK_ID_LOCAL INT(4) NOT NULL,
    COMP VARCHAR(90) NOT NULL,
    ZONA CHAR(1) NOT NULL,
    CUSTO_MANUTEN FLOAT NOT NULL,
    CUSTO_IMPLEMENT FLOAT NOT NULL,
    CONSUMO_ENERG INT(6) NOT NULL,
    FORNEC_TOTAL_AGUA INT(10) NOT NULL,
    TAXA_DREN_TOTAL INT(10) NOT NULL,
    CAP_ARMAZ INT(10) NOT NULL,
    POLUICAO_AMB INT(6) NOT NULL,
    POLUICAO_SONORA INT(6) NOT NULL,
        PRIMARY KEY (ID_UNIDADE),
        CONSTRAINT FK_CAEV_ALOCACOES
            FOREIGN KEY (FK_ID_ALOC)
                REFERENCES ALOCACOES (ID_ALOC),
        CONSTRAINT FK_CAEV_LOCALIDADES
            FOREIGN KEY (FK_ID_LOCAL)
                REFERENCES LOCALIDADES (ID_LOCAL)
);

CREATE TABLE SAAG (
    ID_UNIDADE INT(4) NOT NULL AUTO_INCREMENT,
    FK_ID_ALOC INT(4) NOT NULL,
    TIPO CHAR(30) NOT NULL,
    DATA_FUND DATE NOT NULL,
    DENOM VARCHAR(90) NOT NULL,
    STATUS TINYINT NOT NULL,
    FK_ID_LOCAL INT(4) NOT NULL,
    COMP VARCHAR(90) NOT NULL,
    ZONA CHAR(1) NOT NULL,
    CUSTO_MANUTEN FLOAT NOT NULL,
    CUSTO_IMPLEMENT FLOAT NOT NULL,
    CONSUMO_AGUA INT(6) NOT NULL,
    POLUICAO_AMB INT(6) NOT NULL,
    POLUICAO_SONORA INT(6) NOT NULL,
    CONSUMO_ENERG INT(6) NOT NULL,
    RECURSO_ARMAZ CHAR(30) NOT NULL,
    MODO_ARMAZ CHAR(30) NOT NULL,
    QTDE_MAX_CAMINHOES INT(6) NOT NULL,
    CAP_MAX_ARMAZ INT(6) NOT NULL,
    TOTAL_ATUAL_ARMAZ INT(6) NOT NULL,
    QTDE_ATUAL_CAMINHOES INT(6) NOT NULL,
    TOTAL_VAGAS_TRAB INT(6) NOT NULL,
    TOTAL_ATUAL_TRAB INT(6) NOT NULL,
        PRIMARY KEY (ID_UNIDADE),
        CONSTRAINT FK_SAAG_ALOCACOES
            FOREIGN KEY (FK_ID_ALOC)
                REFERENCES ALOCACOES (ID_ALOC),
        CONSTRAINT FK_SAAG_LOCALIDADES
            FOREIGN KEY (FK_ID_LOCAL)
                REFERENCES LOCALIDADES (ID_LOCAL)
    );