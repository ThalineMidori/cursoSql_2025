DELETE FROM relatorio_diario; -- deleta os componentes da tabela, a tabela continua existindo
-- .table

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

INSERT INTO relatorio_diario  -- coloca os dados dessa query na tabela que ja existe

SELECT * FROM tb_acum; -- precisa dessa visualização


SELECT* FROM relatorio_diario;