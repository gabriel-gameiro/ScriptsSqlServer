-- Query para a listagem dos clientes que possuem mais de 60% de suas parcelas já pagas.

SELECT * 
FROM Cliente C
WHERE 
C.UF = 'SP' -- Apenas em SP
AND
-- Objetivo: (QTD_PARCELAS_PAGAS / QTD_TOTAL_PARCELAS) > 0.6
C.ClienteID IN
(
  	SELECT F.ClienteID
	FROM Parcela P
 	INNER JOIN Financiamento F ON P.FinanciamentoID = F.FinanciamentoID  
	GROUP BY F.ClienteID -- Obtem todas as parcelas de todos os financiamentos do cliente
  	HAVING CAST(COUNT(DataPagamento) as FLOAT) / CAST(COUNT(*) as FLOAT) > 0.6
)