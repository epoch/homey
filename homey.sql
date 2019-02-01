CREATE DATABASE homey;

CREATE TABLE properties (
  id SERIAL PRIMARY KEY,
  description TEXT,
  address VARCHAR(600),
  image_url VARCHAR(600)
);

INSERT INTO properties (description, address, image_url)
VALUES ('great place', '45 william', 'https://imageresizer.static9.net.au/Jmf1UKbnuZjtVg-SqkR7RVETrYo=/400x0/http%3A%2F%2Fprod.static9.net.au%2F_%2Fmedia%2F2017%2F06%2F06%2F09%2F00%2Fmain.jpg');

CREATE TABLE applications (

);
