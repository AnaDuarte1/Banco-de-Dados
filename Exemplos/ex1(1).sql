-- banco de dados Pizzaria
-- atividade: 05/05

-- criação e abertura do banco de dados
create database pizzaria;
use pizzaria;

-- tabela Cliente
create table cliente(
  telefone varchar(12),
  nome varchar(20) not null,
  rua varchar(20) not null,
  numero int,
  compl varchar(10),
  bairro varchar(20),
  primary key(telefone)
);

create table pizza(
   codigo varchar(5),
   nome varchar(20) not null,
   descricao varchar(20) not null,
   preco numeric(5,2),
   primary key(codigo) 
);

create table ingredientes_pizza(
   nome_ingrediente varchar(20),
   cod_pizza varchar(5),
   primary key(nome_ingrediente,cod_pizza),
   foreign key(cod_pizza) references pizza(codigo)
);   

create table funcionario(
  cpf varchar(11),
  nome varchar(20) not null,
  primary key(cpf)
);

create table pedido(
  codigo int,
  data_hora datetime,
  tel_cliente varchar(12),
  cpf_funcionario varchar(11),
  primary key(codigo),
  foreign key(tel_cliente) references cliente(telefone),
  foreign key(cpf_funcionario) references funcionario(cpf)
);

create table item_pedido(
  cod_pedido int,
  cod_pizza varchar(5),
  quantidade int,
  primary key(cod_pedido, cod_pizza),
  foreign key(cod_pedido) references pedido(codigo),
  foreign key(cod_pizza) references pizza(codigo)
);  

-- Inserir cliente
INSERT INTO cliente 
VALUES 
('11912345678', 'João Silva', 'Av. Brasil', 100, 'Apto 12', 'Centro');

-- Inserir funcionário
INSERT INTO funcionario 
VALUES 
('12345678901', 'Maria Souza');

-- Inserir pizza
INSERT INTO pizza VALUES 
('P01', 'Calabresa', 'Calabresa c/ cebola', 39.90);

-- Inserir pedido
INSERT INTO pedido VALUES 
(1, NOW(), '11912345678', '12345678901');

-- Inserir item do pedido
INSERT INTO item_pedido VALUES
(1, 'P01', 2);

-- Inserir ingredientes da pizza
INSERT INTO ingredientes_pizza VALUES 
('Calabresa', 'P01'),
('Cebola', 'P01');

