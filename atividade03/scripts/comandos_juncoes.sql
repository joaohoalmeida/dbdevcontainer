-- D1. Um comando SELECT para exibir alguns dados dos registros de DUAS tabelas usando algum operador de junção qualificada (ex. INNER JOIN).
-- Lista a descrição da categoria de cada item na tabela lote
SELECT LOTE.nome, CATEGORIA.nome FROM LOTE
  INNER JOIN CATEGORIA ON LOTE.id_categoria = CATEGORIA.id_categoria;

-- D2. Um comando SELECT para exibir alguns dados dos registros de TRÊS tabelas usando os operadores de junção qualificada (ex. INNER JOIN).
-- Lista o nome do lote, leilão e o leiloeiro
SELECT LOTE.nome, LEILAO.nome, LEILOEIRO.nome FROM LOTE
  INNER JOIN LEILAO ON LOTE.id_leilao = LEILAO.id_leilao
  INNER JOIN LEILOEIRO ON LEILAO.CPF = LEILOEIRO.cpf;

-- D3. SELECT com JUNÇÃO EXTERNA (LEFT OUTER JOIN)
-- Lista todos os lotes e, quando existir, o valor do lance oferecido
SELECT LOTE.nome, OFERECE_LANCE.lance, OFERECE_LANCE.cpf FROM LOTE
  LEFT OUTER JOIN OFERECE_LANCE ON LOTE.id_lote = OFERECE_LANCE.id_lote;

-- D4. Um comando SELECT para exibir alguns dados dos registros de tabelas usando o operador de junção qualificada FULL OUTER JOIN.
-- Lista todas as categorias e todos os lotes.
SELECT CATEGORIA.nome, LOTE.nome AS nome_lote FROM CATEGORIA
  FULL OUTER JOIN LOTE ON CATEGORIA.id_categoria = LOTE.id_categoria;
