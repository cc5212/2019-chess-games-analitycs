raw_games = LOAD 'hdfs://cm:9000/uhadoop2019/jcordero/chessDB.tsv' USING PigStorage('\t') AS (event, site, game_date, round, white_player, black_player, result, white_elo, black_elo, eco, event_date);

raw_white_winners = FOREACH raw_games GENERATE white_player, (result == '1-0'? 1 : 0) as winner;
white_winners_group = GROUP raw_white_winners BY white_player;
white_winners_results = FOREACH white_winners_group GENERATE flatten(group), SUM(raw_white_winners.winner) AS wins;
white_winners_ordered = ORDER white_winners_results BY wins DESC;
best_10_white_winners = LIMIT white_winners_ordered 10;

-- (Shirov, Alexei,936)
-- (Korneev, Oleg,883)
-- (Van Wely, Loek,875)
-- (Ivanchuk, Vassily,869)
-- (Tiviakov, Sergei,799)
-- (Epishin, Vladimir,796)
-- (Anand, Viswanathan,740)
-- (Burmakin, Vladimir,731)
-- (Kozul, Zdenko,716)
-- (Hebden, Mark L,715)
