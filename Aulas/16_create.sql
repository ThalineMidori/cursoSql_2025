DROP TABLE IF EXISTS relatorio_diario; -- deleta a tabela inteira

CREATE TABLE IF NOT EXISTS relatorio_diario AS
-- cria uma tabela com essa query

WITH tb_dia_transacoes AS (
    SELECT 
            DISTINCT substr(DtCriacao, 1, 10) AS dtDia,
            count(IdTransacao) AS qtdeTransacoes

    FROM transacoes

    GROUP BY dtDia
    ORDER BY dtDia

),

tb_acum AS (

        SELECT  *,
                sum(qtdeTransacoes) OVER (ORDER BY dtDia) AS qtdeTransacoesAcum
       
        FROM tb_dia_transacoes

)

SELECT* FROM tb_acum; -- precisater essa apresentação da tabela para aparecer

SELECT * FROM relatorio_diario; -- consulta a tabela criada