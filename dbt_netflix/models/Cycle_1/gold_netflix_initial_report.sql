SELECT
  c AS cast,
  COUNT(show_id) AS shows,
FROM 
  {{ ref('silver_netflix_current') }} stage,
  UNNEST(stage.`cast`) c
GROUP BY c

UNION ALL

SELECT
  li AS category,
  COUNT(show_id) AS shows,
FROM 
  {{ ref('silver_netflix_current') }} stage,
  UNNEST(stage.category) li
GROUP BY li

UNION ALL

SELECT
  d AS director,
  COUNT(show_id) AS shows,
FROM 
  {{ ref('silver_netflix_current') }} stage,
  UNNEST(stage.director) d
GROUP BY d
