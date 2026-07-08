-- Cadastrar os elementos segundo as especificações abaixo (Comandos INSERT).

INSERT INTO consultas.pessoa(nome, email, cpf, data_nasc, endereco, telefone)
  VALUES ('Pedro I', 'pp@email.com', '002', '10-01-1479', 'R. Vasco', NULL),
         ('Pedro II', 'ps@email.com', '003', '10-02-1516', 'R. Flamengo', '5501'),
         ('D João VI', 'dj@email.com', '001', '01-12-1415', 'R. Portugal', NULL),
         ('JJ Xavier', 'jj@email.com', '004', '12-11-1746', 'R. Minas', '5502');

INSERT INTO consultas.paciente(cpf, senha, plano_saude)
  VALUES('002', 'senha1', false),
        ('003', 'senha2', true);

INSERT INTO consultas.medico(cpf, crm)
  VALUES('001', 111),
        ('004', 112);

INSERT INTO consultas.medico(cpf, crm)
  VALUES('001', 111),
        ('004', 112);

INSERT INTO consultas.especialidade(descricao)
  VALUES('Pediatra'), 
        ('Cardiologista'),
        ('Ortopedista'); 

INSERT INTO consultas.medico_especialidade(cpf_medico, id_especialidade)
  VALUES('001', '01'),
        ('004', '02'),
        ('004', '03');

INSERT INTO consultas.agendamento(cpf_paciente varchar, cpf_medico, dh_consulta, dh_agendamento, valor_consulta)
  VALUES ('002', '001', '14-04-1782', '16:00:00', '14-03-1782', '10:04:45', '80'),
         ('002', '004', '15-04-1782', '10:00:00', '14-03-1782', '10:04:45', '100'),
         ('002', '004', '17-05-1783', '08:00:00', '10-05-1783', '16:32:00', '100'),
         ('003', '001', '17-05-1783', '08:30:00', '09-05-1783', '09:05:56', '0'),


