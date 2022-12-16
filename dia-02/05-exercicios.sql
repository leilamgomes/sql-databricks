-- Databricks notebook source
-- DBTITLE 1,Exercícios de fixação - Lista de clientes da cidade de São Paulo
SELECT
  *
FROM
  silver_olist.cliente
WHERE
  descCidade = 'sao paulo'

-- COMMAND ----------

-- DBTITLE 1,Lista de clientes do estado de São Paulo
SELECT
  *
FROM
  silver_olist.cliente
WHERE
  descUF = 'SP'

-- COMMAND ----------

-- DBTITLE 1,Lista de clientes da cidade de São Paulo utilizando o 'IN'
SELECT
  *
FROM
  silver_olist.cliente
WHERE
  descCidade IN ('sao paulo')

-- COMMAND ----------

-- DBTITLE 1,Lista de vendedores da cidade do Rio de Janeiro e da cidade de São Paulo
SELECT
  *
FROM
  silver_olist.vendedor
WHERE
  descCidade IN ('rio de janeiro', 'sao paulo')
  
-- outra forma para a mesma query e resultados
-- SELECT * FROM silver_olist.vendedor WHERE descCidade = 'rio de janeiro' OR descUF = 'SP'

-- COMMAND ----------

-- DBTITLE 1,Lista de produtos categorizados como 'perfumaria' OU 'bebes' e com Altura maior que 5
SELECT
  *
FROM
  silver_olist.produto
WHERE
  descCategoria IN ('perfumaria', 'bebes')
  AND vlAlturaCm > 5

-- COMMAND ----------

-- DBTITLE 1,1. Lista de pedidos com mais de um item.
SELECT
  *
FROM
  silver_olist.item_pedido
WHERE idPedidoItem > 1

-- COMMAND ----------

-- DBTITLE 1,2. Lista de pedidos que o frete é mais caro que o item.
SELECT
  *
FROM
  silver_olist.item_pedido
WHERE
  vlFrete > vlPreco

-- COMMAND ----------

-- DBTITLE 1,3. Lista de pedidos que ainda não foram enviados.
SELECT
  *
FROM
  silver_olist.pedido
WHERE
  descSituacao NOT IN ('delivered')

-- COMMAND ----------

-- DBTITLE 1,4. Lista de pedidos que foram entregues com atraso.
SELECT
  *
FROM
  silver_olist.pedido
WHERE
  DATE(dtEstimativaEntrega) < DATE(dtEntregue)

-- COMMAND ----------

-- DBTITLE 1,5. Lista de pedidos que foram entregues com 2 dias de antecedência.
SELECT
  *
FROM
  silver_olist.pedido
WHERE
  DATEDIFF(dtEntregue, dtEstimativaEntrega) = -2

-- COMMAND ----------

-- DBTITLE 1,6. Lista de pedidos feito em dezembro de 2017 e entregues com atraso.
SELECT
  *
FROM
  silver_olist.pedido
WHERE
  YEAR(dtPedido) = 2017
  AND MONTH(dtPedido) = 12
  AND descSituacao = 'delivered'
  AND DATE(dtEntregue) > DATE(dtEstimativaEntrega)

-- COMMAND ----------

-- DBTITLE 1,7. Lista de pedidos com avaliação maior ou igual que 4.
SELECT
  *
FROM
  silver_olist.avaliacao_pedido
WHERE
  vlNota >= 4

-- COMMAND ----------

-- DBTITLE 1,8. Lista de pedidos com 2 ou mais parcelas menores que R$ 20,00.
SELECT
  *,
  ROUND(vlPagamento / nrPacelas,2) AS vlParcela
FROM
  silver_olist.pagamento_pedido
WHERE
  nrPacelas >= 2
  AND vlPagamento / nrPacelas < 20

-- COMMAND ----------

-- DBTITLE 1,9. Selecione todos os pedidos e marque se houve atraso ou não
SELECT
  *,
  CASE
    WHEN DATE(dtEntregue) > DATE(dtEstimativaEntrega) THEN 'atrasado'
    WHEN DATE(dtEntregue) < DATE(dtEstimativaEntrega) THEN 'adiantado'
    WHEN DATE(dtEntregue) = DATE(dtEstimativaEntrega) THEN 'pontual'
  END AS statusEntrega
FROM
  silver_olist.pedido

-- COMMAND ----------

-- DBTITLE 1,9. Selecione os itens de pedidos e defina os grupos em uma nova coluna separado por faixa de frete
-- para frete inferior à 10%: '10%'
-- para frente entre 10% e 25%: '10% a 25%'
-- para frente entre 25% e 50%: '25% a 50%'
-- para frente maior que 50%: '50%'


SELECT
  *,
  vlPreco + vlFrete AS vlTotal,
  vlFrete / (vlPreco + vlFrete) AS pctFrete,
  CASE
    WHEN vlFrete / (vlPreco + vlFrete) <= 0.10 THEN '< 10%'
    WHEN vlFrete / (vlPreco + vlFrete) <= 0.25 THEN '10% a 25%'
    WHEN vlFrete / (vlPreco + vlFrete) <= 0.50 THEN '25% a 50%'
    ELSE '+50%'
  END AS faixaFrete
  FROM
  silver_olist.item_pedido
