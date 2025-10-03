-- 7. Qual o dia da semana mais ativo de cada usuario?

WITH tb_cliente_dia AS (
  
    SELECT 
            DISTINCT IdCliente,
            substr(DtCriacao, 1, 10) AS dtDia,
            count(IdTransacao) AS qtdeTransacoes

    FROM transacoes

    GROUP BY IdCliente, dtDia
),

tb_row_number AS (
    SELECT  *,
            row_number() OVER (
                PARTITION BY IdCliente ORDER BY qtdeTransacoes DESC) AS ordem

    FROM tb_cliente_dia

),

tb_mais_transacoesDia AS (
    SELECT  
            IdCliente,
            dtDia,
            ordem

    FROM tb_row_number

    WHERE ordem = 1
),

tb_diaSemana_maisTransacoes AS (
    SELECT  IdCliente,
            dtDia,
            strftime('%w', dtDia) AS diaSemana,
            ordem  

    FROM tb_mais_transacoesDia
)

SELECT diaSemana,
       count(IdCliente)

FROM tb_diaSemana_maisTransacoes

GROUP BY diaSemana

