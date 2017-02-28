DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;
DROP TABLE IF EXISTS genres;

CREATE TABLE genres (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255) 
);

CREATE TABLE artists (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  genre_id INT4 REFERENCES genres(id) ON DELETE CASCADE
);

CREATE TABLE albums (
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  quantity INT4,
  artist VARCHAR(255),
  id_artists INT4 REFERENCES artists(id) ON DELETE CASCADE,
  buy_price INT4,
  sell_price INT4
);

