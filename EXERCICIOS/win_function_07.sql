-- 7. Qual o dia da semana mais ativo de cada usuario?

WITH tb_cliente_diaSemana AS (
  
    SELECT 
            IdCliente,
            count(DISTINCT IdTransacao) AS qtdeTransacoes,
            strftime('%w', substr(DtCriacao, 1, 10)) AS dtDiaSemana

    FROM transacoes

    GROUP BY IdCliente, dtDiaSemana

),

tb_row_number AS (

    SELECT  *,
            row_number() OVER (
                PARTITION BY IdCliente ORDER BY qtdeTransacoes DESC) AS ordem

    FROM tb_cliente_diaSemana

)

SELECT * 

FROM tb_row_number

WHERE ordem = 1