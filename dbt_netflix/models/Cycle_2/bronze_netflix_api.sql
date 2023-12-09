SELECT 
    JSON_EXTRACT_SCALAR(rb, '$.show_id') AS `show_id`,
    JSON_EXTRACT_SCALAR(rb, '$.type') AS `type`,
    JSON_EXTRACT_SCALAR(rb, '$.date_added') AS `date_added`,
FROM 
    {{ source('api_netflix', 'api_response_netflix') }}
WHERE
    -- INCREMENTAL CODE HERE