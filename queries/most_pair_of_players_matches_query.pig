raw_games = LOAD 'hdfs://cm:9000/uhadoop2019/jcordero/chessDB.tsv' USING PigStorage('\t') AS (event, site, game_date, round, white_player, black_player, result, white_elo, black_elo, eco, event_date);

games_results = FOREACH raw_games GENERATE white_player, black_player, (result=='1-0'? 1 : 0) AS white_win, (result == '1/2-1/2'? 1 : 0) AS draw, (result=='0-1'? 1 : 0) AS black_win, 1 as match ;

games_results_new = FOREACH games_results GENERATE (white_player < black_player? CONCAT(white_player,'##',black_player) : CONCAT(black_player,'##',white_player)) as names, (white_player < black_player? white_win : black_win) AS first_win, draw, (white_player < black_player? black_win : white_win) AS second_win, match;

pairs_grouped = GROUP games_results_new BY names;

sum_of_pairs_grouped = FOREACH pairs_grouped GENERATE FLATTEN(group), SUM(games_results_new.first_win) AS first_wins, SUM(games_results_new.draw) AS draws, SUM(games_results_new.second_win) AS second_wins, SUM(games_results_new.match) AS total;

sum_ordered = ORDER sum_of_pairs_grouped BY total DESC;
limited = LIMIT sum_ordered 10;

-- Resultados de la consulta
-- (Anand, Viswanathan##Kramnik, Vladimir,30,148,30,208)
-- (Caruana, Fabiano##Nakamura, Hikaru,24,57,55,136)
-- (Anand, Viswanathan##Ivanchuk, Vassily,29,84,22,135)
-- (Anand, Viswanathan##Topalov, Veselin,39,77,17,133)
-- (Kasparov, Garry##Kramnik, Vladimir,25,86,22,133)
-- (Nakamura, Hikaru##Vachier-Lagrave, Maxime,44,60,26,130)
-- (Aronian, Levon##Nakamura, Hikaru,30,62,38,130)
-- (Carlsen, Magnus##Nakamura, Hikaru,52,55,18,125)
-- (Ivanchuk, Vassily##Kramnik, Vladimir,23,70,25,118)
-- (Kramnik, Vladimir##Leko, Peter,21,88,8,117)
