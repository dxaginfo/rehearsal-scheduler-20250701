CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255) UNIQUE,
  password_hash VARCHAR(255),
  profile_image TEXT
);
CREATE TABLE bands (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  owner_id INTEGER REFERENCES users(id)
);
CREATE TABLE bandmembers (
  id SERIAL PRIMARY KEY,
  band_id INTEGER REFERENCES bands(id),
  user_id INTEGER REFERENCES users(id),
  role VARCHAR(100)
);
CREATE TABLE events (
  id SERIAL PRIMARY KEY,
  band_id INTEGER REFERENCES bands(id),
  datetime TIMESTAMP,
  location VARCHAR(255),
  type VARCHAR(50),
  notes TEXT
);
CREATE TABLE attendance (
  id SERIAL PRIMARY KEY,
  event_id INTEGER REFERENCES events(id),
  user_id INTEGER REFERENCES users(id),
  status VARCHAR(50)
);
CREATE TABLE messages (
  id SERIAL PRIMARY KEY,
  band_id INTEGER REFERENCES bands(id),
  user_id INTEGER REFERENCES users(id),
  content TEXT,
  created_at TIMESTAMP
);
CREATE TABLE setlists (
  id SERIAL PRIMARY KEY,
  band_id INTEGER REFERENCES bands(id),
  name VARCHAR(255),
  description TEXT
);
CREATE TABLE setlistsongs (
  id SERIAL PRIMARY KEY,
  setlist_id INTEGER REFERENCES setlists(id),
  title VARCHAR(255),
  "order" INTEGER,
  spotify_url TEXT,
  bandcamp_url TEXT,
  soundcloud_url TEXT
);