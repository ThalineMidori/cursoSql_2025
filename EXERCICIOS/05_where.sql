-- Lista de produtos com nome que começa com "Venda de";
-- resposta 23

SELECT DescProduto
FROM produtos
WHERE DescProduto like 'Venda de%'