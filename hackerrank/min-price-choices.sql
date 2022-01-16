SELECT
    W.id, WP.age, W.coins_needed, W.power
FROM
    Wands W JOIN Wands_Property WP ON W.code = WP.code
WHERE
    WP.is_evil = 0 and W.coins_needed =
        -- sub-query (correlated sub-query) to make sure that if the wand age and wand power matches with another
        -- to return the cheapest (lowest coins_needed) wand with.
        (SELECT
            min(W1.coins_needed)
        FROM
            Wands W1 JOIN Wands_Property WP1 ON W1.code = WP1.code
        -- only consider the candidates with the same power and age to the row (wand) we are processing
        WHERE
            W1.power = W.power and WP1.age = WP.age)
ORDER BY
    power DESC, age DESC
