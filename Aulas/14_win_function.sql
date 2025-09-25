-- Como saber a quantidade de interações, durante o curso, 
-- de forma acumulada por cliente?

with tb_cliente_dia AS (    
    SELECT 
            IdCliente,
            substr(DtCriacao, 1, 10) AS dtDia,
            count(DISTINCT IdTransacao) AS qtdeTransacoes

    FROM transacoes

    WHERE DtCriacao >= '2025-08-25'
    AND DtCriacao < '2025-08-30'

    GROUP BY IdCliente, dtDia

),

tb_lag AS (    
    
    SELECT*,
            sum(qtdeTransacoes) OVER (PARTITION BY IdCliente 
                                ORDER BY dtDia) AS AcumTransacao,
            lag(qtdeTransacoes) OVER (PARTITION BY IdCliente 
                                ORDER BY dtDia) AS lagTransacao

    FROM tb_cliente_dia

)

-- Aumento ou diminuição da participação do cliente por dia
SELECT  *,
        1. * qtdeTransacoes / lagTransacao

FROM tb_lag
