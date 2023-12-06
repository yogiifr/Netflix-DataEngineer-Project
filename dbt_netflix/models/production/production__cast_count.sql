SELECT
  c AS cast_name,
  COUNT(show_id) AS shows
FROM 
  {{ ref('staging__netflix') }} stage,
  UNNEST(stage.`cast`) c
GROUP BY c
