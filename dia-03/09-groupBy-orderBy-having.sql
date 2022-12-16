-- Databricks notebook source
SELECT
  descUF,
  COUNT(DISTINCT idClienteUnico) AS qntClienteEstado
FROM
  silver_olist.cliente
GROUP BY 
  descUF
ORDER BY 2 -- ORDER BY 2 = ordena pela 2ª coluna

-- COMMAND ----------

SELECT
  descUF,
  COUNT(DISTINCT idClienteUnico) AS qntClienteEstado
FROM
  silver_olist.cliente
GROUP BY 
  descUF
ORDER BY qntClienteEstado

-- COMMAND ----------

SELECT
  descUF,
  COUNT(DISTINCT idClienteUnico) AS qntClienteEstado
FROM
  silver_olist.cliente
GROUP BY 
  descUF
ORDER BY COUNT(DISTINCT idClienteUnico)

-- COMMAND ----------

SELECT
  descUF,
  COUNT(DISTINCT idClienteUnico) AS qntClienteEstado
FROM
  silver_olist.cliente
GROUP BY 
  descUF
ORDER BY qntClienteEstado DESC -- ordem decrescente

-- COMMAND ----------

SELECT
  descUF,
  COUNT(DISTINCT idClienteUnico) AS qntClienteEstado
FROM
  silver_olist.cliente
GROUP BY 
  descUF
ORDER BY qntClienteEstado DESC LIMIT 1

-- COMMAND ----------

SELECT
  descUF,
  COUNT(idVendedor) AS qntVendedorUF
FROM
  silver_olist.vendedor
WHERE descUF IN ('SP', 'MG', 'RJ', 'ES')
GROUP BY
  descUF
HAVING qntVendedorUF >= 100
ORDER BY qntVendedorUF DESC


--Having é um filtro depois da agregação


-- COMMAND ----------

SELECT
  descUF,
  COUNT(idVendedor) AS qntVendedorUF
FROM
  silver_olist.vendedor
WHERE descUF IN ('SP', 'MG', 'RJ', 'ES')
GROUP BY
  descUF
HAVING qntVendedorUF >= 100
ORDER BY qntVendedorUF DESC, descUF ASC -- Order by com 2 condições, ordena primeiro pela qnt de vendedor e segundo por UF
