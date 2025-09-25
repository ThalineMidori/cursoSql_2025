Select 
        count(*),
        count(1),
        count(IdCliente),
        count(DtCriacao),
        count(DtAtualizacao)

From clientes;

---------------
SELECT DISTINCT FlTwitch, FlEmail

FROM clientes;

----------------

SELECT
        count(*), --Quantas transações foram feitas nesse período?
        count(DISTINCT IdTransacao), 
        count(DISTINCT IdCliente)     -- Quantos clientes compraram nesse período?

FROM transacoes

WHERE DtCriacao >='2025-07-01'
AND DtCriacao < '2025-08-01'

ORDER BY DtCriacao DESC;
