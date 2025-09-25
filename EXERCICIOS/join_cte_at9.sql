-- Dos clientes que começaram SQL no primeiro dia,
-- quantos chegarm ao 5° dia?

WITH tb_cliente_primDia AS (
        SELECT 
                DISTINCT IdCliente AS cliente_primDia,
                substr(DtCriacao, 1, 10) AS dataInicio

        FROM transacoes

        WHERE dataInicio = '2025-08-25'
),

tb_cliente_ultDia AS (
        SELECT DISTINCT
                IdCliente AS cliente_ultAula,
                substr(DtCriacao, 1, 10) AS ultAula

        FROM transacoes

        WHERE ultAula = '2025-08-29'

),

tb_join_clientes AS (
        SELECT 
                count(t1.cliente_primDia),
                count(t2.cliente_ultAula),
                1. * count(t2.cliente_ultAula) / count(t1.cliente_primDia) AS proporcao

        FROM tb_cliente_primDia AS t1

        LEFT JOIN tb_cliente_ultDia AS t2
        ON t1.cliente_primDia = t2.cliente_ultAula
)

SELECT * FROM tb_join_clientes