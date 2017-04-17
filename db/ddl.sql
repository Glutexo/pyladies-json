CREATE TABLE `presidents` (
  `id` INTEGER PRIMARY KEY NOT NULL,
  `name` VARCHAR NOT NULL,
  `life_from` DATE NOT NULL,
  `life_to` DATE NULL
);

-- Prezidenti Československa, Protektorátu Čechy a Morava, a Česka. Seřazeni
-- podle prvního nástupu do úřadu.
INSERT INTO `presidents`
  (`id`, `name`, `life_from`, `life_to`)
VALUES
  (1,  'Tomáš Garrigue Masaryk', '1850-03-07', '1937-09-14'),
  (2,  'Edvard Beneš',           '1884-05-28', '1948-09-03'),
  (3,  'Emil Hácha',             '1872-06-12', '1945-06-27'),
  (4,  'Klement Gottwald',       '1896-11-23', '1953-03-14'),
  (5,  'Antonín Zápotocký',      '1884-12-19', '1957-11-13'),
  (6,  'Antonín Novotný',        '1904-12-10', '1975-01-28'),
  (7,  'Ludvík Svoboda',         '1895-11-25', '1979-09-20'),
  (8,  'Gustáv Husák',           '1913-01-10', '1991-11-18'),
  (9,  'Václav Havel',           '1936-10-05', '2011-12-18'),
  (10, 'Václav Klaus',           '1941-06-19', NULL),
  (11, 'Miloš Zeman',            '1944-09-28', NULL);
