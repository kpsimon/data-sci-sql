-- CREATE TABLE name(
-- 	data TYPE
-- );
CREATE TABLE friends (
  id INTEGER PRIMARY KEY,                   --PRIMARY KEY constraint (unique value for identity)
  name TEXT UNIQUE,                         --UNIQUE constraint (unique but other cols can share val)
  birthday DATE NOT NULL,                   --NOT NULL constraint (requires value)
  death TEXT DEFAULT 'Not Applicable'       --DEFAULT contraint (fills in data if nothing given)
);

-- INSERT INTO for adding data
INSERT INTO friends (id, name, birthday)
VALUES (0, 'Jane Doe', '1998-02-14');

INSERT INTO friends (id, name, birthday)
VALUES (1, 'Jon Loo', '1998-09-24');

INSERT INTO friends (id, name, birthday)
VALUES (2, 'Anthony Gillio', '1997-12-25');

-- SELECT col FROM name for printing
SELECT * FROM friends;

-- UPDATE for changing existing data
UPDATE friends
SET name = 'Jane Smith'
WHERE id = 0;

SELECT * FROM friends;

-- ALTER to add new columns (for now)
ALTER TABLE friends
ADD COLUMN email TEXT;

UPDATE friends
SET email = 'jane@codeacademy.com'
WHERE id = 0;

UPDATE friends
SET email = 'jon@codeacademy.com'
WHERE id = 1;

UPDATE friends
SET email = 'anthony@codeacademy.com'
WHERE id = 2;

SELECT * FROM friends;

-- DELETE FROM table for removing rows (for now)
DELETE FROM friends
WHERE id = 0;

SELECT * FROM friends;

