-- Criação do banco de dados
CREATE DATABASE  db_curso_da_minha_vida;
USE db_curso_da_minha_vida;

-- Criação da tabela tb_categorias
CREATE TABLE tb_categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL,
    descricao_categoria VARCHAR(255)
);

-- Inserção de registros na tabela tb_categorias
INSERT INTO tb_categorias (nome_categoria, descricao_categoria) VALUES
    ('Programação', 'Cursos relacionados a programação de software'),
    ('Design', 'Cursos de design e criação visual'),
    ('Marketing Digital', 'Cursos sobre estratégias de marketing online'),
    ('Idiomas', 'Cursos para aprendizado de línguas estrangeiras'),
    ('Desenvolvimento Pessoal', 'Cursos para o desenvolvimento pessoal e profissional');

-- Criação da tabela tb_cursos
CREATE TABLE  tb_cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nome_curso VARCHAR(100) NOT NULL,
    valor DECIMAL(8, 2) NOT NULL,
    descricao_curso TEXT,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

-- Inserção de registros na tabela tb_cursos
INSERT INTO tb_cursos (nome_curso, valor, descricao_curso, id_categoria) VALUES
    ('Programacao em JAVA', 599.99, 'Iniciantes', 1),
    ('GFundamentos de Design Grafico', 799.99, 'Nivel Básico', 2),
    (' Marketing Digital', 899.99, 'Effective strategies for successful digital marketing campaignEstratégia efetivas para ganahr dinheiro', 3),
    ('Libras para Iniciantes', 499.99, 'Aprenda a dialogar em Libras', 4),
    ('Gestão de Tempo', 699.99, 'Aprenda a otimizar sua rotina', 5),
    ('Python ', 749.99, 'Construa uma aplicação em Python', 1),
    ('Fundamentos da Fotografia', 649.99, 'Fotografia para entusiastas', 2),
    ('Ciencia da Computação', 1099.99, 'Torne-se um cientista de Dados', 1);

-- SELECT que retorne todos os cursos cujo valor seja maior do que R$ 500,00
SELECT * FROM tb_cursos WHERE valor > 500.00;

-- SELECT que retorne todos os cursos cujo valor esteja no intervalo R$ 600,00 e R$ 1000,00
SELECT * FROM tb_cursos WHERE valor BETWEEN 600.00 AND 1000.00;

-- SELECT utilizando o operador LIKE, buscando todos os cursos que possuam a letra J no atributo nome
SELECT * FROM tb_cursos WHERE nome_curso LIKE '%J%';

-- SELECT utilizando INNER JOIN para unir os dados das tabelas tb_cursos e tb_categorias
SELECT * FROM tb_cursos
INNER JOIN tb_categorias ON tb_cursos.id_categoria = tb_categorias.id_categoria;

-- SELECT utilizando INNER JOIN, unindo os dados das tabelas tb_cursos e tb_categorias, trazendo apenas os produtos que pertençam a uma categoria específica
SELECT * FROM tb_cursos
INNER JOIN tb_categorias ON tb_cursos.id_categoria = tb_categorias.id_categoria
WHERE tb_categorias.nome_categoria = 'Java';
