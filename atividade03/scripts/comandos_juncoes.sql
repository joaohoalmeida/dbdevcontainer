-- D1. Um comando SELECT para exibir alguns dados dos registros de DUAS tabelas usando algum operador de junção qualificada (ex. INNER JOIN).
-- Lista a descrição da categoria de cada item na tabela lote
SELECT LOTE.nome, CATEGORIA.nome FROM LOTE
  INNER JOIN CATEGORIA ON LOTE.id_categoria = CATEGORIA.id_categoria;
