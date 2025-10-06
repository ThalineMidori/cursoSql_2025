--DROP TABLE IF EXISTS clientes_d28;

CREATE TABLE IF NOT EXISTS clientes_d28 (
    IdCliente VARCHAR(250) PRIMARY KEY,
    QtdeTransacoes INTEGER

);

DELETE FROM clientes_d28;

INSERT INTO clientes_d28 

SELECT 
        IdCliente,
        count(DISTINCT IdTransacao) AS QtdeTransacoes

FROM transacoes

WHERE julianday('2025-09-05') - julianday(substr(Dtcriacao, 1, 10)) <= 28

GROUP BY IdCliente
;

SELECT * FROM clientes_d28;

