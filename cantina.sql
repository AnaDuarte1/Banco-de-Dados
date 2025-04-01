DROP DATABASE IF exists cantina;
CREATE DATABASE cantina;
USE cantina;

CREATE TABLE produtos(
	idProduto int,
    nome char(200) NOT NULL,
    categoria_preco int,
    tipo_salgado char(20),
    tipo_pagamento int
);

CREATE TABLE valorP(
	idPrecos int,
    cor char(30) unique,
    valor float NOT NULL check (valor > 0)
);

CREATE TABLE pagamento(
	idPagamento int,
	tipo_pagamento char(200) NOT NULL
);

insert into valorP(idPrecos,cor, valor) 
values (1, "Vermelho", 10.00),
(2, "Azul", 4.50),
(3, "Amarelo", 8.00);

insert into produtos(idProduto,nome, categoria_preco,tipo_salgado, tipo_pagamento) 
values ( 1, "Enroladinho de presunto e queijo", 1, "assado", 1),
(2,  "Esfirra de Frango", 2, "assado", 2),
( 3, "kibe", 3, "frito", 3);

insert into pagamento(idPagamento,tipo_pagamento) 
values (1, "Cartão Débito"),
(2, "Cartão Crédito"),
(3, "Pix");
