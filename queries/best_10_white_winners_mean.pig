raw_games = LOAD 'hdfs://cm:9000/uhadoop2019/jcordero/chessDB.tsv' USING PigStorage('\t') AS (event, site, game_date, round, white_player, black_player, result, white_elo, black_elo, eco, event_date);

raw_white_winners = FOREACH raw_games GENERATE white_player, (result == '1-0'? 1 : 0) as winner, 1 as game;
white_winners_group = GROUP raw_white_winners BY white_player;
white_winners_results = FOREACH white_winners_group GENERATE flatten(group), SUM(raw_white_winners.winner) AS wins, SUM(raw_white_winners.game) AS games;
white_winners_mean = FOREACH white_winners_results GENERATE $0, wins, (float)wins/games as mean;
white_winners_mean_ordered = ORDER white_winners_mean BY wins DESC;
best_10_white_winners_mean = LIMIT white_winners_mean_ordered 10;

-- (Shirov, Alexei,936,0.49367088)
-- (Korneev, Oleg,883,0.5464109)
-- (Van Wely, Loek,875,0.45620438)
-- (Ivanchuk, Vassily,869,0.44111675)
-- (Tiviakov, Sergei,799,0.5239344)
-- (Epishin, Vladimir,796,0.54557914)
-- (Anand, Viswanathan,740,0.43048283)
-- (Burmakin, Vladimir,731,0.52932656)
-- (Kozul, Zdenko,716,0.51033497)
-- (Hebden, Mark L,715,0.5551242)
