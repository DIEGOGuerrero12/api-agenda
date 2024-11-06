CREATE USER 'diego'@'localhost' IDENTIFIED BY 'diego5125';

GRANT SELECT, INSERT, UPDATE, DELETE ON db_agenda.* TO 'diego'@'localhost';

FLUSH PRIVILEGES;