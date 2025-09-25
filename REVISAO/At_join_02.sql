-- Quais clientes assinaram a lista de presença no dia 2025-08-25?

SELECT 
        substr(t1.DtCriacao, 1, 10) AS diaInicio,
        t3.DescProduto AS produto,
        count(t1.IdTransacao) AS qtdeTransacoes

FROM transacoes AS t1

LEFT JOIN transacao_produto AS t2
ON t1.IdTransacao = t2.IdTransacao

LEFT JOIN produtos AS t3
ON t2.IdProduto = t3.IdProduto
 
WHERE DtCriacao >= '2025-08-25'
AND DtCriacao < '2025-08-26'
AND DescProduto = 'Lista de presença'
