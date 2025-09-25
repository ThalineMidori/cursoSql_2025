-- Lista de pedidos realizados no fim de semana;
-- resposta = 3396 transações

SELECT DtCriacao,
    STRFTIME('%w', datetime(SUBSTR(DtCriacao, 1, 19))) AS numero_dia_semana

FROM transacoes

WHERE numero_dia_semana in ('0','6')