raw_games = LOAD 'hdfs://cm:9000/uhadoop2019/jcordero/chessDB.tsv' USING PigStorage('\t') AS (event, site, game_date, round, white_player, black_player, result, white_elo, black_elo, eco, event_date);

raw_black_winners = FOREACH raw_games GENERATE black_player, (result == '0-1'? 1 : 0) as winner, 1 as game;
black_winners_group = GROUP raw_black_winners BY black_player;
black_winners_results = FOREACH black_winners_group GENERATE flatten(group), SUM(raw_black_winners.winner) AS wins, SUM(raw_black_winners.game) AS games;
black_winners_mean = FOREACH black_winners_results GENERATE $0, wins, (float)wins/games as mean;
black_winners_mean_ordered = ORDER black_winners_mean BY wins DESC;
best_10_black_winners_mean = LIMIT black_winners_mean_ordered 10;

-- Resultados de la consulta
-- (Van Wely, Loek,648,0.3357513)
-- (Korneev, Oleg,625,0.40584415)
-- (Shirov, Alexei,620,0.33405173)
-- (Kozul, Zdenko,617,0.4407143)
-- (Hebden, Mark L,595,0.47448167)
-- (Ivanchuk, Vassily,566,0.2913021)
-- (Nakamura, Hikaru,535,0.37386444)
-- (Miezis, Normunds,529,0.43218955)
-- (Dreev, Aleksey,517,0.33247587)
-- (Burmakin, Vladimir,514,0.38763198)
