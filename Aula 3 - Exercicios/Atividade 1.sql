CREATE DATABASE db_generation_game_online;

-- Selecionar o banco de dados
USE db_generation_game_online;

-- Criar a tabela tb_classes
CREATE TABLE tb_classes (
    id_classe INT PRIMARY KEY,
    nome_classe VARCHAR(50) NOT NULL,
    descricao_classe VARCHAR(255)
);

-- Criar a tabela tb_personagens
CREATE TABLE tb_personagens (
    id_personagem INT PRIMARY KEY,
    nome_personagem VARCHAR(50) NOT NULL,
    poder_ataque INT,
    poder_defesa INT,
    id_classe INT,
    FOREIGN KEY (id_classe) REFERENCES tb_classes(id_classe)
);


-- Inserir dados na tabela tb_classes
INSERT INTO tb_classes (id_classe, nome_classe, descricao_classe) VALUES
(1, 'Guerreiro', 'Lutador corpo a corpo'),
(2, 'Mago', 'Usa magias para atacar e defender'),
(3, 'Arqueiro', 'Atira à distância'),
(4, 'Assassino', 'Especializado em ataques furtivos'),
(5, 'Cavaleiro', 'Montado em uma montaria para combate');

-- Inserir dados na tabela tb_personagens
INSERT INTO tb_personagens (id_personagem, nome_personagem, poder_ataque, poder_defesa, id_classe) VALUES
(1, 'Herói', 2500, 1500, 1),
(2, 'Feiticeiro', 1800, 1200, 2),
(3, 'Flecha Rápida', 2200, 900, 3),
(4, 'Sombra', 2000, 1000, 4),
(5, 'Cavaleiro Dourado', 3000, 2000, 5),
(6, 'Clérigo', 1600, 1800, 2),
(7, 'Arqueira Élfica', 2400, 800, 3),
(8, 'Ladino', 1900, 1100, 4);


-- Retornar personagens com poder de ataque maior que 2000
SELECT * FROM tb_personagens WHERE poder_ataque > 2000;

-- Retornar personagens com poder de defesa entre 1000 e 2000
SELECT * FROM tb_personagens WHERE poder_defesa BETWEEN 1000 AND 2000;

-- Retornar personagens que possuam a letra C no nome
SELECT * FROM tb_personagens WHERE nome_personagem LIKE '%C%';

-- INNER JOIN entre tb_personagens e tb_classes
SELECT * FROM tb_personagens INNER JOIN tb_classes ON tb_personagens.id_classe = tb_classes.id_classe;

-- INNER JOIN com filtro por classe (ex.: Arqueiros)
SELECT * FROM tb_personagens
INNER JOIN tb_classes ON tb_personagens.id_classe = tb_classes.id_classe
WHERE tb_classes.nome_classe = 'Arqueiro';
