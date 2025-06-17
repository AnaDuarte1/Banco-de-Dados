DROP TABLE IF EXISTS Respondida;
DROP TABLE IF EXISTS Respostas;
DROP TABLE IF EXISTS Questao;
DROP TABLE IF EXISTS Usuario;
DROP TABLE IF EXISTS Avaliacao;
DROP TABLE IF EXISTS Eixo_Tematico;
DROP TABLE IF EXISTS Questao_Acesso;

-- Tabela Eixo_Tematico
CREATE TABLE Eixo_Tematico (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Sigla VARCHAR(10) NOT NULL,
    Descricao TEXT
);

-- Tabela Avaliacao
CREATE TABLE Avaliacao (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Ano INT NOT NULL,
    Numero_sequencial INT NOT NULL,
    Prazo DATE NOT NULL,
    Ident_acesso VARCHAR(255) -- Em MySQL, usar string separada por vírgula se precisar simular array
);

-- Tabela Usuario
CREATE TABLE Usuario (
    Matricula VARCHAR(20) PRIMARY KEY,
    Tipo_Perfil VARCHAR(3) CHECK (Tipo_Perfil IN ('TAE', 'DOC', 'ALN'))
);

-- Tabela Questao
CREATE TABLE Questao (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Num_Questao INT NOT NULL,
    Tipo_Questao ENUM('Aberta', 'Multipla') NOT NULL,
    Id_Eixo INT NOT NULL,
    Id_Avaliacao INT NOT NULL,
    FOREIGN KEY (Id_Eixo) REFERENCES Eixo_Tematico(Id),
    FOREIGN KEY (Id_Avaliacao) REFERENCES Avaliacao(Id),
    UNIQUE (Id_Avaliacao, Num_Questao)
);

-- Tabela Respostas
CREATE TABLE Respostas (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Texto TEXT,
    Data TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Parcial BOOLEAN DEFAULT TRUE,
    Id_Usuario VARCHAR(20) NOT NULL,
    Id_Questao INT NOT NULL,
    FOREIGN KEY (Id_Usuario) REFERENCES Usuario(Matricula),
    FOREIGN KEY (Id_Questao) REFERENCES Questao(Id)
);

-- Tabela Respondida
CREATE TABLE Respondida (
    Id_Avaliacao INT NOT NULL,
    Id_Usuario VARCHAR(20) NOT NULL,
    PRIMARY KEY (Id_Avaliacao, Id_Usuario),
    FOREIGN KEY (Id_Avaliacao) REFERENCES Avaliacao(Id),
    FOREIGN KEY (Id_Usuario) REFERENCES Usuario(Matricula)
);

-- Esse não foi implementado no modelo MER inicialmente, vi a necessidade de adicionar no script...
CREATE TABLE Questao_Acesso (
    Id_Questao INT NOT NULL,
    Tipo_Perfil VARCHAR(3) NOT NULL CHECK (Tipo_Perfil IN ('TAE', 'DOC', 'ALN')),
    PRIMARY KEY (Id_Questao, Tipo_Perfil),
    FOREIGN KEY (Id_Questao) REFERENCES Questao(Id)
);



