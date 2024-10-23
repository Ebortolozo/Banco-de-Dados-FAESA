/*Apaga os relacionamentos*/
ALTER TABLE LABDATABASE.PEDIDOS DROP CONSTRAINT FORNECEDORES_PEDIDOS_FK;
ALTER TABLE LABDATABASE.PEDIDOS DROP CONSTRAINT CLIENTES_PEDIDOS_FK;
ALTER TABLE LABDATABASE.ITENS_PEDIDO DROP CONSTRAINT PEDIDOS_ITENS_PEDIDO_FK;
ALTER TABLE LABDATABASE.ITENS_PEDIDO DROP CONSTRAINT PRODUTOS_ITENS_PEDIDO_FK;

/*Apaga as tabelas*/
DROP TABLE LABDATABASE.FORNECEDORES;
DROP TABLE LABDATABASE.CLIENTES;
DROP TABLE LABDATABASE.PEDIDOS;
DROP TABLE LABDATABASE.PRODUTOS;
DROP TABLE LABDATABASE.ITENS_PEDIDO;

/*Apaga as sequences*/
DROP SEQUENCE LABDATABASE.PEDIDOS_CODIGO_PEDIDO_SEQ;
DROP SEQUENCE LABDATABASE.ITENS_PEDIDO_CODIGO_ITEM_SEQ;
DROP SEQUENCE LABDATABASE.PRODUTOS_CODIGO_PRODUTO_SEQ;

/*Cria as tabelas*/
CREATE TABLE LABDATABASE.FORNECEDORES (
                CNPJ VARCHAR2(14) NOT NULL,
                RAZAO_SOCIAL VARCHAR2(255) NOT NULL,
                NOME_FANTASIA VARCHAR2(255) NOT NULL,
                CONSTRAINT FORNECEDORES_PK PRIMARY KEY (CNPJ)
);

CREATE TABLE LABDATABASE.CLIENTES (
                CPF VARCHAR2(11) NOT NULL,
                NOME VARCHAR2(255) NOT NULL,
                CONSTRAINT CLIENTES_PK PRIMARY KEY (CPF)
);

CREATE TABLE LABDATABASE.PEDIDOS (
                CODIGO_PEDIDO NUMBER NOT NULL,
                DATA_PEDIDO DATE NOT NULL,
                CPF VARCHAR2(11) NOT NULL,
                CNPJ VARCHAR2(14) NOT NULL,
                CONSTRAINT PEDIDOS_PK PRIMARY KEY (CODIGO_PEDIDO)
);

CREATE TABLE LABDATABASE.PRODUTOS (
                CODIGO_PRODUTO NUMBER NOT NULL,
                DESCRICAO_PRODUTO VARCHAR2(255) NOT NULL,
                CONSTRAINT PRODUTOS_PK PRIMARY KEY (CODIGO_PRODUTO)
);

CREATE TABLE LABDATABASE.ITENS_PEDIDO (
                CODIGO_ITEM_PEDIDO NUMBER NOT NULL,
                QUANTIDADE NUMBER(9,3) NOT NULL,
                VALOR_UNITARIO NUMBER(9,2) NOT NULL,
                CODIGO_PEDIDO NUMBER NOT NULL,
                CODIGO_PRODUTO NUMBER NOT NULL,
                CONSTRAINT ITENS_PEDIDO_PK PRIMARY KEY (CODIGO_ITEM_PEDIDO)
);

/*Cria as sequences*/
CREATE SEQUENCE LABDATABASE.PEDIDOS_CODIGO_PEDIDO_SEQ;
CREATE SEQUENCE LABDATABASE.PRODUTOS_CODIGO_PRODUTO_SEQ;
CREATE SEQUENCE LABDATABASE.ITENS_PEDIDO_CODIGO_ITEM_SEQ;

/*Cria os relacionamentos*/
ALTER TABLE LABDATABASE.PEDIDOS ADD CONSTRAINT FORNECEDORES_PEDIDOS_FK
FOREIGN KEY (CNPJ)
REFERENCES LABDATABASE.FORNECEDORES (CNPJ)
NOT DEFERRABLE;

ALTER TABLE LABDATABASE.PEDIDOS ADD CONSTRAINT CLIENTES_PEDIDOS_FK
FOREIGN KEY (CPF)
REFERENCES LABDATABASE.CLIENTES (CPF)
NOT DEFERRABLE;

ALTER TABLE LABDATABASE.ITENS_PEDIDO ADD CONSTRAINT PEDIDOS_ITENS_PEDIDO_FK
FOREIGN KEY (CODIGO_PEDIDO)
REFERENCES LABDATABASE.PEDIDOS (CODIGO_PEDIDO)
NOT DEFERRABLE;

ALTER TABLE LABDATABASE.ITENS_PEDIDO ADD CONSTRAINT PRODUTOS_ITENS_PEDIDO_FK
FOREIGN KEY (CODIGO_PRODUTO)
REFERENCES LABDATABASE.PRODUTOS (CODIGO_PRODUTO)
NOT DEFERRABLE;

/*Garante acesso total as tabelas*/
GRANT ALL ON LABDATABASE.FORNECEDORES TO LABDATABASE;
GRANT ALL ON LABDATABASE.CLIENTES TO LABDATABASE;
GRANT ALL ON LABDATABASE.PEDIDOS TO LABDATABASE;
GRANT ALL ON LABDATABASE.PRODUTOS TO LABDATABASE;
GRANT ALL ON LABDATABASE.ITENS_PEDIDO TO LABDATABASE;

ALTER USER LABDATABASE quota unlimited on USERS;