-- Quantos vendas do tipo !presentes foram feitas?

SELECT IdProduto,
    count(*)

FROM transacao_produto

GROUP BY IdProduto;

-- Qual o saldo de pontos total do sistema?

SELECT 
        IdCliente,
        sum(QtdePontos),
        count(IdTransacao)

FROM transacoes

WHERE DtCriacao >= '2025-07-01'
AND DtCriacao < '2025-08-01'

GROUP BY IdCliente
ORDER BY sum(QtdePontos) DESC;