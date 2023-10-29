CREATE DATABASE CHESSGAME;
USE CHESSGAME;
-- Player Table
CREATE TABLE Player (
    Player_ID INT AUTO_INCREMENT PRIMARY KEY,
    PlayerUsername VARCHAR(255) NOT NULL,
    PlayerEmail VARCHAR(255) UNIQUE NOT NULL,
    PlayerPassword VARCHAR(255) NOT NULL
);

-- Game Mode Table
CREATE TABLE GameMode (
    GameMode_ID INT AUTO_INCREMENT PRIMARY KEY,
    ModeName VARCHAR(255) NOT NULL,
    ModeDescription TEXT
);

-- PlayerOpponentOnline Table
CREATE TABLE PlayerOpponentOnline (
    PlayerOpponentOnline_ID INT AUTO_INCREMENT PRIMARY KEY,
    Matching_Rank INT NOT NULL,
    OpponentUsername VARCHAR(255) NOT NULL
);

-- PlayerAI Table
CREATE TABLE PlayerAI (
    PlayerAI_ID INT AUTO_INCREMENT PRIMARY KEY,
    DifficultyLevel VARCHAR(255) NOT NULL
);

-- PlayerOpponentOffline Table
CREATE TABLE PlayerOpponentOffline (
    PlayerOpponentOffline_ID INT AUTO_INCREMENT PRIMARY KEY,
    OpponentUsername VARCHAR(255) NOT NULL
);

-- Opponent Table
CREATE TABLE Opponent (
    Opponent_ID INT AUTO_INCREMENT PRIMARY KEY,
    PlayerOpponentOnline_ID INT,
    PlayerAI_ID INT,
    PlayerOpponentOffline_ID INT,
    OpponentType VARCHAR(255) NOT NULL,
    FOREIGN KEY (PlayerOpponentOnline_ID) REFERENCES PlayerOpponentOnline(PlayerOpponentOnline_ID),
    FOREIGN KEY (PlayerAI_ID) REFERENCES PlayerAI(PlayerAI_ID),
    FOREIGN KEY (PlayerOpponentOffline_ID) REFERENCES PlayerOpponentOffline(PlayerOpponentOffline_ID)
);

-- GameHistory Table
CREATE TABLE GameHistory (
    GameSession_ID INT AUTO_INCREMENT PRIMARY KEY,
    Player_ID INT NOT NULL,
    Opponent_ID INT NOT NULL,
    GameMode_ID INT NOT NULL,
    GameStart TIMESTAMP NOT NULL,
    GameEnd TIMESTAMP NOT NULL,
    Moves TEXT,
    Result VARCHAR(255) NOT NULL,
    Duration INT NOT NULL,
    FOREIGN KEY (Player_ID) REFERENCES Player(Player_ID),
    FOREIGN KEY (Opponent_ID) REFERENCES Opponent(Opponent_ID),
    FOREIGN KEY (GameMode_ID) REFERENCES GameMode(GameMode_ID)
);
