--Lista de clientes com 0(zero) pontos;
--resposta 648

SELECT IdCliente, QtdePontos
FROM clientes
WHERE QtdePontos = 0;