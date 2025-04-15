-- Consultar pelo nome, sexo, data de nascimento e endereço completo de todos funcionários da empresa. --

SELECT nome, sexo, datanasc, rua, numero, compl, bairro, cidade, estado, cep
FROM FUNCIONARIO;

-- Consultar pelo nome, data de nascimento e salário de todos os funcionários do sexo feminino, ordenando os resultados do maior para o menor salário. --

SELECT nome, datanasc, salario
FROM FUNCIONARIO
ORDER BY salario DESC;

-- Recuperar os locais de todos os projetos, eliminando valores duplicadA

SELECT DISTINCT nomelocal
FROM DEPTOLOCAL;

-- Recuperar nome, data de nascimento e salário dos funcionários que não trabalham no departamento 4 --

SELECT nome, datanasc, salario
FROM FUNCIONARIO
WHERE DNUMERO <> 4;

-- Consultar nome e data de nascimento dos funcionários que ganham salário menor que 5000 e sejam do sexo feminino --

SELECT nome, datanasc
FROM FUNCIONARIO
WHERE salario < 5000 AND sexo = "F";

-- Recuperar nome, data de nascimento e endereço completo dos funcionários cujo nome comece com a letra A. --

SELECT nome, datanasc, rua, numero, compl, bairro, cidade, estado, cep
FROM FUNCIONARIO
WHERE NOME LIKE 'A%';

-- Recuperar nome e endereço completo de funcionários que morem em avenidas. --

SELECT nome, rua, numero, compl, bairro, cidade, estado, cep
FROM FUNCIONARIO
WHERE RUA LIKE 'Av.%';

-- Recuperar nome, sexo e data de nascimento de funcionários que nasceram entre as datas de '1960-01-01' e '1969-12-31'. --

SELECT nome, sexo, datanasc
FROM FUNCIONARIO
WHERE datanasc BETWEEN '1960-01-01' AND '1969-12-31';

-- Consultar nome, salário e estimativa de salário reajustado de todos os funcionários, sendo que o reajuste é um aumento de 5%. --

SELECT nome, SALARIO*1.05 AS AUMENTO
FROM FUNCIONARIO;

-- Recuperar cpf dos funcionários que trabalham mais de 10 horas no projeto de número 3. --

SELECT cpf
FROM ATRIBUICAO
WHERE horas > 10 AND projnumero = 3;

-- Recuperar nome e salário dos funcionários que ganham salário entre 4000 e 6000 --

SELECT nome, salario
FROM FUNCIONARIO
WHERE salario BETWEEN 4000 AND 6000;

-- Consultar cpf dos funcionários que trabalham nos projetos de número 1, 2 ou 3, eliminando valores duplicados. --

SELECT DISTINCT cpf
FROM ATRIBUICAO
WHERE PROJNUMERO BETWEEN 1 AND 3;


-- Recuperar a menor e a maior carga horária de trabalho em projetos. --

SELECT 
MIN(HORAS),
MAX(HORAS)
FROM ATRIBUICAO;


-- Consultar a soma total dos salários dos funcionários do departamento 4. --

SELECT SUM(salario)
FROM FUNCIONARIO
WHERE DNUMERO = 4;

-- Consultar a média de salário dos funcionários para cada número de departamento. --

SELECT DNUMERO, AVG(salario) AS media_salarial
FROM FUNCIONARIO
GROUP BY DNUMERO;

-- Recuperar a quantidade de projetos atribuídos ao funcionário com cpf = '1234'. --

SELECT COUNT(*) AS quantidade_projetos
FROM ATRIBUICAO
WHERE cpf = '1234';

-- Recuperar a quantidade de projetos atribuídos por cpf de funcionário. --

SELECT COUNT(*) AS quantidade_projetos
FROM ATRIBUICAO
GROUP BY cpf;

-- Recuperar a média de salário dos funcionários que moram na cidade de São Paulo. --

SELECT AVG(salario) AS media_salarial_sp
FROM FUNCIONARIO
WHERE cidade = 'São Paulo';

-- Recuperar a média de salário dos funcionários por cidade. --

SELECT cidade, AVG(salario) AS media_salarial
FROM FUNCIONARIO
GROUP BY cidade;

-- Consultar nome e idade de todos funcionários. --

SELECT NOME, DATANASC,
TIMESTAMPDIFF(YEAR,DATANASC,SYSDATE()) AS IDADE
FROM FUNCIONARIO
ORDER BY IDADE;


