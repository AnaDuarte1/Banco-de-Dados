DROP DATABASE IF exists empresa;
CREATE DATABASE empresa;
USE empresa;

-- Criação da tabela FUNCIONARIO: correta
-- Porém, a coluna DNUMERO é uma chave estrangeira, mas a tabela DEPARTAMENTO ainda não foi criada,
-- então a restrição de chave estrangeira ainda não pode ser aplicada até a tabela DEPARTAMENTO existir
CREATE TABLE FUNCIONARIO (
    CPF VARCHAR(11) NOT NULL PRIMARY KEY,
    NOME VARCHAR(50) NOT NULL,
    SALARIO DECIMAL(8, 2) DEFAULT 0.0,
    DATANASC DATE,
    RUA VARCHAR(50),
    NUMERO INT,
    COMPL VARCHAR(20),
    BAIRRO VARCHAR(20),
    CIDADE VARCHAR(20),
    ESTADO CHAR(2),
    CEP CHAR(10),
	SEXO CHAR(1),
    DNUMERO INT CHECK (DNUMERO > 0)
);

-- Criação da tabela DEPARTAMENTO: correta
-- CPFGERENTE é uma FK para FUNCIONARIO, que já foi criada, então ok.
-- Mas nesse momento ainda não há FUNCIONARIO inserido, então só será possível inserir valores NULL ou CPFs válidos depois
CREATE TABLE DEPARTAMENTO (
	DNUMERO INT NOT NULL,
	DNOME VARCHAR(20) NOT NULL, 
	CPFGERENTE VARCHAR(11),
	PRIMARY KEY (DNUMERO),
	FOREIGN KEY (CPFGERENTE) 
		REFERENCES FUNCIONARIO(CPF)
);

-- ALTER TABLE para adicionar a FK de DNUMERO na tabela FUNCIONARIO: ok
ALTER TABLE FUNCIONARIO
	ADD FOREIGN KEY (DNUMERO)
		REFERENCES DEPARTAMENTO(DNUMERO);
		
-- Criação das demais tabelas: todas corretas em estrutura e referências
-- Nenhum erro aqui
CREATE TABLE PROJETO (
	PROJNUMERO INT NOT NULL AUTO_INCREMENT,
	PROJNOME VARCHAR(20) NOT NULL,
	PROJLOCAL VARCHAR(20),
	DNUMERO INT,
	PRIMARY KEY (PROJNUMERO),
	FOREIGN KEY (DNUMERO) 
		REFERENCES DEPARTAMENTO(DNUMERO)
);

CREATE TABLE ATRIBUICAO (
	CPF VARCHAR(11) NOT NULL,
	PROJNUMERO INT NOT NULL,
	HORAS INT,
	PRIMARY KEY (CPF, PROJNUMERO),
	FOREIGN KEY (CPF) 
		REFERENCES FUNCIONARIO(CPF),
	FOREIGN KEY (PROJNUMERO) 
		REFERENCES PROJETO(PROJNUMERO)
);

CREATE TABLE DEPTOLOCAL (
	DNUMERO INT NOT NULL,
	NOMELOCAL VARCHAR(20) NOT NULL,
	PRIMARY KEY (DNUMERO, NOMELOCAL), 
	FOREIGN KEY (DNUMERO)
		REFERENCES DEPARTAMENTO(DNUMERO)
);	

