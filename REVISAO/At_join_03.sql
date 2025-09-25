-- Do início ao fim do curso (2025-0825 a 2025-08-29), 
-- quantos clientes assinaram a lista de presença?

SELECT 
        count(DISTINCT t1.IdCliente) AS qtdeClientes

FROM transacoes AS t1

LEFT JOIN transacao_produto AS t2
ON t1.IdTransacao = t2.IdTransacao

LEFT JOIN produtos AS t3
ON t2.IdProduto = t3.IdProduto
 
WHERE DtCriacao >= '2025-08-25'
AND DtCriacao < '2025-08-30'
AND DescProduto = 'Lista de presença'