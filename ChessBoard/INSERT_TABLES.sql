-- Inserting data into Player table
INSERT INTO Player (PlayerUsername, PlayerEmail, PlayerPassword) 
VALUES ('Mama Yae', 'yaee@gmail.com', 'yaeae');

-- Inserting data into GameMode table
INSERT INTO GameMode (ModeName, ModeDescription) 
VALUES ('Classic', 'The classic mode of the game.');

-- Inserting data into PlayerOpponentOnline table
INSERT INTO PlayerOpponentOnline (Matching_Rank, OpponentUsername) 
VALUES (1200, 'EI');

-- Inserting data into PlayerAI table
INSERT INTO PlayerAI (DifficultyLevel) 
VALUES ('Medium');

-- Inserting data into PlayerOpponentOffline table
INSERT INTO PlayerOpponentOffline (OpponentUsername) 
VALUES ('OfflinePlayer1');

-- Inserting data into Opponent table (Linking to the above PlayerOpponentOnline)
INSERT INTO Opponent (PlayerOpponentOnline_ID, OpponentType) 
VALUES (1, 'Online');

-- Inserting data into GameHistory table
INSERT INTO GameHistory (Player_ID, Opponent_ID, GameMode_ID, GameStart, GameEnd, Moves, Result, Duration) 
VALUES (1, 1, 1, '2023-10-29 10:00:00', '2023-10-29 10:30:00', 'move1, move2, move3', 'Win', 30);