-- INSERÇÕES EM FUNCIONARIO: todas funcionam normalmente,
-- porque o DNUMERO está ausente (NULL), e a FK permite isso.
-- Valores estão consistentes com as restrições.
INSERT INTO FUNCIONARIO 
(CPF, NOME, SALARIO, DATANASC, RUA, NUMERO, COMPL, BAIRRO, CIDADE, ESTADO, CEP, SEXO)
VALUES 
('1234', 'João Silva', 3000, '1965-01-09', 'Rua das Flores', 751, NULL, 'Centro', 'São Paulo', 'SP', '12345-678', 'M'),
('3334', 'Fernando Wong', 4000, '1955-12-08', 'Rua da Lapa', 34, NULL, 'Mooca', 'São Paulo', 'SP', '12345-000', 'M'),
('9998', 'Alice Zelaya', 2500, '1968-01-19', 'Rua Souza Lima', 35, NULL, 'Jardins', 'Curitiba', 'PR', '98765-432','F'),
('9876', 'Jennifer Souza', 4300, '1941-06-20', 'Av. Arthur de Lima', 54, 'apto 102', 'Centro', 'Santo André', 'SP','77664-432', 'F'),
('6668', 'Ronaldo Lima', 3800, '1962-09-15', 'Rua Rebouças', 65, 'apto 109 bloco 1', 'Vila Maria', 'Piracicaba', 'SP', '33333-000','M'),
('4534', 'Joice Leite', 2500, '1972-07-31', 'Av. Lucas Obes', 74, NULL, 'Centro', 'São Paulo', 'SP', '12345-999', 'F'),
('9879', 'André Pereira', 2500, '1969-03-29', 'Av. Timbira', 35, 'apto 23', 'Mooca', 'São Paulo', 'SP', '12345-000', 'M'),
('8886', 'Jorge Brito', 5500, '1937-11-10', 'Rua do Horto', 35, 'apto 501', 'Jardins', 'São Paulo', 'SP', '12345-500', 'M');

-- INSERÇÕES EM DEPARTAMENTO: funcionam pois os CPFs usados como gerente já foram inseridos
INSERT INTO DEPARTAMENTO (DNOME, DNUMERO, CPFGERENTE)
VALUES
('Pesquisa', 5, '3334'),
('Administração', 4, '9876'),
('Matriz', 1, '8886');		

INSERT INTO DEPTOLOCAL
VALUES
(1, 'São Paulo'), 
(4, 'Mauá'),
(5, 'São Paulo'),  
(5, 'Itu'), 
(5, 'Santo André'); 

-- PROJETO: inserções funcionam corretamente
INSERT INTO PROJETO (PROJNOME, PROJLOCAL, DNUMERO)
VALUES
('Produto X', 'Santo André', 5),
('Produto Y', 'Itu', 5),
('Produto Z', 'São Paulo', 5),
('Informatização', 'Mauá', 4),
('Reorganização', 'São Paulo', 1),
('Novos benefícios','Mauá', 4);

-- ATRIBUICAO: inserções válidas com valores existentes
INSERT INTO ATRIBUICAO (CPF, PROJNUMERO, HORAS)
VALUES
('1234', 1, 5),
('1234', 2, 2),
('6668', 3, 2),
('4534', 1, 4),
('4534', 2, 3),
('3334', 2, 1),
('3334', 3, 5),
('3334', 4, 6),
('3334', 5, 1),
('9998', 6, 3),
('9998', 4, 4),
('9879', 4, 5),
('9879', 6, 3),
('9876', 6, 3),
('9876', 5, 1),
('8886', 5, 2);

-- UPDATEs válidos
UPDATE FUNCIONARIO SET DNUMERO = 5 WHERE CPF = '1234';
UPDATE FUNCIONARIO SET DNUMERO = 5 WHERE CPF = '3334';
UPDATE FUNCIONARIO SET DNUMERO = 4 WHERE CPF = '9998';
UPDATE FUNCIONARIO SET DNUMERO = 4 WHERE CPF = '9876';
UPDATE FUNCIONARIO SET DNUMERO = 5 WHERE CPF = '6668';
UPDATE FUNCIONARIO SET DNUMERO = 5 WHERE CPF = '4534';
UPDATE FUNCIONARIO SET DNUMERO = 4 WHERE CPF = '9879';
UPDATE FUNCIONARIO SET DNUMERO = 1 WHERE CPF = '8886';

INSERT INTO FUNCIONARIO 
(CPF, NOME, SALARIO, DATANASC, RUA, NUMERO, COMPL, BAIRRO, CIDADE, ESTADO, CEP, SEXO)
VALUES 
('999', 'Roberto Santos', 4500, '1972-06-21', 'Rua Benjamin', 34, NULL, 'Vila Maria', 'Santo André', 'SP', '1', 'M');

-- ERRO: DNUMERO = 1 já existe, tentativa de duplicar chave primária
INSERT INTO DEPARTAMENTO (DNOME, DNUMERO)
VALUES
('Producao', 1);

