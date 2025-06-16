-- 1. CHAVES PRIMÁRIAS DAS TABELAS

-- ALUNO: Numero_aluno
-- DISCIPLINA: Numero_disciplina
-- TURMA: Identificacao_turma
-- HISTORICO_ESCOLAR: (Numero_aluno, Identificacao_turma)
-- PRE_REQUISITO: (Numero_disciplina, Numero_pre_requisito)

-- 2. INSERÇÃO QUE NÃO VIOLA A RESTRIÇÃO DE CHAVE PRIMÁRIA

-- Exemplo na tabela ALUNO:
	INSERT INTO ALUNO (Nome, Numero_aluno, Tipo_aluno, Curso)
	VALUES ('Souza', 20, 1, 'CC');

-- 3. INSERÇÃO QUE VIOLA A RESTRIÇÃO DE CHAVE PRIMÁRIA
-- Exemplo na tabela DISCIPLINA:
	INSERT INTO DISCIPLINA (Nome_disciplina, Numero_disciplina, Creditos, Departamento)
	VALUES ('Algoritmos', 'CC1310', 4, 'CC');

-- 4. ATUALIZAÇÃO QUE NÃO VIOLA A CHAVE PRIMÁRIA
-- Atualizando campo não chave:
	UPDATE ALUNO
	SET Curso = 'ENG'
	WHERE Numero_aluno = 8;

-- 5. ATUALIZAÇÃO QUE VIOLA A CHAVE PRIMÁRIA
-- Atualizando para valor duplicado:
	UPDATE ALUNO
	SET Numero_aluno = 17
	WHERE Numero_aluno = 8;

-- 6. CHAVES ESTRANGEIRAS DAS TABELAS:
-- TURMA: Numero_disciplina → DISCIPLINA(Numero_disciplina)
-- HISTORICO_ESCOLAR: Numero_aluno → ALUNO(Numero_aluno)
--                     Identificacao_turma → TURMA(Identificacao_turma)
-- PRE_REQUISITO: Numero_disciplina → DISCIPLINA(Numero_disciplina)
--                Numero_pre_requisito → DISCIPLINA(Numero_disciplina)

-- 7. TABELA: TURMA

-- Modificações que NÃO violam restrição:
-- 1.
	INSERT INTO TURMA (Identificacao_turma, Numero_disciplina, Semestre, Ano, Professor)
	VALUES (140, 'CC1310', 'Primeiro', 09, 'João');
    
-- 2.
	UPDATE TURMA
	SET Professor = 'Maria'
	WHERE Identificacao_turma = 85;

-- Modificações que VIOLAM restrição:
-- 1.
	INSERT INTO TURMA (Identificacao_turma, Numero_disciplina, Semestre, Ano, Professor)
	VALUES (150, 'CC9999', 'Primeiro', 09, 'Ana');
    
-- 2.
	UPDATE TURMA
	SET Numero_disciplina = 'MAT9999'
	WHERE Identificacao_turma = 85;

-- 8. TABELA: HISTORICO_ESCOLAR

-- Modificações que NÃO violam restrição:
-- 1.
	INSERT INTO HISTORICO_ESCOLAR (Numero_aluno, Identificacao_turma, Nota)
	VALUES (17, 102, 'A');
    
-- 2.
	UPDATE HISTORICO_ESCOLAR
	SET Nota = 'C'
	WHERE Numero_aluno = 8 AND Identificacao_turma = 85;

-- Modificações que VIOLAM restrição:
-- 1.
	INSERT INTO HISTORICO_ESCOLAR (Numero_aluno, Identificacao_turma, Nota)
	VALUES (99, 85, 'B');

-- 2.
	UPDATE HISTORICO_ESCOLAR
	SET Identificacao_turma = 999
	WHERE Numero_aluno = 17 AND Identificacao_turma = 112;

-- 9. TABELA: PRE_REQUISITO

-- Modificações que NÃO violam restrição:
-- 1.
	INSERT INTO PRE_REQUISITO (Numero_disciplina, Numero_pre_requisito)
	VALUES ('CC3320', 'CC1310');

-- 2.
	INSERT INTO PRE_REQUISITO (Numero_disciplina, Numero_pre_requisito)
	VALUES ('MAT2410', 'CC1310');

-- Modificações que VIOLAM restrição:
-- 1.
	INSERT INTO PRE_REQUISITO (Numero_disciplina, Numero_pre_requisito)
	VALUES ('CC9999', 'CC1310');

-- 2.
	INSERT INTO PRE_REQUISITO (Numero_disciplina, Numero_pre_requisito)
	VALUES ('CC3320', 'CC0000');
