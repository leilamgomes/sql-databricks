-- Databricks notebook source
-- DBTITLE 1,Agregações - count
SELECT
  COUNT(*) AS nrLinhasNaoNulas
FROM
  silver_olist.cliente 
  
  -- count(*), conta quantas linhas tem na tabela clientes
  -- são linhas não nulas

-- COMMAND ----------

SELECT
  COUNT(*) AS nrLinhasNaoNulas,
  COUNT(idCliente) AS nrIdClientesNaoNulos
FROM
  silver_olist.cliente

-- COMMAND ----------

SELECT
  COUNT(*) AS nrLinhasNaoNulas,  -- linhas não nulas
  COUNT(idCliente) AS nrIdClientesNaoNulos,   -- id de clientes nao nulos
  COUNT(DISTINCT idCliente) AS nrIdClientesNaoNulosDistintos -- id de clientes distintos
FROM
  silver_olist.cliente

-- COMMAND ----------

SELECT
  COUNT(*) AS nrLinhasNaoNulas,  -- linhas não nulas
  COUNT(idCliente) AS nrIdClientesNaoNulos,  -- id de clientes nao nulos
  COUNT(DISTINCT idCliente) AS nrIdClientesNaoNulosDistintos,  -- id de clientes distintos
  COUNT(DISTINCT idClienteUnico) AS nrClienteUnicoDistinto -- id de clientes unicos
FROM
  silver_olist.cliente

-- COMMAND ----------

SELECT
  COUNT(*)
FROM
  silver_olist.cliente
WHERE
  descCidade = 'presidente prudente'

-- COMMAND ----------

SELECT
  COUNT(*) AS qtLinhas,
  COUNT(DISTINCT idCliente) AS qtClientes,
  COUNT(DISTINCT idClienteUnico) AS qtClientesUnicos
FROM
  silver_olist.cliente
WHERE
  descCidade IN ('presidente prudente', 'curitiba')  -- lembrando que nesse caso é OU presidente prudente ou curitiba
