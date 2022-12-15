-- Databricks notebook source
SELECT
  *
FROM
  silver_olist.pedido
  
-- selecione TUDO do banco de dados silver_olist e tabela pedido

-- COMMAND ----------

SELECT
  idPedido,
  descSituacao
FROM
  silver_olist.pedido

-- Selecione a coluna idPedido e descSituacao da tabela pedido

-- COMMAND ----------

SELECT
  idPedido,
  descSituacao
FROM
  silver_olist.pedido
LIMIT
  5

-- Selecione a coluna idPedido e descSituacao da tabela pedido com limite de 5 linhas

-- COMMAND ----------

SELECT
  *,
  DATEDIFF(dtEstimativaEntrega, dtEntregue) AS qtDiasPromessaEntrega
FROM
  silver_olist.pedido

-- DATEDIFF é uma função do SQL/Spark para calcular a diferença de dias entre duas datas.
-- AS = alias, apelido para a nova coluna. O AS é opcional, porém fica mais legível.
