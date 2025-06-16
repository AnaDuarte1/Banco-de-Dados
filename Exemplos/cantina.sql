DROP DATABASE IF EXISTS cantina;
CREATE DATABASE cantina;
USE cantina;

-- Create tables

CREATE TABLE valorP(
    idPrecos int AUTO_INCREMENT PRIMARY KEY,  -- Add auto increment to idPrecos
    cor char(30) UNIQUE NOT NULL,  -- Make cor unique for proper foreign key referencing
    valor float NOT NULL CHECK (valor > 0)
);

CREATE TABLE pagamento(
    idPagamento int AUTO_INCREMENT PRIMARY KEY,
    tipo_pagamento char(200) NOT NULL
);

CREATE TABLE produtos(
    idProduto int AUTO_INCREMENT PRIMARY KEY, 
    nome char(200) NOT NULL,
    categoria_cor char(30),  -- Reference to cor column in valorP
    tipo_salgado char(20),
    tipo_pagamento int,
    FOREIGN KEY (categoria_cor) REFERENCES valorP(cor),  -- Foreign key reference to cor
    FOREIGN KEY (tipo_pagamento) REFERENCES pagamento(idPagamento)  -- Reference to tipo_pagamento
);

-- Insert data into valorP
INSERT INTO valorP(cor, valor) 
VALUES 
    ("Vermelho", 10.00),
    ("Azul", 4.50),
    ("Amarelo", 8.00);

-- Insert data into pagamento
INSERT INTO pagamento(tipo_pagamento) 
VALUES 
    ("Cartão Débito"),
    ("Cartão Crédito"),
    ("Pix");

-- Insert data into produtos
INSERT INTO produtos(nome, categoria_cor, tipo_salgado, tipo_pagamento) 
VALUES 
    ("Enroladinho de presunto e queijo", "Vermelho", "assado", 1),
    ("Esfirra de Frango", "Azul", "assado", 2),
    ("Kibe", "Amarelo", "frito", 3);
