--B)Calcular los siguientes KPI para los pedidos entregados (fecha de entrega) en el año 2021, desglosado por mes:
--d.Coste total de	los pedidos entregados.

SELECT
  mes,
  ROUND(SUM(aux_d),2) as Costo_total_pedidos_entregados_2021
FROM (
  SELECT 
    FORMAT_TIMESTAMP('%b', DATE_TRUNC(o.delivered_at, Month)) as mes,
    SUM(ii.cost) as aux_d
  FROM `bigquery-public-data.thelook_ecommerce.orders` as o
  INNER JOIN `bigquery-public-data.thelook_ecommerce.order_items` as oi
  ON o.order_id = oi.order_id
  INNER JOIN `bigquery-public-data.thelook_ecommerce.inventory_items` as ii
  ON oi.product_id = ii.product_id
  WHERE o.delivered_at >= TIMESTAMP('2021-1-1') AND o.delivered_at < TIMESTAMP('2022-1-1')
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
