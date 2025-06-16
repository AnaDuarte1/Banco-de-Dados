Use pizzaria;

UPDATE cliente
SET rua = 'Rua Nova', numero = 200, compl = 'Casa', bairro = 'Jardins'
WHERE telefone = '11912345678';

DELETE FROM ingredientes_pizza
WHERE cod_pizza = 'P01';

SELECT * FROM pizza
WHERE preco > 30 AND nome = 'Calabresa';

SELECT nome, preco, preco * 1.10 AS preco_com_acrescimo
FROM pizza;

SELECT * FROM cliente
ORDER BY nome ASC;

SELECT * FROM cliente
WHERE nome LIKE 'J%';

SELECT * FROM cliente
WHERE compl IS NULL;

SELECT AVG(preco) AS media_preco_pizzas
FROM pizza;

SELECT nome
FROM pizza
WHERE preco = (SELECT MAX(preco) FROM pizza);

SELECT nome
FROM pizza
WHERE codigo IN (
  SELECT cod_pizza
  FROM item_pedido
  WHERE quantidade > 1
);
