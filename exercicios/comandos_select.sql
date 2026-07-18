--Listar todos os dados de todas as pessoas cadastradas.

SELECT * from consultas.pessoa

--Listar nome, e-mail e data de nascimento das pessoas cadastradas.

SELECT nome, email, data_nasc from consultas.pessoa 

--Listar nome, e-mail e data de nascimento da 3a à 8a pessoa cadastrada.


--Listar nome, e-mail e idade das pessoas cadastradas.

SELECT nome, email, AGE(NOW(), data_nasc) as idade from consultas.pessoa

--Listar a quantidade de agendamentos.

SELECT COUNT(*) from consultas.agendamento

--Listar a data/hora das consultas e os respectivos valores com desconto de 5%. Os valores devem ser precedidos com "R$". Por exemplo: R$ 150.00.


--Listar nome, cpf e e-mail dos pacientes que não possuem plano de saúde.

SELECT nome, cpf, email from consultas.pessoa
  WHERE cpf IN (SELECT cpf FROM consultas.paciente WHERE plano_saude = false) 

--Listar os dados dos agendamentos registrados para o mesmo o mês da consulta.

SELECT * from consultas.agendamento
  WHERE YEAR from dh_consulta = 

--Listar cpf, nome e e-mail dos pacientes que não possuem telefone.

SELECT cpf, nome, email from consultas.pessoa
  WHERE telefone IS NULL

--Listar a data das consultas cujo o valor está entre R$ 50.00 e R$ 100.00.

SELECT dh_consulta from consultas.agendamento
  WHERE valor_consulta BETWEEN 50 AND 100

--Listar cpf, nome e e-mail dos pacientes que moram em "Natal".

SELECT cpf, nome, email from consultas.pessoa 
  WHERE endereco LIKE '%Natal%'

--Listar cpf, nome, e-mail e data de nascimento dos pacientes ordenados pela data de nascimento.

SELECT cpf, nome, email, data_nasc from consultas.pessoa
  ORDER BY data_nasc ASC

--Listar a quantidade de pacientes que não possuem plano de saúde.

SELECT COUNT(*) from consultas.paciente
  WHERE plano_saude = false
  
--Listar o maior e o menor valor das consultas agendadas para cada dia que contém consulta.
  
--Listar a média dos valores das consultas agendadas para o mês de Dezembro.

  

  
--Listar nome e e-mail das pessoas que agendaram alguma consulta para o dia do seu aniversário.

SELECT nome, email from consultas.pessoa
  WHERE 

--Listar o nome, e-mail, cpf dos médicos e as suas respectivas especialidades.

select nome, email, cpf from consultas.pessoa
  WHERE cpf IN (SELECT cpf from consulta.medico 

--Listar a quantidade de consultas para cada médico.
