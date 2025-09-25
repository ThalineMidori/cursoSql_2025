
-- 1.Quantos clientes tem email cadastrado?

SELECT 
        sum(FlEmail) AS qtdeEmail

FROM clientes;

-- 2.Qual cliente juntou mais pontos positivos em 2025-05?

SELECT 
        IdCliente,  
        sum(QtdePontos) AS totalPontos

FROM transacoes

WHERE DtCriacao >= '2025-05-01' AND DtCriacao < '2025-06-01'
AND QtdePontos > 0

GROUP BY IdCliente
ORDER BY sum(QtdePontos) DESC
LIMIT 1;

-- 3.Qual cliente fez mais transações no ano de 2024?

SELECT 
        IdCliente,
        count(*),
        count(DISTINCT IdTransacao)

FROM transacoes

WHERE DtCriacao >= '2024-01-01' AND DtCriacao < '2025-01-01'

GROUP BY IdCliente
ORDER BY count(*) DESC
LIMIT 1; 


-- 4.Quantos produtos são de rpg?

SELECT 
        DescCateogriaProduto,
        count(DescProduto)

FROM produtos

WHERE DescCateogriaProduto = 'rpg';

SELECT 
        DescCateogriaProduto,
        count(DescProduto)
FROM produtos
WHERE DescCateogriaProduto;

-- 5.Qual o valor médio de pontos positivos por dia?

SELECT 
        sum(QtdePontos) AS totalPoontos,
        count(DISTINCT substr(DtCriacao, 1, 10)) AS qtdeDiasUnicos,
        sum(QtdePontos) / count(DISTINCT substr(DtCriacao, 1, 10)) AS avgPontosDia

FROM transacoes

WHERE QtdePontos > 0;

SELECT 
        substr(DtCriacao, 1, 10) AS dtDia,
        avg(QtdePontos) AS avgPontoDia
FROM transacoes 
WHERE QtdePontos > 0
GROUP BY 1
ORDER BY 1;

-- 6.Qual dia da semana que mais pedidos aconteceram em 2025?

SELECT 
        strftime('%Y', datetime(substr(DtCriacao, 1, 10))) AS ano_mes_dia, 
        strftime('%w', datetime(substr(DtCriacao, 1, 10))) AS dia_semana,
        count(IdTransacao)

FROM transacoes

WHERE ano_mes_dia = '2025'

GROUP BY strftime('%w', datetime(substr(DtCriacao, 1, 10)))
ORDER BY count(IdTransacao) DESC;

SELECT 
        strftime('%w', substr(DtCriacao, 1, 10)) AS diaSemana,
        count(DISTINCT IdTransacao) AS qtdeTransacao,
        count(IdTransacao) AS qtdeTransacao2,
        count(*) AS qtdeTransacao3
FROM transacoes
WHERE strftime(substr(DtCriacao, 1, 4)) = '2025'
GROUP BY 1
ORDER BY 2 DESC;

-- 7.Qual o produto mais transacionado? ChatMessage

SELECT 
        IdProduto,
        count(*),
        sum(QtdeProduto) AS qtdeProdutoSum

FROM transacao_produto

GROUP BY IdProduto
ORDER BY count(*) DESC
LIMIT 10;

-- 8.Qual o produto com mais pontos transacionado?

SELECT 
        IdProduto,
        sum(VlProduto) AS totalPontos,
        sum(QtdeProduto) AS qtdeVendas

FROM transacao_produto

GROUP BY IdProduto
ORDER BY sum(VlProduto) DESC