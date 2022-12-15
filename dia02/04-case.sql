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
  
-- SQL é case sensitive no valor do campo, então não podemos usar por exemplO 'sp' em minúsculo que não encontrará, a sentença tem que estar escrita exatamente igual, neste caso SP
-- Para quando o descUF for 'SP' então incluir na nova coluna descNacionalidade 'paulista' que foi definido no case
-- Importante utilizar o else para definir o restante dos resultados, se não usar o else, o restante virá como 'null'
-- END serve para finalizar a sentença do case, assim ele finalizou e deu um alias para a nova coluna
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
  
-- LIKE usando para encontrar padrões no resultado
-- % no LIKE é para definir a posição que procurará o resultado
-- % no começo, indica que o resultado pode conter outros caracteres antes do procurado %sao, se tivesse uma palavra dimensao como resultado, iria aparecer também
-- % no final, indica que pode ter outros caracteres após o resultado sao% - exemplo sao paulo
-- se não utilizar o %, o resultado tem que ser exatamente o definido na query, 'sao' só traria 'sao' no resultado, no caso dessa tabela, não traria nada, pois nao nenhum resultado somente 'sao'

-- COMMAND ----------

SELECT *,
-- isso é uma coluna nova
  CASE
    WHEN descUF IN ('SP', 'MG', 'RJ', 'ES') THEN 'sudeste'
    END AS descRegiao
FROM
  silver_olist.vendedor
  
-- IN (lista de resultados) que serão descritos como o citado no THEN, e inserido na nova coluna desdRegiao
