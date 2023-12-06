SELECT
  li AS category,
  COUNT(show_id) AS shows
FROM 
  {{ ref('staging__netflix') }} stage,
  UNNEST(stage.category) li
GROUP BY li
