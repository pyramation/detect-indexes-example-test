WITH indexed_tables AS (
    SELECT
        ns.nspname,
        t.relname AS table_name,
        i.relname AS index_name,
        array_to_string(array_agg(a.attname), ', ') AS column_names,
        ix.indrelid,
        ix.indkey::smallint[]
    FROM
        pg_class i
        JOIN pg_index ix ON i.OID = ix.indrelid
        JOIN pg_class t ON ix.indrelid = t.oid
        JOIN pg_namespace ns ON ns.oid = t.relnamespace
        JOIN pg_attribute a ON a.attrelid = t.oid
    WHERE
        a.attnum = ANY (ix.indkey)
        AND t.relkind = 'r'
        AND nspname NOT IN ('pg_catalog')
    GROUP BY
        ns.nspname,
        t.relname,
        i.relname,
        ix.indrelid,
        ix.indkey
    ORDER BY
        ns.nspname,
        t.relname,
        i.relname,
        ix.indrelid,
        ix.indkey
)
SELECT
    conrelid::regclass,
    conname,
    reltuples::bigint
FROM
    pg_constraint pgc
    JOIN pg_class ON (conrelid = pg_class.oid)
WHERE
    contype = 'f'
    AND NOT EXISTS (
        SELECT
            1
        FROM
            indexed_tables
        WHERE
            indrelid = conrelid
            AND conkey = indkey
            OR (array_length(indkey, 1) > 1
                AND indkey @> conkey))
    ORDER BY
        reltuples DESC;
