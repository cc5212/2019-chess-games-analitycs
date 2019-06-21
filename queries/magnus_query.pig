raw_games = LOAD 'hdfs://cm:9000/uhadoop2019/jcordero/chessDB.tsv' USING PigStorage('\t') AS (event, site, game_date, round, white_player, black_player, result, white_elo, black_elo, eco, event_date);

magnus_games_white = FILTER raw_games BY (white_player == 'Carlsen, Magnus' and result == '0-1');
magnus_games_black = FILTER raw_games BY (black_player == 'Carlsen, Magnus' and result == '1-0');

players_won_against_magnus1 = FOREACH magnus_games_white GENERATE black_player as name, black_elo as elo;
players_won_against_magnus2 = FOREACH magnus_games_black GENERATE white_player as name, white_elo as elo;

players_won_against_magnus = UNION players_won_against_magnus1, players_won_against_magnus2;

grouped_players = GROUP players_won_against_magnus BY name;
result = FOREACH grouped_players GENERATE flatten(group), COUNT(players_won_against_magnus.$0) as tuples, MIN(players_won_against_magnus.elo);
result_ordered = ORDER result BY tuples DESC;

limited_results = LIMIT result_ordered 10;

-- Resultados de la consulta
-- (Grischuk, Alexander,23,2709.0)
-- (Aronian, Levon,20,2645.0)
-- (Anand, Viswanathan,19,2779.0)
-- (Nakamura, Hikaru,18,2699.0)
-- (Ivanchuk, Vassily,17,2726.0)
-- (Kramnik, Vladimir,12,2759.0)
-- (Karjakin, Sergey,11,2672.0)
-- (Caruana, Fabiano,11,2773.0)
-- (Morozevich, Alexander,8,2741.0)
-- (Radjabov, Teimour,8,2713.0)

