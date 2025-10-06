-- 8. Saldo de pontos acumulados de cada usuario.
WITH tb_cliente_pontos AS (
    SELECT  
            IdCliente,
            substr(DtCriacao, 1, 10) AS dtDia,
            sum(QtdePontos) AS totalPontos,
            sum(CASE WHEN QtdePontos > 0 THEN QtdePontos ELSE 0 END) AS pontosPosit

    FROM transacoes

    GROUP BY IdCliente, dtDia

),

tb_saldos AS (
    SELECT  *,
            sum(totalPontos) OVER (PARTITION BY IdCliente ORDER BY dtDia) AS saldoPontos,
            sum(pontosPosit) OVER (PARTITION BY IdCliente ORDER BY dtDia) AS totalPontosPos

    FROM tb_cliente_pontos
),

-- E, se mostrar quantos pontos já foi acumulado por cliente?

tb_rn AS (
    SELECT  *, 
            row_number() OVER (PARTITION BY IdCliente ORDER BY saldoPontos DESC) AS ordem

    FROM tb_saldos
)

SELECT * 

FROM tb_rn

WHERE ordem = 1

ORDER BY totalPontosPos DESC
