-- Quanto tempo leva para um cliente voltar?

--clientes do ano de 2025, ordernando por id e por data
WITH tb_cliente_dia AS (    
    SELECT DISTINCT
            IdCliente,
            substr(DtCriacao, 1, 10) AS dtDia

    FROM transacoes

    WHERE substr(DtCriacao, 1, 4) = '2025'

    GROUP BY IdCliente, dtDia

),

-- colocando o lag para depois calcular a diferença dos dias
tb_lag AS(    
    SELECT  *,
            lag(dtDia) OVER (PARTITION BY IdCliente ORDER BY dtDia) AS lagDia

    FROM tb_cliente_dia
),

-- saber a diferença de dias de presença para cada cliente
tb_diff_dias AS (

    SELECT  *,
        julianday(dtDia) - julianday(lagDia) AS dtDiff

    FROM tb_lag
),

-- para saber média de dias por cliente 
tb_avg_cliente AS (
    
    SELECT  IdCliente,
            avg(dtDiff) AS avgDia

    FROM tb_diff_dias

    GROUP BY IdCliente

)

-- para saber a média de dias gerais
SELECT  avg(avgDia)

FROM tb_avg_cliente