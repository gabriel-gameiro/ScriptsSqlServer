-- Query para a listagem dos clientes que possuem alguma parcela em atraso.

SELECT TOP 4 * FROM Cliente WHERE clienteid IN 
(
  	SELECT DISTINCT F.ClienteID
	FROM Financiamento F
 	INNER JOIN Parcela P ON F.FinanciamentoID = P.FinanciamentoID  
	WHERE P.DataPagamento IS NULL AND datavencimento < GETDATE()
)