--Listar o nome, e-mail e crm dos médicos.
SELECT p.nome, p.email, m.crm from consultas.pessoa p
  JOIN consultas.medico m on m.cpf_pessoa = p.cpf

--Listar o nome, e-mail e senha dos pacientes.
SELECT p.nome, p.email, pac.senha from consultas.pessoa p
  JOIN consultas.paciente pac on pac.cpf_pessoa = p.cpf

--Listar os CRM dos médicos e as descrições das suas respectivas especialidades.
SELECT m.crm, e.descricao from consultas.medico m
  JOIN consultas.medico_especialidade me on me.cpf_medico = m.cpf_pessoa
  JOIN consultas.especialidade e on e.id = me.id_especialidade

--Listar o crm de todos os médicos cardiologistas.
SELECT m.crm from consultas.medico m
  JOIN consultas.medico_especialidade me on me.cpf_medico = m.cpf_pessoa
  JOIN consultas.especialidade e on e.id = me.id_especialidade
  WHERE e.descricao = 'Cardiologista'

--Listar o nome, CPF, crm e senha dos pacientes que também são médicos.
SELECT p.nome, p.cpf, m.crm, pac.senha from consultas.pessoa p
  JOIN consultas.paciente pac on pac.cpf_pessoa = p.cpf
  JOIN consultas.medico m on m.cpf_pessoa = p.cpf

--Listar o nome dos médicos e as respectivas quantidades de consultas agendadas. Observem que alguns médicos podem não ter consulta agendada.
SELECT p.nome, COUNT(a.dh_consulta) as qtd from consultas.medico m
  JOIN consultas.pessoa p on p.cpf = m.cpf_pessoa
  LEFT JOIN consultas.agendamento a on a.cpf_medico = m.cpf_pessoa
  GROUP BY p.nome

--Listar as especialidades e a quantidade de médicos cadastrados nessa especialidade. Observem que algumas especialidades podem não ter médicos associados.
SELECT e.descricao, COUNT(me.cpf_medico) as qtd from consultas.especialidade e
  LEFT JOIN consultas.medico_especialidade me on me.id_especialidade = e.id
  GROUP BY e.descricao

--Listar os dados dos agendamentos, exibindo: (a) o nome e e-mail do paciente, (b) data/hora e valor da consulta, e (c) o nome e crm dos médicos.
SELECT pp.nome as paciente, pp.email, a.dh_consulta, a.valor_consulta, pm.nome as medico, m.crm from consultas.agendamento a
  JOIN consultas.pessoa pp on pp.cpf = a.cpf_paciente
  JOIN consultas.pessoa pm on pm.cpf = a.cpf_medico
  JOIN consultas.medico m on m.cpf_pessoa = a.cpf_medico

--Listar a data/hora das consultas agendadas para todos os cardiologistas  cadastrados.  
SELECT a.dh_consulta from consultas.agendamento a
  JOIN consultas.medico_especialidade me on me.cpf_medico = a.cpf_medico
  JOIN consultas.especialidade e on e.id = me.id_especialidade
  WHERE e.descricao = 'Cardiologista'

--Listar o nome e CRM dos médicos e a média das suas consultas agendadas para o mês de dezembro/2020.
SELECT p.nome, m.crm, AVG(a.valor_consulta) as media from consultas.medico m
  JOIN consultas.pessoa p on p.cpf = m.cpf_pessoa
  JOIN consultas.agendamento a on a.cpf_medico = m.cpf_pessoa
  WHERE EXTRACT(YEAR from a.dh_consulta) = 2020 AND EXTRACT(MONTH from a.dh_consulta) = 12
  GROUP BY p.nome, m.crm
