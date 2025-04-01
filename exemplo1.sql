DROP DATABASE IF exists mercado;
CREATE DATABASE mercado;
USE mercado;

create table produtos (
id_produto int,
descricao char(20),
preco float default 9.99
);

insert into produtos (id_produto, descricao) values (45, 'qquer');