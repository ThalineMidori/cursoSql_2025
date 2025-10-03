-- 6. Quantidade de usuarios cadastrados (absoluto e acumulado) ao longo do tempo?

WITH tb_cliente_dia AS (

    SELECT  
            substr(DtCriacao, 1, 10) AS dtDia,
            count(DISTINCT IdCliente) AS qtdeClientes

    FROM transacoes

    GROUP BY dtDia
)

SELECT  *,
        sum(qtdeClientes) OVER (ORDER BY dtDia) AS qtdeClienteAcum

FROM tb_cliente_dia