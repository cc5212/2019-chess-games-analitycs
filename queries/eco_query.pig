raw_games = LOAD 'hdfs://cm:9000/uhadoop2019/jcordero/chessDB.tsv' USING PigStorage('\t') AS (event, site, game_date, round, white_player, black_player, result, white_elo, black_elo, eco, event_date);

raw_games_no_null_eco = FILTER raw_games BY eco is not null;
only_eco = FOREACH raw_games_no_null_eco GENERATE eco;
games_group_by_eco = GROUP only_eco BY eco;
results = FOREACH games_group_by_eco GENERATE flatten(group), COUNT(only_eco.$0) as tuples;
results_ordered = ORDER results BY tuples;
limited_results = LIMIT results_ordered 10;

-- (B22,43864)
-- (B06,29407)
-- (B07,28414)
-- (B01,25776)
-- (B12,22327)
-- (B33,22149)
-- (A45,21618)
-- (B23,21376)
-- (B90,21322)
-- (E11,21009)
