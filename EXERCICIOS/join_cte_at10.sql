-- 10. Como foi a curva de "churn" do Curso de SQL?
-- (pessoas que permaneceram)

WITH tb_clientes_primDia AS (

    SELECT 
            DISTINCT IdCliente,
            substr(DtCriacao, 1, 10) AS primDia

    FROM transacoes

    WHERE primDia >= '2025-08-25'
    AND primDia < '2025-08-26'

)

SELECT 
        substr(t2.DtCriacao, 1, 10)  AS dtDia,
        count(DISTINCT t1.IdCliente) AS qtdeCliente,
        1. * count(DISTINCT t1.IdCliente) / (SELECT count(*) FROM tb_clientes_primDia) AS pctRetenção,
        1 - 1. * count(DISTINCT t1.IdCliente) / (SELECT count(*) FROM tb_clientes_primDia) AS pctChurn

FROM tb_clientes_primDia AS t1

LEFT JOIN transacoes AS t2
ON t1.IdCliente = t2.IdCliente

WHERE DtCriacao >= '2025-08-25'
AND DtCriacao < '2025-08-30'

GROUP BY dtDia