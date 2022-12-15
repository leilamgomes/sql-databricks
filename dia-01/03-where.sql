-- Databricks notebook source
SELECT
  *
FROM
  silver_olist.pedido
WHERE
  descSituacao = 'shipped'
  AND YEAR(dtPedido) = '2018'
 
-- LIMIT 100

-- Selecione todas as colunas ONDE o descSituacao esteja com shipped E dtPedido de 2018 (utilizando a função year do SQL)
-- AND = operador de lógica = e
-- Importante colocar limite para não derrubar o banco ou demorar demais para processar a query

-- COMMAND ----------

SELECT
  *
FROM
  silver_olist.pedido
WHERE
  (
    descSituacao = 'shipped'
    OR descSituacao = 'canceled'
  )
  AND YEAR(dtPedido) = '2018'
  
-- Selecione todas as colunas ONDE o descSituacao esteja com (shipped OU canceled) E dtPedido de 2018 (utilizando a função year do SQL)
-- Precisa colocar os parenteses na cláusula WHERE pois senão ele trará resultados errados, é igual fórmula matemática, tudo que está dentro do parênteses é calculado primeiro, exemplo: x = 2 + 10 * 2  -- x = 2 + (10 *2)

-- COMMAND ----------

SELECT
  *
FROM
  silver_olist.pedido
WHERE
  descSituacao IN ('shipped', 'canceled') -- o IN pode ser usado no lugar do OR
  AND year(dtPedido) = '2018' -- IN = descreve condições para a cláusula WHERE (lista com os possíveis resultados), trará os resultados de shipped OU canceled

-- COMMAND ----------

SELECT
  *,
  DATEDIFF(dtEstimativaEntrega, dtAprovado)
FROM
  silver_olist.pedido
WHERE
  descSituacao IN ('shipped', 'canceled')
  AND YEAR(dtPedido) = '2018'
  AND DATEDIFF(dtEstimativaEntrega, dtAprovado) > 30
  
-- Selecione todas as colunas da tabela pedido, onde o pedido esteja em situação shipped ou canceled com data do pedido 2018 e com data estimativa de entrega e data de aprovação maior que 30 dias
