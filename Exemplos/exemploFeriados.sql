DROP DATABASE IF exists feriados;
CREATE DATABASE feriados;
USE feriados;

CREATE TABLE feriadosNacionais(
	id_feriado int auto_increment PRIMARY KEY,
    nome_feriado varchar(50) unique,
    comemoracao date
);


INSERT INTO feriadosNacionais( nome_feriado, comemoracao)
VALUES
("Confraternização Universal", "2025-01-01"),
("Carnaval", "2025-03-03");

DELETE FROM feriadosNacionais where id_feriado = 1;

SELECT * FROM feriadosNacionais;




