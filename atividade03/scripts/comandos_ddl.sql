CREATE TABLE USUARIO
(
  cpf INT NOT NULL,
  nome INT NOT NULL,
  PRIMARY KEY (cpf)
);

CREATE TABLE VENDEDOR
(
  cnpj INT NOT NULL,
  nome INT NOT NULL,
  logo INT NOT NULL,
  PRIMARY KEY (cnpj)
);

CREATE TABLE LEILOEIRO
(
  cpf INT NOT NULL,
  nome INT NOT NULL,
  PRIMARY KEY (cpf)
);

CREATE TABLE LEILAO
(
  data_hora_inicio INT NOT NULL,
  data_hora_fim INT NOT NULL,
  id_leilao INT NOT NULL,
  nome INT NOT NULL,
  descricao INT NOT NULL,
  cnpj INT NOT NULL,
  cpf INT NOT NULL,
  PRIMARY KEY (id_leilao),
  FOREIGN KEY (cnpj) REFERENCES VENDEDOR(cnpj),
  FOREIGN KEY (cpf) REFERENCES LEILOEIRO(cpf)
);

CREATE TABLE CATEGORIA
(
  id_categoria INT NOT NULL,
  nome INT NOT NULL,
  descricao INT NOT NULL,
  PRIMARY KEY (id_categoria)
);

CREATE TABLE LOTE
(
  arrematado INT NOT NULL,
  lance_minimo INT NOT NULL,
  nome INT NOT NULL,
  descricao INT NOT NULL,
  id_lote INT NOT NULL,
  data_hora_fim INT NOT NULL,
  id_leilao INT NOT NULL,
  id_categoria INT NOT NULL,
  PRIMARY KEY (id_lote),
  FOREIGN KEY (id_leilao) REFERENCES LEILAO(id_leilao),
  FOREIGN KEY (id_categoria) REFERENCES CATEGORIA(id_categoria)
);

CREATE TABLE OFERECE_LANCE
(
  lance INT NOT NULL,
  data_hora_lance INT NOT NULL,
  id_lance INT NOT NULL,
  cpf INT NOT NULL,
  id_lote INT NOT NULL,
  PRIMARY KEY (cpf, id_lote),
  FOREIGN KEY (cpf) REFERENCES USUARIO(cpf),
  FOREIGN KEY (id_lote) REFERENCES LOTE(id_lote)
);

CREATE TABLE USUARIO_TELEFONE
(
  telefone INT NOT NULL,
  cpf INT NOT NULL,
  PRIMARY KEY (telefone, cpf),
  FOREIGN KEY (cpf) REFERENCES USUARIO(cpf)
);

CREATE TABLE USUARIO_ENDERECO
(
  endereco INT NOT NULL,
  cpf INT NOT NULL,
  PRIMARY KEY (endereco, cpf),
  FOREIGN KEY (cpf) REFERENCES USUARIO(cpf)
);

CREATE TABLE LOTE_ENDERECO
(
  endereco INT NOT NULL,
  id_lote INT NOT NULL,
  PRIMARY KEY (endereco, id_lote),
  FOREIGN KEY (id_lote) REFERENCES LOTE(id_lote)
);
