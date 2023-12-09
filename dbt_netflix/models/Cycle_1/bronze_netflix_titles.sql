SELECT 
* EXCEPT(
    director,
    `cast`,
    country,
    listed_in
),
SPLIT (director, ', ') AS director,
SPLIT (`cast`, ', ') AS `cast`,
SPLIT (country, ', ') AS country,
SPLIT (listed_in, ', ') AS category,
FROM {{ source('raw_netflix', 'raw_netflix_titles') }}
