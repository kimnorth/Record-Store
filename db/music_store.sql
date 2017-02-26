-- DROP TABLE IF EXISTS artists_with_albums;

DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;


CREATE TABLE artists (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE albums (
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  quantity INT4,
  id_artists INT4 REFERENCES artists(id)
);



