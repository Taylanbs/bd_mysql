-- Criação do banco de dados
CREATE DATABASE rh_empresa;
USE rh_empresa;

-- Criação da tabela de colaboradores
CREATE TABLE colaboradores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    cargo VARCHAR(50),
    salario DECIMAL(10,2),
    data_contratacao DATE
);

-- Inserção de alguns dados
INSERT INTO colaboradores (nome, cargo, salario, data_contratacao) VALUES
    ('João Silva', 'Desenvolvedor', 2500.00, '2022-01-15'),
    ('Maria Oliveira', 'Analista de RH', 1800.00, '2021-08-20'),
    ('Carlos Santos', 'Gerente de Projetos', 3000.00, '2020-05-10'),
    ('Ana Costa', 'Assistente Administrativo', 1900.00, '2023-02-28'),
    ('Pedro Rocha', 'Analista Financeiro', 2200.00, '2019-11-05');

-- SELECT dos colaboradores com salário maior que 2000
SELECT * FROM colaboradores WHERE salario > 2000;

-- SELECT dos colaboradores com salário menor que 2000
SELECT * FROM colaboradores WHERE salario < 2000;

-- Atualização de um registro (por exemplo, aumentando o salário de Maria Oliveira)
UPDATE colaboradores SET salario = 2000.00 WHERE nome = 'Maria Oliveira';
