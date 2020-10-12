CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;

-------------------------------------------------------------
-- PLEASE DO NOT CHANGE ANY SQL STATEMENTS ABOVE THIS LINE --
-------------------------------------------------------------

-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT a.name AS name, b.size AS size FROM dogs AS a, sizes AS b WHERE b.min < a.height  AND a.height <= b.max;

-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT c.name FROM dogs AS c, parents AS b, dogs AS p WHERE c.name = b.child AND b.parent = p.name ORDER BY p.height DESC;

-- Filling out this helper table is optional
CREATE TABLE siblings AS
  SELECT a.name AS n1, b.name AS n2, c.size AS size FROM dogs AS a, dogs AS b, size_of_dogs AS c, parents AS d, parents AS e, size_of_dogs AS f WHERE a.name = d.child AND b.name = e.child AND d.parent = e.parent AND a.name = c.name AND a.name < b.name AND c.size = f.size AND b.name = f.name;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT n1 || " and " || n2 || " are " || size || " siblings" FROM siblings;

-- Ways to stack 4 dogs to a height of at least 170, ordered by total height
CREATE TABLE stacks_helper(dogs, stack_height, last_height);


-- Add your INSERT INTOs here

CREATE TABLE stacks AS
  SELECT a.name || ", " || b.name || ", " || c.name || ", " || d.name, (a.height + b.height + c.height + d.height) AS stack_height FROM dogs AS a, dogs AS b, dogs AS c, dogs AS d WHERE a.height < b.height AND b.height < c.height AND c.height < d.height AND stack_height >= 170 ORDER BY stack_height ASC;
