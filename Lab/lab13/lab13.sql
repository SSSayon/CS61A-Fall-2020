.read data.sql


CREATE TABLE average_prices AS
  SELECT category, avg(MSRP) as average_price from products group by category;


CREATE TABLE lowest_prices AS
  SELECT store, item, min(price) as min_price from inventory group by item;


CREATE TABLE best_deal AS
  SELECT name, min(MSRP/rating) from products group by category;


CREATE TABLE shopping_list AS
  SELECT name, store from best_deal, lowest_prices where name == item;


CREATE TABLE each_bandwidth AS
  SELECT Mbs from stores as a, shopping_list as b where a.store == b.store; 

CREATE TABLE total_bandwidth AS
  SELECT sum(Mbs) from each_bandwidth;

