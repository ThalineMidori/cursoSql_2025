
WITH tb_clientes_2025 AS (  
    SELECT  IdTransacao, 
            IdCliente,
            substr(DtCriacao, 1, 10) AS dt_jan_mai,
            QtdePontos,
            DescSistemaOrigem

    FROM transacoes

    WHERE DtCriacao >= '2025-01-01'
    AND DtCriacao < '2025-06-01'

),

tb_transacao_produto AS (
    SELECT  t1.IdTransacao,
            t1.IdProduto,
            t1.VlProduto,
            t2.DescProduto,
            t2.DescCateogriaProduto

    FROM transacao_produto AS t1

    LEFT JOIN produtos AS t2
    ON t1.IdProduto = t2.IdProduto
)

SELECT * 

FROM tb_clientes_2025 AS t1

LEFT JOIN tb_transacao_produto AS t2
ON t1.IdTransacao = t2.IdTransacao

LIMIT 5000