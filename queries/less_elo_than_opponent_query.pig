raw_games = LOAD 'hdfs://cm:9000/uhadoop2019/jcordero/chessDB.tsv' USING PigStorage('\t') AS (event, site, game_date, round, white_player, black_player, result, white_elo, black_elo, eco, event_date);

games_with_winners = FILTER raw_games BY (result == '1-0' or result == '0-1');
winners = foreach games_with_winners GENERATE (result == '1-0'? white_player : black_player) as winner_name, (result == '1-0'? white_elo : black_elo) as winner_elo, (result == '1-0'? black_elo : white_elo) as loser_elo;
winners_with_worse_elo = FILTER winners BY (winner_elo + 100 < loser_elo); -- cambiar 100 por cualquier valor para generar mayor o menor diferencia entre jugadores
group_winners = GROUP winners_with_worse_elo BY winner_name;
results = FOREACH group_winners GENERATE flatten(group), COUNT(winners_with_worse_elo.$0) as tuples;

ordered_results = ORDER results BY tuples DESC;

results_limited = LIMIT ordered_results 10;

-- ELO del ganador es menor que el del perdedor
-- (Nakamura, Hikaru,273)
-- (Van Wely, Loek,241)
-- (Grischuk, Alexander,228)
-- (Karjakin, Sergey,225)
-- (Nepomniachtchi, Ian,210)
-- (Aronian, Levon,208)
-- (Ivanchuk, Vassily,203)
-- (Savchenko, Boris,198)
-- (Svidler, Peter,192)
-- (Gunina, Valentina,189)

-- ELO del ganador es al menos 200 menos que del perdedor
-- (Mamedjarova, Turkan,70)
-- (Al-Sayed, Mohammed N,66)
-- (Mamedjarova, Zeinab,65)
-- (Yildiz, Betul Cemre,58)
-- (Savchenko, Boris,56)
-- (Baghdasaryan, Vahe,56)
-- (Antipov, Mikhail Al,54)
-- (Tate, Alan,54)
-- (Calzetta Ruiz, Monica,53)
-- (Kulon, Klaudia,53)


-- ELO del ganador es al menos 300 menos que el del perdedor
-- (Choukri, Adel,11)
-- (Kukk, Sander,9)
-- (Haussernot, Cecile,9)
-- (Bezgodova, Svetlana,9)
-- (Gramlich, Sebastian,9)
-- (Garifullina, Leya,9)
-- (Sviridova, Vlada,9)
-- (Dang, Hoang Son,8)
-- (Schuls, Olev,8)
-- (Rosenthal, Nicholas,8)

