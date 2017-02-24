DROP TABLE IF TABLE EXISTS artists;
DROP TABLE IF TABLE EXISTS albums;

CREATE TABLE artists (
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  group_name VARCHAR(255)
);

CREATE TABLE albums (
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  quantity INT4
);