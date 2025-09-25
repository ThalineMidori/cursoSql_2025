SELECT  idCliente,
        QtdePontos,
        Case
            WHEN QtdePontos <=500 THEN 'Ponei'
            WHEN QtdePontos <=1000 THEN 'Ponei Premium'
            WHEN QtdePontos <=5000 THEN 'Mago Aprendiz'
            WHEN QtdePontos <=10000 THEN 'Mago Mestre'
            ELSE 'Mago Supremo'
        END AS NomeGrupo

FROM clientes

ORDER BY QtdePontos DESC