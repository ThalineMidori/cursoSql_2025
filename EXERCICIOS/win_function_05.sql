-- 5. Quantidade de transaçoes Acumuladas ao longo do tempo(diário)?

WITH tb_dia_transacoes AS (
    SELECT 
            DISTINCT substr(DtCriacao, 1, 10) AS dtDia,
            count(IdTransacao) AS transacoesDia

    FROM transacoes

    GROUP BY dtDia
    ORDER BY dtDia

),

tb_acumulado AS (
    SELECT  *,
            sum(transacoesDia) OVER (ORDER BY dtDia) AS qtdeTransacoesAcum

    FROM tb_dia_transacoes

)

-- Quando foi atingido 100.000 transações?

SELECT * 

FROM tb_acumulado

WHERE qtdeTransacoesAcum >= 100000

ORDER BY qtdeTransacoesAcum

LIMIT 1