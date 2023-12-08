CREATE TABLE person (
	name 		text,
	age			int4,
	location 	point
);

INSERT INTO person VALUES (mike, 40, (3.1,6.2)), (joe, 20, (5.5,2.5)), (sally, 34, (3.8,45.8)), (sandra, 19, (9.345,09.6)), (alex, 30, (1.352,8.2)), (sue, 50, (8.34,7.375)), (denise, 24, (3.78,87.90)), (sarah, 88, (8.4,2.3)), (teresa, 38, (7.7,1.8)), (nan, 28, (6.35,0.43)), (leah, 68, (0.6,3.37)), (wendy, 78, (2.62,03.3)), (melissa, 28, (3.089,087.23)), (joan, 18, (9.4,47.04)), (mary, 08, (3.7,39.20)), (jane, 58, (1.34,0.44)), (liza, 38, (9.76,6.90)), (jean, 28, (8.561,7.3)), (jenifer, 38, (6.6,23.3)), (juanita, 58, (4.57,35.8)), (susan, 78, (6.579,3)), (zena, 98, (0.35,0)), (martie, 88, (8.358,.93)), (chris, 78, (9.78,2)), (pat, 18, (1.19,0.6)), (zola, 58, (2.56,4.3)), (louise, 98, (5.0,8.7)), (edna, 18, (1.53,3.5)), (bertha, 88, (2.75,9.4)), (sumi, 38, (1.15,0.6)), (koko, 88, (1.7,5.5)), (gina, 18, (9.82,7.5)), (rean, 48, (8.5,5.0)), (sharon, 78, (9.237,8.8)), (paula, 68, (0.5,0.5)), (julie, 68, (3.6,7.2)), (belinda, 38, (8.9,1.7)), (karen, 48, (8.73,0.0)), (carina, 58, (4.27,8.8)), (diane, 18, (5.912,5.3)), (esther, 98, (5.36,7.6)), (trudy, 88, (6.01,0.5)), (fanny, 08, (1.2,0.9)), (carmen, 78, (3.8,8.2)), (lita, 25, (1.3,8.7)), (pamela, 48, (8.21,9.3)), (sandy, 38, (3.8,0.2)), (trisha, 88, (1.29,2.2)), (uma, 78, (9.73,6.4)), (velma, 68, (8.8,8.9));

VACUUM ANALYZE person;

CREATE TABLE student (
	gpa 		float8
) INHERITS (person);

INSERT INTO student VALUES (fred, 28, (3.1,-1.5), 3.70000000000000020e+00), (larry, 60, (21.8,4.9), 3.10000000000000010e+00);

VACUUM ANALYZE student;