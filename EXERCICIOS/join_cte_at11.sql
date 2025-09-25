-- 11. Quem iniciou o curso no primeiro dia, em média, assistiu quantas aulas?

WITH tb_cliente_primDia AS (

        SELECT 
                DISTINCT IdCliente AS cliente_primDia,
                substr(DtCriacao, 1, 10) AS primDia

        FROM transacoes

        WHERE substr(DtCriacao, 1, 10) = '2025-08-25'

),

tb_cliente_diasAulas AS (

        SELECT DISTINCT 
                IdCliente AS cliente_diasAula,
                substr(DtCriacao, 1, 10) AS diasAula

        FROM transacoes

        WHERE DtCriacao >= '2025-08-25'
        AND DtCriacao < '2025-08-30'

        ORDER BY cliente_diasAula, diasAula

),

tb_cliente_dias AS (
        
        SELECT 
                t1.cliente_primDia,
                count(DISTINCT t2.diasAula) AS qtdeDias

        FROM tb_cliente_primDia AS t1

        LEFT JOIN tb_cliente_diasAulas AS t2
        ON t1.cliente_primDia = t2.cliente_diasAula

        GROUP BY t1.cliente_primDia

)

SELECT avg(qtdeDias), max(qtdeDias), min(qtdeDias)

FROM tb_cliente_dias
