-- Qual mês tivemos mais lista de presença assinada?

SELECT
        substr(t2.DtCriacao, 1, 7) AS anoMes,
        count(DISTINCT t1.IdTransacao) AS qtdeTransacao

FROM transacao_produto AS t1

LEFT JOIN transacoes AS t2
ON t1.IdTransacao = t2.IdTransacao

LEFT JOIN produtos AS t3
ON t1.IdProduto = t3.IdProduto

WHERE t3.IdProduto = 11

GROUP BY substr(t2.DtCriacao, 1, 7)
ORDER BY count(DISTINCT t1.IdTransacao) DESC

LIMIT 10;