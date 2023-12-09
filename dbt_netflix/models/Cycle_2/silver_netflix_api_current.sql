SELECT
    *
FROM
    {{ ref('bronze_netflix_api') }}
QUALIFY ROW_NUMBER() OVER(
    PARTITION BY show_id
    ORDER BY date_added DESC
) = 1