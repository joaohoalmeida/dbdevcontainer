create schema consultas

CREATE TABLE consultas.pessoa(
    cpf varchar(11) PRIMARY KEY,
    nome varchar(150) NOT NULL,
    email varchar(30) NOT NULL,
    data_nasc date NOT NULL,
    endereco varchar(300) NOT NULL,
    telefone varchar(15) NULL,

    constraint unique_1 UNIQUE(nome, email)
);

CREATE TABLE consultas.paciente(
    cpf_pessoa varchar(11) NOT NULL,
    senha varchar(20) NOT NULL, 
    plano_saude boolean DEFAULT false NOT NULL,

    CONSTRAINT fk_paciente 
        FOREIGN KEY (cpf_pessoa) 
        REFERENCES consultas.pessoas(cpf)
        ON DELETE CASCADE
);

CREATE TABLE consultas.medico(
    cpf_pessoa varchar(11) NOT NULL,
    crm varchar(10) UNIQUE NOT NULL,

    CONSTRAINT fk_medico 
        FOREIGN KEY (cpf_pessoa) 
        REFERENCES consultas.pessoas(cpf)
        ON DELETE CASCADE
);

CREATE TABLE consultas.agendamento(
    cpf_paciente varchar(11) NOT NULL,
    cpf_medico varchar(11) NOT NULL,
    dh_consulta timestamp NOT NULL,
    dh_agendamento timestamp NOT NULL,
    valor_consulta float NOT NULL DEFAULT (0.0)

    CONSTRAINT fk_paciente 
        FOREIGN KEY (cpf_paciente) 
        REFERENCES consultas.pessoas(cpf)
        ON DELETE CASCADE

    CONSTRAINT fk_medico
        FOREIGN KEY (cpf_medico) 
        REFERENCES consultas.pessoas(cpf)
        ON DELETE CASCADE
);

CREATE TABLE consultas.especialidade(
    id SERIAL PRIMARY KEY,
    descricao varchar(300) NOT NULL
);

CREATE TABLE consultas.medico_especialidade(
    cpf_medico varchar(11) NOT NULL,
    id_especialidade int NOT NULL,

    CONSTRAINT fk_medico
        FOREIGN KEY (cpf_pmedico) 
        REFERENCES consultas.pessoas(cpf)
        ON DELETE CASCADE

    CONSTRAINT fk_especialidade
        FOREIGN KEY (id_especialidade) 
        REFERENCES consultas.especialidade(id)
        ON DELETE CASCADE
);

