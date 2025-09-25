-- Lista de transações com apenas 1 ponto;
-- resposta 182.343

SELECT IdTransacao, QtdePontos
FROM transacoes
WHERE QtdePontos = 1;