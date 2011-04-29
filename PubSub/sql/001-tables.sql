
PRAGMA foreign_keys = ON;

CREATE TABLE subscriptions (
       id    INTEGER PRIMARY KEY,
       source TEXT,
       topic  TEXT,
       status TEXT,
       uuid   TEXT
);