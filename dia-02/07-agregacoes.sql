-- Databricks notebook source
SELECT
  ROUND(AVG(vlPreco), 2) AS avgPreco,   -- media do preço dos produtos   --ROUND é utilizado para arrendondar o resultado das casas decimais, no exemplo usando 2 casas decimais
  INT(PERCENTILE(vlPreco, 0.5)) AS mediaPreco,   -- preco mediano dos produtos  --INT para arredondar o resultado para um inteiro
  MAX(vlPreco) AS maxPreco,
  MIN(vlPreco) AS minPreco,
  AVG(vlFrete) AS avgFrete,
  MAX(vlFrete) AS maxFrete,
  MIN(vlFrete) AS minFrete
FROM
  silver_olist.item_pedido 

