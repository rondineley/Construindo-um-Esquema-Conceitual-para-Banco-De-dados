
-- CLIENTE
CREATE TABLE Cliente (
    ID_Cliente INT PRIMARY KEY,
    Nome VARCHAR(100),
    Telefone VARCHAR(20),
    Endereco VARCHAR(200)
);

-- VEICULO
CREATE TABLE Veiculo (
    ID_Veiculo INT PRIMARY KEY,
    Placa VARCHAR(10),
    Modelo VARCHAR(50),
    Marca VARCHAR(50),
    Ano INT,
    ID_Cliente INT,
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

-- EQUIPE
CREATE TABLE Equipe (
    ID_Equipe INT PRIMARY KEY,
    Nome_Equipe VARCHAR(100)
);

-- MECÂNICO
CREATE TABLE Mecanico (
    ID_Mecanico INT PRIMARY KEY,
    Nome VARCHAR(100),
    Endereco VARCHAR(200),
    Especialidade VARCHAR(100),
    ID_Equipe INT,
    FOREIGN KEY (ID_Equipe) REFERENCES Equipe(ID_Equipe)
);

-- ORDEM DE SERVIÇO
CREATE TABLE Ordem_Servico (
    ID_OS INT PRIMARY KEY,
    Data_Emissao DATE,
    Data_Conclusao DATE,
    Valor_Total DECIMAL(10,2),
    Status VARCHAR(50),
    ID_Veiculo INT,
    ID_Equipe INT,
    FOREIGN KEY (ID_Veiculo) REFERENCES Veiculo(ID_Veiculo),
    FOREIGN KEY (ID_Equipe) REFERENCES Equipe(ID_Equipe)
);

-- SERVIÇO
CREATE TABLE Servico (
    ID_Servico INT PRIMARY KEY,
    Descricao VARCHAR(200),
    Valor_Mao_de_Obra DECIMAL(10,2)
);

-- PEÇA
CREATE TABLE Peca (
    ID_Peca INT PRIMARY KEY,
    Nome VARCHAR(100),
    Valor DECIMAL(10,2)
);

-- ITEM_SERVIÇO
CREATE TABLE Item_Servico (
    ID_OS INT,
    ID_Servico INT,
    Valor_Mao_de_Obra DECIMAL(10,2),
    PRIMARY KEY (ID_OS, ID_Servico),
    FOREIGN KEY (ID_OS) REFERENCES Ordem_Servico(ID_OS),
    FOREIGN KEY (ID_Servico) REFERENCES Servico(ID_Servico)
);

-- ITEM_PEÇA
CREATE TABLE Item_Peca (
    ID_OS INT,
    ID_Peca INT,
    Quantidade INT,
    Valor_Unitario DECIMAL(10,2),
    PRIMARY KEY (ID_OS, ID_Peca),
    FOREIGN KEY (ID_OS) REFERENCES Ordem_Servico(ID_OS),
    FOREIGN KEY (ID_Peca) REFERENCES Peca(ID_Peca)
);

-- INSERÇÕES

-- CLIENTES
INSERT INTO Cliente (ID_Cliente, Nome, Telefone, Endereco) VALUES
(1, 'João da Silva', '88999998888', 'Rua A, 123'),
(2, 'Maria Oliveira', '88988887777', 'Rua B, 456');

-- VEÍCULOS
INSERT INTO Veiculo (ID_Veiculo, Placa, Modelo, Marca, Ano, ID_Cliente) VALUES
(1, 'ABC1D23', 'Corolla', 'Toyota', 2020, 1),
(2, 'XYZ4E56', 'Civic', 'Honda', 2019, 2);

-- EQUIPE
INSERT INTO Equipe (ID_Equipe, Nome_Equipe) VALUES
(1, 'Equipe Alfa'),
(2, 'Equipe Beta');

-- MECÂNICOS
INSERT INTO Mecanico (ID_Mecanico, Nome, Endereco, Especialidade, ID_Equipe) VALUES
(1, 'Carlos Lima', 'Rua C, 789', 'Motor', 1),
(2, 'José Neto', 'Rua D, 321', 'Freios', 1),
(3, 'Ana Torres', 'Rua E, 654', 'Elétrica', 2);

-- SERVIÇOS
INSERT INTO Servico (ID_Servico, Descricao, Valor_Mao_de_Obra) VALUES
(1, 'Troca de óleo', 80.00),
(2, 'Alinhamento', 100.00),
(3, 'Revisão elétrica', 200.00);

-- PEÇAS
INSERT INTO Peca (ID_Peca, Nome, Valor) VALUES
(1, 'Filtro de óleo', 35.00),
(2, 'Velas de ignição', 60.00),
(3, 'Bateria 60Ah', 450.00);

-- ORDEM DE SERVIÇO
INSERT INTO Ordem_Servico (ID_OS, Data_Emissao, Data_Conclusao, Valor_Total, Status, ID_Veiculo, ID_Equipe) VALUES
(1, '2025-07-01', '2025-07-05', 615.00, 'Concluída', 1, 1),
(2, '2025-07-10', '2025-07-15', 510.00, 'Em andamento', 2, 2);

-- ITEM_SERVIÇO
INSERT INTO Item_Servico (ID_OS, ID_Servico, Valor_Mao_de_Obra) VALUES
(1, 1, 80.00),
(1, 2, 100.00),
(2, 3, 200.00);

-- ITEM_PEÇA
INSERT INTO Item_Peca (ID_OS, ID_Peca, Quantidade, Valor_Unitario) VALUES
(1, 1, 1, 35.00),
(1, 2, 2, 60.00),
(2, 3, 1, 450.00);
