raw_games = LOAD 'hdfs://cm:9000/uhadoop2019/jcordero/chessDB.tsv' USING PigStorage('\t') AS (event, site, game_date, round, white_player, black_player, result, white_elo, black_elo, eco, event_date);
-- Later you can change the above file to 'hdfs://cm:9000/uhadoop/shared/imdb/imdb-stars.tsv' to see the full output


raw_players = LOAD 'hdfs://cm:9000/uhadoop2019/jcordero/chessplayers.tsv' USING PigStorage('\t') AS (id, name, country, sex, title, wtitle, otitle, FOA, elo, gms, K, birthday, flag);

games_results = FOREACH raw_games GENERATE result, (result == '1-0'? 1 : 0) as white, (result == '0-1'? 1 : 0) as black, (result == '1/2-1/2'? 1 : 0) as draw;
games_results_group = GROUP games ALL;
final_results = FOREACH games_group GENERATE SUM(games.white) AS whites, SUM(games.black) AS blacks, SUM(games.draw) AS draws;



-- Resultados de la consulta
-- (799210,606812,779309)
