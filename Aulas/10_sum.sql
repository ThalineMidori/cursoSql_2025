-- Quantos pontos foram ganhos no mês de Julho?
-- Há diferença de pontos ganho pois há pontos negativos de troca

SELECT 
        sum(QtdePontos),
        sum(CASE 
            WHEN QtdePontos > 0 THEN QtdePontos
        END) AS qtdePontosPositivos,

        sum(CASE
            WHEN QtdePontos < 0 THEN QtdePontos
        END) AS qtdePontosNegativos,
        count(CASE
            WHEN QtdePontos < 0 THEN QtdePontos
        END) AS qtdeTransacoesNegativas

FROM transacoes

WHERE DtCriacao	>='2025-07-01' 
AND DtCriacao <'2025-08-01'
