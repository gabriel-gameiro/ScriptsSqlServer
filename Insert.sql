USE CadastroFinanceiro;

INSERT INTO TipoFinanciamento(Descricao)
VALUES 
('IMOBILIARIO'),
('ESTUDANTIL')
;

INSERT INTO Cliente (Nome, CPF, UF, Celular)
VALUES 
('Gabriel Gameiro', '64141050075', 'SP', '5511958535058'),
('Luiz Mendez', '33568324091', 'SP', '559224276688')
;

INSERT INTO Financiamento (TipoFinanciamentoID, ClienteID, CPF, ValorTotal, DataUltimoVencimento)
VALUES
(1, 1, '64141050075', 400000.00, '2054-12-15'),
(2, 2, '33568324091', 35000.00, '2025-06-01')
;

-- Não cadastrei muitas parcelas, apenas as necessárias para os testes
INSERT INTO Parcela (FinanciamentoID, NumeroOrdem, Valor, DataVencimento, DataPagamento)
VALUES
-- Menos de 60% das parcelas pagas, todas estão em dia
(1, 1, 1300.00, '2024-04-15', '2024-04-10'),
(1, 2, 1300.00, '2024-05-15', '2024-05-09'),
(1, 3, 1300.00, '2024-06-15', NULL),
(1, 4, 1300.00, '2024-07-15', NULL),
(1, 5, 1300.00, '2024-08-15', NULL),
(1, 6, 1300.00, '2024-09-15', NULL),
(1, 7, 1300.00, '2024-10-15', NULL),

-- Mais de 60% das parcelas pagas, mas com a última em atraso
(2, 1, 3100.00, '2024-01-01', '2023-12-27'),
(2, 2, 3100.00, '2024-02-01', '2024-01-22'),
(2, 3, 3100.00, '2024-03-01', '2024-02-26'),
(2, 4, 3100.00, '2024-04-01', '2024-03-30'),
(2, 5, 3100.00, '2024-05-01', NULL), -- Atrasado
(2, 6, 3100.00, '2024-06-01', NULL)
;