-- Databricks notebook source
SELECT
  *
FROM
  silver_olist.cliente
WHERE
  descCidade = 'sao paulo'

-- COMMAND ----------

SELECT
  *
FROM
  silver_olist.cliente
WHERE
  descUF = 'SP'

-- COMMAND ----------

SELECT
  *
FROM
  silver_olist.cliente
WHERE
  descCidade IN ('sao paulo')

-- COMMAND ----------

SELECT
  *
FROM
  silver_olist.vendedor
WHERE
  descCidade IN ('rio de janeiro', 'sao paulo')
  
-- outra forma para a mesma query e resultados
-- SELECT * FROM silver_olist.vendedor WHERE descCidade = 'rio de janeiro' OR descUF = 'SP'

-- COMMAND ----------

SELECT
  *
FROM
  silver_olist.produto
WHERE
  descCategoria IN ('perfumaria', 'bebes')
  AND vlAlturaCm > 5

-- COMMAND ----------

SELECT
  *
FROM
  silver_olist.item_pedido
WHERE
  vlFrete > vlPreco

-- COMMAND ----------

SELECT
  *
FROM
  silver_olist.pedido
WHERE
  descSituacao NOT IN ('delivered')

-- COMMAND ----------

SELECT
  *
FROM
  silver_olist.pedido
WHERE
  DATE(dtEstimativaEntrega) < DATE(dtEntregue)

-- COMMAND ----------

SELECT
  *
FROM
  silver_olist.pedido
WHERE
  DATEDIFF(dtEntregue, dtEstimativaEntrega) = -2

-- COMMAND ----------

SELECT
  *
FROM
  silver_olist.pedido
WHERE
  YEAR(dtPedido) = '2017'
  AND dtEntregue > dtEstimativaEntrega -- WHERE DATEDIFF(dtEntregue, dtEstimativaEntrega) = -2

-- COMMAND ----------

SELECT
  *
FROM
  silver_olist.avaliacao_pedido
WHERE
  vlNota >= 4

-- COMMAND ----------

SELECT
  *,
  vlPagamento / nrPacelas AS vlParcela
FROM
  silver_olist.pagamento_pedido
-- WHERE vlParcela >= 20
