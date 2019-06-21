raw_games = LOAD 'hdfs://cm:9000/uhadoop2019/jcordero/chessDB.tsv' USING PigStorage('\t') AS (event, site, game_date, round, white_player, black_player, result, white_elo, black_elo, eco, event_date);

raw_games_filtered = FILTER raw_games BY (result!='1/2-1/2');
raw_winners = FOREACH raw_games_filtered GENERATE (result=='1-0'? white_player : black_player) as name, 1 AS win;
winners_grouped = GROUP raw_winners BY name;
winners_grouped_count = FOREACH winners_grouped GENERATE FLATTEN(group), SUM(raw_winners.win) as total;
winners_ordered = ORDER winners_grouped_count BY total DESC;
limited_results = LIMIT winners_ordered 10;

-- Resultados de la consulta
-- (Shirov, Alexei,1556)
-- (Van Wely, Loek,1523)
-- (Korneev, Oleg,1509)
-- (Ivanchuk, Vassily,1435)
-- (Kozul, Zdenko,1333)
-- (Tiviakov, Sergei,1312)
-- (Hebden, Mark L,1310)
-- (Epishin, Vladimir,1309)
-- (Burmakin, Vladimir,1245)
-- (Nakamura, Hikaru,1221)

