CREATE TABLE USUARIO
(
  cpf CHAR(11) NOT NULL,
  nome VARCHAR(100) NOT NULL,
  PRIMARY KEY (cpf)
);

CREATE TABLE VENDEDOR
(
  cnpj CHAR(14) NOT NULL,
  nome VARCHAR(150) NOT NULL,
  logo VARCHAR(255),
  PRIMARY KEY (cnpj)
);

CREATE TABLE LEILOEIRO
(
  cpf CHAR(11) NOT NULL,
  nome VARCHAR(100) NOT NULL,
  PRIMARY KEY (cpf)
);

CREATE TABLE LEILAO
(
  id_leilao INT NOT NULL,
  nome VARCHAR(150) NOT NULL,
  descricao TEXT,
  data_hora_inicio TIMESTAMP NOT NULL,
  data_hora_fim TIMESTAMP NOT NULL,
  cnpj CHAR(14) NOT NULL,
  cpf CHAR(11) NOT NULL,
  PRIMARY KEY (id_leilao),
  FOREIGN KEY (cnpj) REFERENCES VENDEDOR(cnpj),
  FOREIGN KEY (cpf) REFERENCES LEILOEIRO(cpf)
);

CREATE TABLE CATEGORIA
(
  id_categoria INT NOT NULL,
  nome VARCHAR(100) NOT NULL,
  descricao TEXT,
  PRIMARY KEY (id_categoria)
);

CREATE TABLE LOTE
(
  id_lote INT NOT NULL,
  nome VARCHAR(150) NOT NULL,
  descricao TEXT,
  arrematado BOOLEAN NOT NULL,
  lance_minimo DECIMAL(15,2) NOT NULL,
  data_hora_fim TIMESTAMP NOT NULL,
  id_leilao INT NOT NULL,
  id_categoria INT NOT NULL,
  PRIMARY KEY (id_lote),
  FOREIGN KEY (id_leilao) REFERENCES LEILAO(id_leilao),
  FOREIGN KEY (id_categoria) REFERENCES CATEGORIA(id_categoria)
);

CREATE TABLE OFERECE_LANCE
(
  cpf CHAR(11) NOT NULL,
  id_lote INT NOT NULL,
  id_lance INT NOT NULL,
  lance DECIMAL(15,2) NOT NULL,
  data_hora_lance TIMESTAMP NOT NULL,
  PRIMARY KEY (cpf, id_lote, id_lance),
  FOREIGN KEY (cpf) REFERENCES USUARIO(cpf),
  FOREIGN KEY (id_lote) REFERENCES LOTE(id_lote)
);

CREATE TABLE USUARIO_TELEFONE
(
  telefone VARCHAR(20) NOT NULL,
  cpf CHAR(11) NOT NULL,
  PRIMARY KEY (telefone, cpf),
  FOREIGN KEY (cpf) REFERENCES USUARIO(cpf)
);

CREATE TABLE USUARIO_ENDERECO
(
  endereco VARCHAR(200) NOT NULL,
  cpf CHAR(11) NOT NULL,
  PRIMARY KEY (endereco, cpf),
  FOREIGN KEY (cpf) REFERENCES USUARIO(cpf)
);

CREATE TABLE LOTE_ENDERECO
(
  endereco VARCHAR(200) NOT NULL,
  id_lote INT NOT NULL,
  PRIMARY KEY (endereco, id_lote),
  FOREIGN KEY (id_lote) REFERENCES LOTE(id_lote)
);
