--B)Calcular los siguientes KPI para los pedidos entregados (fecha de entrega) en el año 2021, desglosado por mes:
--b.Volumen de artículos entregados.

SELECT
  mes,
  SUM(aux_b) as Volumen_de_articulos_entregados_2021
FROM (
  SELECT 
    FORMAT_TIMESTAMP('%b', DATE_TRUNC(delivered_at, Month)) as mes,
    SUM(num_of_item) as aux_b
  FROM `bigquery-public-data.thelook_ecommerce.orders`
  WHERE delivered_at >= TIMESTAMP('2021-1-1') AND delivered_at < TIMESTAMP('2022-1-1')
  GROUP BY mes
)
GROUP BY mes
ORDER BY
    CASE mes
    WHEN 'Jan' THEN 1
    WHEN 'Feb' THEN 2
    WHEN 'Mar' THEN 3
    WHEN 'Apr' THEN 4
    WHEN 'May' THEN 5
    WHEN 'Jun' THEN 6
    WHEN 'Jul' THEN 7
    WHEN 'Aug' THEN 8
    WHEN 'Sep' THEN 9
    WHEN 'Oct' THEN 10
    WHEN 'Nov' THEN 11
    WHEN 'Dec' THEN 12
  END;
