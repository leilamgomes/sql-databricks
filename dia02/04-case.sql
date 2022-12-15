-- Databricks notebook source
SELECT
  *,
  CASE
    WHEN descUF = 'SP' THEN 'paulista'
    WHEN descUF = 'RJ' THEN 'fluminense'
    WHEN descUF = 'PR' THEN 'paranaense'
    ELSE 'outros'
  END AS descNacionalidade
FROM
  silver_olist.cliente 
  
-- SQL é case sensitive no caso do valor do campo, então não podemos usar por exemple 'sp' em minúsculo que não encontrará.
-- Para quando o descUF for 'SP' então incluir na nova coluna descNacionalidade 'paulista'
-- crlt + shift + f = formata o texto

-- COMMAND ----------

SELECT *,
-- isso é uma coluna nova
  CASE
    WHEN descUF = 'SP' THEN 'paulista'
    WHEN descUF = 'RJ' THEN 'fluminense'
    WHEN descUF = 'PR' THEN 'paranaense'
    ELSE 'outros'
  END AS descNacionalidade,
-- isso é outra coluna nova
  CASE
    WHEN descCidade LIKE '%sao%' THEN 'Tem sao no nome'
    ELSE 'Não tem sao no nome'
  END AS descCidadeSao
FROM
  silver_olist.cliente

-- COMMAND ----------

SELECT *,
-- isso é uma coluna nova
  CASE
    WHEN descUF IN ('SP', 'MG', 'RJ', 'ES') THEN 'sudeste'
    END AS descRegiao
FROM
  silver_olist.vendedor
