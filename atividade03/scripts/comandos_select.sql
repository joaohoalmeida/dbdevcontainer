-- C1. Um comando SELECT para listar todos os campos de todos os registros de uma tabela.
-- Lista todos os usuários
SELECT * FROM USUARIO;

-- C2. Um comando SELECT para listar alguns campos dos registros que satisfazem uma condição simples.
-- Lista nome e descrição da tabela lote onde o lance mínimo é maior que R$ 10.000,00
SELECT nome, descricao FROM LOTE
	WHERE lance_minimo > 10000

-- C3. Um comando SELECT para listar alguns campos dos registros que satisfazer uma condição composta.
-- Lista nome e descrição da tabela lote onde o lance mínimo é menor que R$ 500,00 e foi arrematado
SELECT nome, descricao from LOTE
	WHERE lance_minimo < 500 and arrematado = True

-- C4. Um comando SELECT usando GROUP BY com os campos dos registros que satisfazem uma condição.
-- Lista a quantidade de lotes por categoria onde foi arrematado
SELECT id_categoria, COUNT(*) AS total_lotes
	FROM LOTE
	WHERE arrematado = True
	GROUP BY id_categoria;

-- C5. Um comando SELECT contendo como condição outro SELECT (SELECTs aninhados).
-- Lista todos os usuários que ofereceram algum lance
SELECT nome from USUARIO
	WHERE cpf IN (SELECT cpf IN OFERECE_LANCE)
