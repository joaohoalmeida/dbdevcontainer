--Listar todos os dados de todas as pessoas cadastradas.

SELECT * from consultas.pessoa

--Listar nome, e-mail e data de nascimento das pessoas cadastradas.

SELECT nome, email, data_nasc from consultas.pessoa 

--Listar nome, e-mail e data de nascimento da 3a à 8a pessoa cadastrada.

SELECT nome, email, data_nasc from consultas.pessoa
  OFFSET 2 LIMIT 6
  
--Listar nome, e-mail e idade das pessoas cadastradas.

SELECT nome, email, AGE(NOW(), data_nasc) as idade from consultas.pessoa

--Listar a quantidade de agendamentos.

SELECT COUNT(*) from consultas.agendamento

--Listar a data/hora das consultas e os respectivos valores com desconto de 5%. Os valores devem ser precedidos com "R$". Por exemplo: R$ 150.00.

SELECT dh_consulta, 'R$' || ROUND((valor_consulta * 0.95)::numeric, 2) AS valor from consultas.agendamento
  
--Listar nome, cpf e e-mail dos pacientes que não possuem plano de saúde.

SELECT nome, cpf, email from consultas.pessoa
  WHERE cpf IN (SELECT cpf_pessoa FROM consultas.paciente WHERE plano_saude = false) 

--Listar os dados dos agendamentos registrados para o mesmo o mês da consulta.

SELECT * from consultas.agendamento
  WHERE EXTRACT(MONTH from dh_agendamento) = EXTRACT(MONTH from dh_consulta)

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
  WHERE cpf IN (SELECT cpf_pessoa from consultas.paciente)
  ORDER BY data_nasc ASC

--Listar a quantidade de pacientes que não possuem plano de saúde.

SELECT COUNT(*) from consultas.paciente
  WHERE plano_saude = false
  
--Listar o maior e o menor valor das consultas agendadas para cada dia que contém consulta.
  
SELECT dh_consulta::date AS dia,
       MAX(valor_consulta) AS maior,
       MIN(valor_consulta) AS menor
FROM consultas.agendamento
GROUP BY dh_consulta::date

--Listar a média dos valores das consultas agendadas para o mês de Dezembro.

SELECT AVG(valor_consulta) as media from consultas.agendamento
  WHERE EXTRACT(MONTH from dh_consulta) = 12
  
--Listar nome e e-mail das pessoas que agendaram alguma consulta para o dia do seu aniversário.

SELECT nome, email from consultas.pessoa
  JOIN consultas.agendamento on consultas.agendamento.cpf_paciente = consultas.pessoa.cpf
  WHERE EXTRACT(MONTH from dh_consulta) = EXTRACT(MONTH from data_nasc) AND EXTRACT(DAY from dh_consulta) = EXTRACT(DAY from data_nasc)

--Listar o nome, e-mail, cpf dos médicos e as suas respectivas especialidades.
  
select p.nome, p.email, p.cpf, e.descricao as especialidade from consultas.pessoa p
  JOIN consultas.medico_especialidade me on me.cpf_medico = p.cpf
  JOIN consultas.especialidade e on e.id = me.id_especialidade

--Listar a quantidade de consultas para cada médico.

SELECT cpf_medico, COUNT(*) as qtd from consultas.agendamento
  GROUP BY cpf_medico
