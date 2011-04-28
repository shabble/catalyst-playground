--alterations to original sql.
ALTER TABLE book ADD created TIMESTAMP;
ALTER TABLE book ADD updated TIMESTAMP;
UPDATE book SET created = DATETIME('NOW'), updated = DATETIME('NOW');