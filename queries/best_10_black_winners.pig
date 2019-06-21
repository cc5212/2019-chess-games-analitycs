
raw_games = LOAD 'hdfs://cm:9000/uhadoop2019/jcordero/chessDB.tsv' USING PigStorage('\t') AS (event, site, game_date, round, white_player, black_player, result, white_elo, black_elo, eco, event_date);

raw_black_winners = FOREACH raw_games GENERATE black_player, (result == '0-1'? 1 : 0) as winner;
black_winners_group = GROUP raw_black_winners BY black_player;
black_winners_results = FOREACH black_winners_group GENERATE flatten(group), SUM(raw_black_winners.winner) AS wins;
black_winners_ordered = ORDER black_winners_results BY wins DESC;
best_10_black_winners = LIMIT black_winners_ordered 10;

-- Resultados de la consulta
-- (Van Wely, Loek,648)
-- (Korneev, Oleg,625)
-- (Shirov, Alexei,620)
-- (Kozul, Zdenko,617)
-- (Hebden, Mark L,595)
-- (Ivanchuk, Vassily,566)
-- (Nakamura, Hikaru,535)
-- (Miezis, Normunds,529)
-- (Dreev, Aleksey,517)
-- (Burmakin, Vladimir,514)


