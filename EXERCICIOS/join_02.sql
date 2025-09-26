-- Quais clientes assinaram a lista de presença no dia 2025-08-25?
SELECT 
        substr(t1.DtCriacao, 1, 10) AS datas, 
        t3.DescProduto,
        count(t1.IdTransacao) AS totalTransacao

FROM transacoes AS t1

LEFT JOIN transacao_produto AS t2
ON t1.IdTransacao = t2.IdTransacao

LEFT JOIN produtos AS t3
ON t2.IdProduto = t3.IdProduto

WHERE DescProduto = 'Lista de presença'
AND substr(t1.DtCriacao, 1, 10) = '2025-08-25'

