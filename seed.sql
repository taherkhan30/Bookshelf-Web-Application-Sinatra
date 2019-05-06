DROP TABLE IF EXISTS book_titles;

CREATE TABLE book_titles (

  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  author VARCHAR(255)
);

INSERT INTO book_titles (title,author) VALUES ('book1', 'author 1');
INSERT INTO book_titles (title,author) VALUES ('book2', 'author 2');
INSERT INTO book_titles (title,author) VALUES ('book3', 'author 3');
INSERT INTO book_titles (title,author) VALUES ('book4', 'author 4');
INSERT INTO book_titles (title,author) VALUES ('book5', 'author 5');

-------------------
DROP TABLE IF EXISTS users;

CREATE TABLE users (

  id SERIAL PRIMARY KEY,
  member_id INTEGER REFERENCES book_titles (id),
  first_name VARCHAR(255),
  last_name VARCHAR(255)

);

INSERT INTO users (member_id,first_name,last_name) VALUES ('1', 'first_name','last_name');
INSERT INTO users (member_id,first_name,last_name) VALUES ('2', 'first_name','last_name');
INSERT INTO users (member_id,first_name,last_name) VALUES ('3', 'first_name','last_name');