-- FUNCIONA apenas se CPF '999' foi inserido com sucesso (o que provavelmente não aconteceu por erro no CEP acima)
INSERT INTO DEPARTAMENTO (DNOME, DNUMERO, CPFGERENTE)
VALUES
('Producao', 10, '999');

-- ERRO: tentativa de apagar funcionário que está sendo referenciado como gerente em DEPARTAMENTO (CPFGERENTE)
-- Isso viola a integridade referencial e falha, a menos que tenha sido definido ON DELETE CASCADE ou SET NULL (não foi)
DELETE FROM FUNCIONARIO where CPF = '999';

-- ERRO: DNUMERO 20 não existe em DEPARTAMENTO, portanto violação de chave estrangeira
UPDATE FUNCIONARIO SET DNUMERO = 20 WHERE CPF = '999';

-- FUNCIONA: departamentos 2 e 3 são novos
INSERT INTO DEPARTAMENTO (DNOME, DNUMERO)
VALUES
('Ensino', 2),
('RH', 3);

-- FUNCIONA: atualizando CPFGERENTE com CPFs válidos
UPDATE DEPARTAMENTO SET CPFGERENTE = '1234' WHERE DNUMERO = 2;
UPDATE DEPARTAMENTO SET CPFGERENTE = '6668' WHERE DNUMERO = 3;

-- ERRO: faltando o valor para a coluna HORAS (que é NOT NULL)
-- Isso causa erro por tentar inserir NULL implicitamente
INSERT INTO ATRIBUICAO(CPF, PROJNUMERO) 
VALUES 
('1234', 1),
('9998', 1),
('9879', 1);

-- FUNCIONA: atualização de salários de quem está no departamento 4
UPDATE FUNCIONARIO SET SALARIO = SALARIO * 1.10 WHERE DNUMERO = 4;

-- FUNCIONA: criação do departamento Marketing
INSERT INTO DEPARTAMENTO (DNUMERO, DNOME, CPFGERENTE)
VALUES (7, 'Marketing', '6668');

-- FUNCIONA: criação do projeto Call Center
INSERT INTO PROJETO (PROJNOME, PROJLOCAL, DNUMERO)
VALUES ('Call Center', 'São Paulo', 7);

-- FUNCIONA: inserção de locais do departamento 7
INSERT INTO DEPTOLOCAL (DNUMERO, NOMELOCAL)
VALUES
(7, 'São Paulo'),
(7, 'Rio de Janeiro'),
(7, 'Campinas');

-- FUNCIONA: inserção de novos funcionários para o departamento 7
INSERT INTO FUNCIONARIO
(CPF, NOME, SALARIO, DATANASC, RUA, NUMERO, COMPL, BAIRRO, CIDADE, ESTADO, CEP, SEXO, DNUMERO)
VALUES
('1111', 'Carlos Mendes', 3200, '1985-05-15', 'Rua A', 100, NULL, 'Centro', 'São Paulo', 'SP', '01000-000', 'M', 7),
('2222', 'Ana Oliveira', 2900, '1990-08-22', 'Rua B', 200, 'Apto 101', 'Copacabana', 'Rio de Janeiro', 'RJ', '22000-000', 'F', 7),
('3333', 'Pedro Santos', 3100, '1988-03-10', 'Rua C', 300, NULL, 'Cambuí', 'Campinas', 'SP', '13000-000', 'M', 7),
('4444', 'Mariana Costa', 2800, '1992-11-05', 'Rua D', 400, 'Apto 202', 'Barra', 'Rio de Janeiro', 'RJ', '23000-000', 'F', 7),
('5555', 'Luiz Pereira', 3000, '1987-07-18', 'Rua E', 500, NULL, 'Centro', 'Campinas', 'SP', '13010-000', 'M', 7);

-- FUNCIONA: atribuições válidas
INSERT INTO ATRIBUICAO (CPF, PROJNUMERO, HORAS)
VALUES
('1111', 7, 40),
('2222', 7, 40),
('3333', 7, 40),
('4444', 7, 40),
('5555', 7, 40);
