-- Lista de clientes com 100 a 200 pontos (inclusive ambos);
-- resposta 551

SELECT IdCliente, QtdePontos
FROM clientes 
WHERE QtdePontos >= 100 AND QtdePontos <= 200;