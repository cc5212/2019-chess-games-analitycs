raw_players = LOAD 'hdfs://cm:9000/uhadoop2019/jcordero/chessplayers.tsv' USING PigStorage('\t') AS (id, name, country, sex, title, wtitle, otitle, FOA, elo, gms, K, rapid_rating, rapid_games, rapid_k, blitz_rating, blitz_gms, blitz_k, birthday, flag);

raw_players_name_elo = FOREACH raw_players GENERATE name, elo;
players_ordered = ORDER raw_players_name_elo BY elo DESC;

limited_best_players = LIMIT players_ordered 10;

-- (Carlsen, Magnus,2875)
-- (Caruana, Fabiano,2819)
-- (Kasparov, Garry,2812)
-- (Ding, Liren,2805)
-- (Vachier-Lagrave, Maxime,2779)
-- (Giri, Anish,2779)
-- (Nepomniachtchi, Ian,2775)
-- (Grischuk, Alexander,2775)
-- (Mamedyarov, Shakhriyar,2774)
-- (Anand, Viswanathan,2767)
