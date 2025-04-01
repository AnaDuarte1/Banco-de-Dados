DROP DATABASE IF exists CONTATOS;
CREATE DATABASE CONTATOS;
USE CONTATOS;

CREATE TABLE contatos_primeiro(
	idContatos int,
    nome char(20),
    celular char(20),
    idCidade int,
    classe char(20)
);


insert into contatos_primeiro(idContatos,nome, celular,idCidade,classe) values (1, "Eduardo", "1699158", 1, "IFSP");

CREATE TABLE cidades(
	idCidade int,
    nome char(20),
    uf char(20)
);


insert into cidades(idCidade,nome, uf) values (1, "Araraquara", "SP");
