-- QUESTÃO 1
-- Cadastrar os elementos segundo as especificações abaixo (Comandos INSERT).

INSERT INTO consultas.pessoa(nome, email, cpf, data_nasc, endereco, telefone)
  VALUES ('Pedro I', 'pp@email.com', '002', '10-01-1479', 'R. Vasco', NULL),
         ('Pedro II', 'ps@email.com', '003', '10-02-1516', 'R. Flamengo', '5501'),
         ('D João VI', 'dj@email.com', '001', '01-12-1415', 'R. Portugal', NULL),
         ('JJ Xavier', 'jj@email.com', '004', '12-11-1746', 'R. Minas', '5502');

INSERT INTO consultas.paciente(cpf_pessoa, senha, plano_saude)
  VALUES('002', 'senha1', false),
        ('003', 'senha2', true);

INSERT INTO consultas.medico(cpf_pessoa, crm)
  VALUES('001', 111),
        ('004', 112);

INSERT INTO consultas.especialidade(descricao)
  VALUES('Pediatra'), 
        ('Cardiologista'),
        ('Ortopedista'); 

INSERT INTO consultas.medico_especialidade(cpf_medico, id_especialidade)
  VALUES('001', 1),
        ('004', 2),
        ('004', 3);

INSERT INTO consultas.agendamento(cpf_paciente, cpf_medico, dh_consulta, dh_agendamento, valor_consulta)
  VALUES ('002', '001', '14-04-1782 16:00:00', '14-03-1782 10:04:45', 80),
         ('002', '004', '15-04-1782 10:00:00', '14-03-1782 10:04:45', 100),
         ('002', '004', '17-05-1783 08:00:00', '10-05-1783 16:32:00', 100),
         ('003', '001', '17-05-1783 08:30:00', '09-05-1783 09:05:56', 0);

-- QUESTÃO 2
-- Atualizar a data de nascimento de "D João VI", ele nasceu em "01-12-1416".

UPDATE consultas.pessoa
  SET data_nasc = '01-12-1416'
  WHERE cpf = '001';

-- Atualizar o telefone e e-mail de "D Pedro I" para "5503" e "pf@email.com" , respectivamente.

UPDATE consultas.pessoa
  SET telefone = '5503',
      email = 'pf@email.com'
  WHERE cpf = '002';

-- Atualizar os números de telefone adicionando um dígito "9" no início. Por exemplo, o número "5501" será updated para "95501". 

UPDATE consultas.pessoa
  SET telefone = '9' || telefone
  WHERE telefone is NOT NULL;

-- As consultas do dia "17-05-1783" devem ser adiadas para o dia "19-05-1783", e o valor das consultas alteradas para R$ 150,00.

UPDATE consultas.agendamento
  SET dh_consulta = '19-05-1783 08:00:00',
      valor_consulta = 150
  WHERE dh_consulta LIKE '17-05-1783%';

-- O médico "JJ Xavier" não atenderá como "Cardiologista", somente como "Pediatra" e também "Ortopedista".

UPDATE consultas.medico_especialidade
  SET id_especialidade = 1
  WHERE cpf_medico = '004' and id_especialidade = 2;


-- QUESTÃO 3
-- O paciente "Pedro I" cancelou a consulta agendada para o dia "19-05-1783".
 
DELETE from consultas.agendamento 
  WHERE dh_consulta LIKE '19-05-1783%' and cpf_paciente = '002';

-- Remover os agendamentos com o médico "D João VI" com o custo de R$ 0,00. Utilize essas duas condições no comando DELETE.

DELETE from consultas.agendamento
  WHERE cpf_medico = '001' and valor_consulta = 0;

-- Remover os pacientes que possuem plano de saúde ou que não possuem telefone.

DELETE FROM consultas.paciente
WHERE plano_saude = true 
   OR cpf_pessoa IN (
       SELECT cpf 
       FROM consultas.pessoa 
       WHERE telefone IS NULL
   );

-- O médico "JJ Xavier" deve ser removido da base de dados.

DELETE from consultas.medico_especialidade WHERE cpf_medico = '004';
DELETE from consultas.agendamento WHERE cpf_medico = '004';
DELETE from consultas.medico WHERE cpf_pessoa = '004';
DELETE from consultas.pessoa WHERE cpf = '004';
