-- 8. Saldo de pontos acumulados de cada usuario.
WITH tb_cliente_pontos AS (
    SELECT  
            DISTINCT IdCliente,
            substr(DtCriacao, 1, 10) AS dtDia,
            count(QtdePontos) AS qtdePontos

    FROM transacoes

    GROUP BY IdCliente, dtDia

    ORDER BY dtDia
),

tb_ponto_acumulados AS (
    SELECT  *,
            sum (qtdePontos) OVER (
                ORDER BY IdCliente, dtDia) AS qtdePontosAcum

    FROM tb_cliente_pontos
),

tb_rn_acumulado AS (
    SELECT  IdCliente, 
            qtdePontosAcum,
            row_number () OVER (PARTITION BY IdCliente ORDER BY IdCliente, qtdePontosAcum DESC) AS ordenacao

    FROM tb_ponto_acumulados
)

SELECT  * 

FROM tb_rn_acumulado

WHERE ordenacao = 1