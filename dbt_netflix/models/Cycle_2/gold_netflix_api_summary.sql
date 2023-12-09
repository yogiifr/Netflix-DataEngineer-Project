SELECT
    date_added,
    type,
    COUNT(show_id) AS title_count
FROM
    {{ ref('silver_netflix_api_current') }}
GROUP BY date_added, type