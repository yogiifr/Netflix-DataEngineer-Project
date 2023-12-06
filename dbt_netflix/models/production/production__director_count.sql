SELECT
  d AS director_name,
  COUNT(show_id) AS show_created
FROM 
  {{ ref('staging__netflix') }} stage,
  UNNEST(stage.director) d
GROUP BY d
