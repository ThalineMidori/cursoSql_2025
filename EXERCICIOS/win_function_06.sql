-- 6. Quantidade de usuarios cadastrados (absoluto e acumulado) ao longo do tempo?

WITH tb_cliente_dia AS (

    SELECT  
            substr(DtCriacao, 1, 10) AS dtDia,
            count(DISTINCT IdCliente) AS qtdeClientes

    FROM clientes

    GROUP BY dtDia
),

Tb_acum AS (
    SELECT  *,
            sum(qtdeClientes) OVER (ORDER BY dtDia) AS qtdeClienteAcum

    FROM tb_cliente_dia

    ORDER BY dtDia
)

-- Quando foi atingindo 3.000 clientes?

SELECT *

FROM Tb_acum

WHERE qtdeClienteAcum >=3000

LIMIT 1