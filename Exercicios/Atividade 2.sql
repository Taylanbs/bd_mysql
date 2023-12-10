-- Criação do banco de dados
CREATE DATABASE  db_pizzaria_legal;
USE db_pizzaria_legal;

-- Criação da tabela tb_categorias
CREATE TABLE  tb_categoriaspizza (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL,
    descricao_categoria VARCHAR(255)
);

-- Inserção de registros na tabela tb_categorias
INSERT INTO tb_categoriaspizza (nome_categoria, descricao_categoria) VALUES
    ('Salgada', 'Pizzas salgadas tradicionais'),
    ('Doce', 'Pizzas doces e sobremesas'),
    ('Vegetariana', 'Pizzas sem carne'),
    ('Especial', 'Pizzas especiais da casa'),
    ('Gourmet', 'Pizzas gourmet premium');

-- Criação da tabela tb_pizzas
CREATE TABLE  tb_pizzas (
    id_pizza INT AUTO_INCREMENT PRIMARY KEY,
    nome_pizza VARCHAR(100) NOT NULL,
    valor DECIMAL(8, 2) NOT NULL,
    ingredientes TEXT,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categoriaspizza(id_categoria)
);

-- Inserção de registros na tabela tb_pizzas
INSERT INTO tb_pizzas (nome_pizza, valor, ingredientes, id_categoria) VALUES
    ('Margherita', 35.00, 'Molho de tomate, muçarela, manjericão', 1),
    ('Calabresa', 40.00, 'Molho de tomate, calabresa, cebola, muçarela', 1),
    ('Chocolate com Morango', 55.00, 'Chocolate, morango, leite condensado', 2),
    ('Vegetariana Especial', 60.00, 'Molho de tomate, abobrinha, berinjela, tomate, cebola, pimentão, muçarela', 3),
    ('Quatro Queijos Gourmet', 80.00, 'Molho de tomate, muçarela, gorgonzola, parmesão, provolone', 5),
    ('Frango com Catupiry', 45.00, 'Molho de tomate, frango desfiado, catupiry', 4),
    ('Mista', 50.00, 'Molho de tomate, presunto, calabresa, champignon, muçarela', 1),
    ('Pizza do Chef', 90.00, 'Molho especial do chef, ingredientes exclusivos', 5);

-- SELECT que retorne todas as pizzas cujo valor seja maior do que R$ 45,00
SELECT * FROM tb_pizzas WHERE valor > 45.00;

-- SELECT que retorne todas as pizzas cujo valor esteja no intervalo R$ 50,00 e R$ 100,00
SELECT * FROM tb_pizzas WHERE valor BETWEEN 50.00 AND 100.00;

-- SELECT utilizando o operador LIKE, buscando todas as pizzas que possuam a letra M no atributo nome
SELECT * FROM tb_pizzas WHERE nome_pizza LIKE '%M%';

-- SELECT utilizando INNER JOIN para unir os dados das tabelas tb_pizzas e tb_categorias
SELECT * FROM tb_pizzas
INNER JOIN tb_categoriaspizza ON tb_pizzas.id_categoria = tb_categoriaspizza.id_categoria;

-- SELECT utilizando INNER JOIN, unindo os dados das tabelas tb_pizzas e tb_categorias, trazendo apenas as pizzas de uma categoria específica
SELECT * FROM tb_pizzas
INNER JOIN tb_categorias ON tb_pizzas.id_categoria = tb_categorias.id_categoria
WHERE tb_categorias.nome_categoria = 'Doce';
