-- Write queries to return the following:
-- Make the following changes in the "world" database.

-- 1. Add Superman's hometown, Smallville, Kansas to the city table. The
-- countrycode is 'USA', and population of 45001.

BEGIN TRANSACTION;

INSERT INTO city ( name, district, countrycode, population) 
VALUES ('Smallville', 'Kansas', 'USA', 45001);

SELECT * FROM city
WHERE name = 'Smallville';

ROLLBACK;

-- 2. Add Kryptonese to the countrylanguage table. Kryptonese is spoken by 0.0001
-- percentage of the 'USA' population.
INSERT INTO countrylanguage ( countrycode, language, isofficial, percentage)
VALUES ('USA', 'Kryptonese', FALSE, 0.0001);

SELECT * FROM countrylanguage
WHERE language = 'Kryptonese';

-- 3. After heated debate, "Kryptonese" was renamed to "Krypto-babble." Change
-- the appropriate record accordingly.

UPDATE countrylanguage 
SET language= 'Krypto-babble'
WHERE language= 'Kryptonese';

SELECT * FROM countrylanguage
WHERE language = 'Krypto-babble';

-- 4. Set the US capital to Smallville, Kansas in the country table.
UPDATE country 
SET capital= ( SELECT id FROM city WHERE name = 'Smallville')
WHERE code= 'USA';

SELECT capital FROM country
WHERE code = 'USA';
-- 5. Delete Smallville, Kansas from the city table. (Did it succeed? Why?)
DELETE FROM city 
WHERE name= 'Smallville' and district = 'Kansas';

-- failed due to being referenced in other tables.
-- 6. Return the US capital to Washington.
UPDATE country 
SET capital= ( SELECT id FROM city WHERE name = 'Washington' and district='District of Columbia')
WHERE code= 'USA';

-- 7. Delete Smallville, Kansas from the city table. (Did it succeed? Why?)
DELETE FROM city 
WHERE name= 'Smallville' and district = 'Kansas';
-- 8. Reverse the "is the official language" setting for all languages where the
-- country's year of independence is within the range of 1800 and 1972
-- (exclusive).
-- (590 rows affected)
UPDATE countrylanguage
SET isofficial= NOT isofficial
WHERE countrycode IN (SELECT code FROM country WHERE indepyear BETWEEN 1800 AND 1972);
-- 9. Convert population so it is expressed in 1,000s for all cities. (Round up to
-- the nearest integer value.)
-- (4079 rows affected)
UPDATE city
SET population= ( population/ 1000 );
-- 10. Assuming a country's surfacearea is expressed in square miles, convert it to
-- square meters for all countries where French is spoken by more than 20% of the
-- population.
-- (7 rows affected)
UPDATE country
SET surfacearea = surfacearea * 2.59
WHERE code IN (SELECT  countrycode FROM countrylanguage WHERE language= 'French' AND percentage > 20);