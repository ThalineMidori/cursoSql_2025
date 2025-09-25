-- Quais clientes mais perderam pontos por LOVER?

SELECT 
        t1.IdCliente,
        count(t1.IdTransacao),
        sum(t1.QtdePontos),
        t2.IdProduto,
        t3.DescCateogriaProduto

FROM transacoes AS t1

LEFT JOIN transacao_produto AS t2
ON t1.IdTransacao = t2.IdTransacao

LEFT JOIN produtos AS t3
ON t2.IdProduto = t3.IdProduto

WHERE DescCateogriaProduto = 'lovers'

GROUP BY t1.IdCliente
ORDER BY sum(t1.QtdePontos)

LIMIT 10;

