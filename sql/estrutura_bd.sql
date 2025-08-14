--  Criação do banco de dados para gerenciar uma biblioteca escolar - SGB
CREATE DATABASE IF NOT EXISTS SGB;
USE SGB;

-- Tabela Categoria
CREATE TABLE Categoria (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VACHAR(50) NOT NULL,
    descricao TEXT
);

--tabela livro
CREATE TABLE livro (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    isbn VARCHAR(20) NOT NULL,
    sinopse TEXT,
    capa TEXT,
    quantidade INT DEFAULT 1
    Categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES Categoria(id)
);

--Table Aluno 
CREATE TABLE Aluno (
    id INT PRIMARY KEY AUTO_INCREMENT,
    NOME  VARCHAR (100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    serie VARCHAR(20) NOT NULL,
    statu ENUM('ativo', 'bloqueado') DEFAULT 'ativo'
);

--Tabela professor
CREATE TABLE professor(
    id INT PRIMARY KEY AUTO_INCREMENT,
    NOME  VARCHAR (100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    disciplina VARCHAR(50),
    statu ENUM('ativo', 'inativo') DEFAULT 'ativo'
);

--Tabela Bibliotecario
CREATE TABLE Bibliotecario (
    id INT PRIMARY KEY_AUTO_INCREMENT,
    NOME  VARCHAR (100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    statu ENUM('ativo', 'inativo') DEFAULT 'ativo'
);

--Tabela Diretor
CREATE TABLE Diretor (
    id INT PRIMARY KEY AUTO_INCREMENT,
    NOME  VARCHAR (100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    statu ENUM('ativo', 'inativo') DEFAULT 'ativo'
);

--Tabela Supervisor
CREATE TABLE Supervisor (
    id INT PRIMARY KEY AUTO_INCREMENT,
    NOME  VARCHAR (100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    statu ENUM('ativo', 'inativo') DEFAULT 'ativo'
);

--Tabela Emprestimo
CREATE TABLE Emprestimo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    Aluno_id INT,
    livro_id INT,
    data_emprestimo DATE NOT NULL,
    data_devolucao_prevista DATE,
    data_devolucao_real DATE,
    multa DECIMAL(6,2) DEFAULT 0.00,
    FOREIGN KEY (Aluno_id) REFERENCES Aluno(id),
    FOREIGN KEY (livro_id) REFERENCES Livro(id)
);

--tabela Reserva
CREATE TABLE Reserva (
    id INT PRIMARY KEY_AUTO_INCREMENT,
    Aluno_id INT,
    livro_id INT,
    data_reserva DATE,
    statu ENUM('ativa', 'expirada','cancelada'),
    FOREIGN KEY (Aluno_id) REFERENCES Aluno(id),
    FOREIGN KEY (Livro_id) REFERENCES livro(id)
):

--Tabela HistoricoLeitura
CREATE TABLE HistoricoLeitura(
    id INT PRIMARY KEY_AUTO_INCREMENT,
    Aluno_id INT,
    data_inicio DATE,
    data_fim DATE,
    FOREIGN KEY (Aluno_id) REFERENCES Aluno(id)
    FOREIGN KEY (livro_id) Reserva Livro(id)
);

--tabelo sugestão
CREATE TABLE sugestao(
    id int PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150),
    autor VARCHAR(100),
    Categoria VARCHAR(50),
    justificativa TEXT,
    data_sugestao DATE,
    alino_id INT
    professor_id INT,
    FOREIGN KEY (Aluno_id) REFERENCES Aluno(id),
    FOREIGN KEY (professor_id) REFERENCES professor(id)
);
--tabela Relatorio
CREATE TABLE Relatorio(
    id INT PRIMARY KEY AUTO_INCREMENT,
    tipo ENUM('mensal, 'turma', 'aluno','livro'),
    periodo_inicio DATE,
    periodo_fim DATE,
    geriodo_por_bibliotecario INT,
    gerado_por_diretor INT,
    gerado_por_supervisor INT,
    FOREIGN KEY (gerado_por_bibliotecario) REFERENCES Bibliotecario(id),
    FOREIGN KEY (gerado_por_direito) REFERENCES Diretor(id),
    FOREIGN KEY (gerado_por_Supervisor) REFERENCES Supervisor(id)
);

