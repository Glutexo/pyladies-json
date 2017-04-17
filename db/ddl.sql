CREATE TABLE "president" (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR NOT NULL,
  "life_from" DATE NOT NULL,
  "life_to" DATE NULL
);

CREATE TABLE "office" (
  "id" SERIAL PRIMARY KEY,
  "president" INTEGER NOT NULL REFERENCES "president" ("id"),
  "from" DATE NOT NULL,
  "to" DATE NULL
);

-- Prezidenti Československa, Protektorátu Čechy a Morava, a Česka. Seřazeni
-- podle prvního nástupu do úřadu.
INSERT INTO "president"
  ("id", "name", "life_from", "life_to")
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

INSERT INTO "office"
  ("president", "from", "to")
VALUES
  (1, '1918-11-14', '1935-12-14'),
  (2, '1935-12-18', '1938-10-05'),
  (3, '1938-11-30', '1939-03-14'),
  (3, '1939-03-15', '1945-05-09'),
  (2, '1940-07-21', '1945-04-02'),
  (2, '1945-04-02', '1948-06-07'),
  (4, '1948-06-14', '1953-03-14'),
  (5, '1951-03-21', '1957-11-13'),
  (6, '1957-11-19', '1968-03-22'),
  (7, '1968-03-30', '1975-05-28'),
  (8, '1975-05-29', '1989-12-10'),
  (9, '1989-12-29', '1992-07-20'),
  (9, '1993-02-02', '2003-02-02'),
  (10, '2003-03-07', '2013-03-07'),
  (11, '2013-03-08', NULL);