-- Qual o tatal de pontos trocados no Stream Elemensts em Junho de 2025?

SELECT 
        substr(t1.DtCriacao, 1, 7) AS anoMes,
        sum(t1.IdTransacao) AS qtdeTransacao,
        -1.*sum(t1.QtdePontos) AS somaPontos,
        t3.DescCateogriaProduto

FROM transacoes AS t1

LEFT JOIN transacao_produto AS t2
ON t1.IdTransacao = t2.IdTransacao

LEFT JOIN produtos AS t3
ON t3.IdProduto = t2.IdProduto

WHERE t3.DescCateogriaProduto = 'streamelements'
AND substr(t1.DtCriacao, 1, 7) = '2025-06'

GROUP BY substr(t1.DtCriacao, 1, 7)