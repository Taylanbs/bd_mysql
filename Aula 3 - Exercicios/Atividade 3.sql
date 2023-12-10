-- Criar o banco de dados
CREATE DATABASE db_farmacia_bem_estar;

-- Selecionar o banco de dados
USE db_farmacia_bem_estar;

-- Criar a tabela tb_categorias
CREATE TABLE  tb_categorias (
    id_categoria INT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL,
    descricao_categoria VARCHAR(255)
);

-- Criar a tabela tb_produtos
CREATE TABLE tb_produtos (
    id_produto INT PRIMARY KEY,
    nome_produto VARCHAR(50) NOT NULL,
    valor_produto DECIMAL(10, 2) NOT NULL,
    quantidade_em_estoque INT,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

-- Inserir dados na tabela tb_categorias
INSERT INTO tb_categorias (id_categoria, nome_categoria, descricao_categoria) VALUES
(1, 'Medicamentos', 'Remédios para tratamento de diversas doenças'),
(2, 'Cosméticos', 'Produtos de beleza e cuidados com a pele'),
(3, 'Higiene', 'Produtos para higiene pessoal e cuidados com o corpo'),
(4, 'Vitaminas', 'Suplementos vitamínicos para melhorar a saúde'),
(5, 'Fraldas', 'Fraldas descartáveis para bebês');

-- Inserir dados na tabela tb_produtos
INSERT INTO tb_produtos (id_produto, nome_produto, valor_produto, quantidade_em_estoque, id_categoria) VALUES
(1, 'Aspirina', 10.50, 100, 1),
(2, 'Shampoo Anti-Caspa', 15.75, 50, 2),
(3, 'Creme Dental', 5.99, 200, 3),
(4, 'Multivitamínico', 30.00, 30, 4),
(5, 'Fralda Pampers', 55.90, 80, 5),
(6, 'Paracetamol', 8.25, 150, 1),
(7, 'Batom Matte', 25.50, 40, 2),
(8, 'Sabonete Líquido', 12.75, 120, 3);

-- Consultas
-- Retornar todos os produtos cujo valor seja maior que R$ 50,00
SELECT * FROM tb_produtos WHERE valor_produto > 50.00;

-- Retornar todos os produtos cujo valor esteja no intervalo R$ 5,00 e R$ 60,00
SELECT * FROM tb_produtos WHERE valor_produto BETWEEN 5.00 AND 60.00;

-- Retornar todos os produtos que possuam a letra C no nome
SELECT * FROM tb_produtos WHERE nome_produto LIKE '%C%';

-- INNER JOIN entre tb_produtos e tb_categorias
SELECT * FROM tb_produtos INNER JOIN tb_categorias ON tb_produtos.id_categoria = tb_categorias.id_categoria;

-- INNER JOIN com filtro por categoria (exemplo: Cosméticos)
SELECT * FROM tb_produtos
INNER JOIN tb_categorias ON tb_produtos.id_categoria = tb_categorias.id_categoria
WHERE tb_categorias.nome_categoria = 'Cosméticos';
