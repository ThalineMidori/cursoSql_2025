-- Como fazemos estatíticas do saldo dos clientes?

SELECT 
        round(avg(QtdePontos),2) as mediaCarteira,
        1.*sum(QtdePontos)/count(IdCliente) as mediaCarteiraRoots,
        min(QtdePontos) as minCarteira,
        max(QtdePontos) as maxCarteira,
        sum(FlTwitch),
        sum(FlEmail)

FROM clientes;

