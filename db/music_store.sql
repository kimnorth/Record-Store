-- DROP TABLE IF EXISTS artists_with_albums;

DROP TABLE IF EXISTS price;
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
  artist VARCHAR(255),
  id_artists INT4 REFERENCES artists(id) ON DELETE CASCADE,
  buy_price INT4,
  sell_price INT4
);

-- CREATE TABLE price (
--   id SERIAL4 PRIMARY KEY,
--   album_id INT4 REFERENCES albums(id) ON DELETE CASCADE,
--   buy_price INT4,
--   sell_price INT4
-- );