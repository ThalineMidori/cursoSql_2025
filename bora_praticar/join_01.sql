--Qual categoria tem mais produtos vendidos?
SELECT 
        produtos.DescCateogriaProduto,
        transacao_produto.IdProduto, 
        count(DISTINCT transacao_produto.IdTransacao)

FROM transacao_produto

LEFT JOIN produtos
ON transacao_produto.IdProduto = produtos.IdProduto

GROUP BY produtos.DescCateogriaProduto
ORDER BY count(DISTINCT transacao_produto.IdTransacao) DESC