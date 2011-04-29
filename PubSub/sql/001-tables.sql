
PRAGMA foreign_keys = ON;

CREATE TABLE subscriptions (
       id    INTEGER PRIMARY KEY,
       source TEXT, -- feed source
       topic  TEXT, -- dunno
       status TEXT, -- status of subscription
       uuid   TEXT  -- magic key.
);