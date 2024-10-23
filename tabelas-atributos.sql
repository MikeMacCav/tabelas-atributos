CREATE DATABASE ESCOLA;

USE ESCOLA;

CREATE TABLE ALUNO (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    endereco VARCHAR(255)
);

CREATE TABLE CURSO (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    descricao TEXT
);

CREATE TABLE MATRICULA (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT,
    id_curso INT,
    data_matricula DATE,
    FOREIGN KEY (id_aluno) REFERENCES ALUNO(ID),
    FOREIGN KEY (id_curso) REFERENCES CURSO(ID)
);

DELIMITER //
CREATE TRIGGER after_insert_matricula
AFTER INSERT ON MATRICULA
FOR EACH ROW
BEGIN
    
    INSERT INTO log_matricula (id_aluno, id_curso, data_log) VALUES (NEW.id_aluno, NEW.id_curso, NOW());
END;
//
DELIMITER ;

CREATE TABLE log_matricula (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT,
    id_curso INT,
    data_log DATETIME
);