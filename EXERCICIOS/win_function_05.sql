-- 5. Quantidade de transaçoes Acumuladas ao longo do tempo?

WITH tb_dia_transacoes AS (
    SELECT 
            DISTINCT substr(DtCriacao, 1, 10) AS dtDia,
            count(IdTransacao) AS transacoesDia

    FROM transacoes

    GROUP BY dtDia
)

SELECT  *,
        sum(transacoesDia) OVER (ORDER BY dtDia) AS qtdeTransacoesAcum

FROM tb_dia_transacoes