-- LET:FROM https://github.com/postgres/postgres/blob/master/src/test/regress/sql/aggregates.sql
-- LET:CHANGE By HAND

\getenv abs_srcdir PG_ABS_SRCDIR

-- avoid bit-exact output here because operations may not be bit-exact.
SET extra_float_digits = 0;

-- prepare some test data
CREATE TABLE aggtest (
	a 			int2,
	b			float4
);

INSERT INTO aggtest VALUES (56, 7.8), (100, 99.097), (0, 0.09561), (42, 324.78);

ANALYZE aggtest;

CREATE TABLE onek (
	unique1		int4,
	unique2		int4,
	two			int4,
	four		int4,
	ten			int4,
	twenty		int4,
	hundred		int4,
	thousand	int4,
	twothousand	int4,
	fivethous	int4,
	tenthous	int4,
	odd			int4,
	even		int4,
	stringu1	name,
	stringu2	name,
	string4		name
);

INSERT INTO onek VALUES (226, 14, 0, 2, 6, 6, 6, 26, 26, 226, 226, 12, 13, SIAAAA, OAAAAA, OOOOxx), (774, 15, 0, 2, 4, 14, 4, 74, 174, 274, 774, 8, 9, UDAAAA, PAAAAA, VVVVxx), (298, 16, 0, 2, 8, 18, 8, 98, 98, 298, 298, 16, 17, MLAAAA, QAAAAA, AAAAxx), (682, 17, 0, 2, 2, 2, 2, 82, 82, 182, 682, 4, 5, GAAAAA, RAAAAA, HHHHxx), (864, 18, 0, 0, 4, 4, 4, 64, 64, 364, 864, 8, 9, GHAAAA, SAAAAA, OOOOxx), (183, 19, 1, 3, 3, 3, 3, 83, 183, 183, 183, 6, 7, BHAAAA, TAAAAA, VVVVxx), (885, 20, 1, 1, 5, 5, 5, 85, 85, 385, 885, 10, 11, BIAAAA, UAAAAA, AAAAxx), (555, 38, 1, 3, 5, 15, 5, 55, 155, 55, 555, 10, 11, JVAAAA, MBAAAA, OOOOxx), (746, 39, 0, 2, 6, 6, 6, 46, 146, 246, 746, 12, 13, SCAAAA, NBAAAA, VVVVxx), (558, 40, 0, 2, 8, 18, 8, 58, 158, 58, 558, 16, 17, MVAAAA, OBAAAA, AAAAxx), (574, 41, 0, 2, 4, 14, 4, 74, 174, 74, 574, 8, 9, CWAAAA, PBAAAA, HHHHxx), (343, 42, 1, 3, 3, 3, 3, 43, 143, 343, 343, 6, 7, FNAAAA, QBAAAA, OOOOxx), (120, 43, 0, 0, 0, 0, 0, 20, 120, 120, 120, 0, 1, QEAAAA, RBAAAA, VVVVxx), (461, 44, 1, 1, 1, 1, 1, 61, 61, 461, 461, 2, 3, TRAAAA, SBAAAA, AAAAxx), (754, 45, 0, 2, 4, 14, 4, 54, 154, 254, 754, 8, 9, ADAAAA, TBAAAA, HHHHxx), (772, 46, 0, 0, 2, 12, 2, 72, 172, 272, 772, 4, 5, SDAAAA, UBAAAA, OOOOxx), (749, 47, 1, 1, 9, 9, 9, 49, 149, 249, 749, 18, 19, VCAAAA, VBAAAA, VVVVxx), (771, 50, 1, 3, 1, 11, 1, 71, 171, 271, 771, 2, 3, RDAAAA, YBAAAA, OOOOxx), (470, 51, 0, 2, 0, 10, 0, 70, 70, 470, 470, 0, 1, CSAAAA, ZBAAAA, VVVVxx), (238, 52, 0, 2, 8, 18, 8, 38, 38, 238, 238, 16, 17, EJAAAA, ACAAAA, AAAAxx), (86, 53, 0, 2, 6, 6, 6, 86, 86, 86, 86, 12, 13, IDAAAA, BCAAAA, HHHHxx), (56, 54, 0, 0, 6, 16, 6, 56, 56, 56, 56, 12, 13, ECAAAA, CCAAAA, OOOOxx), (946, 60, 0, 2, 6, 6, 6, 46, 146, 446, 946, 12, 13, KKAAAA, ICAAAA, AAAAxx), (863, 61, 1, 3, 3, 3, 3, 63, 63, 363, 863, 6, 7, FHAAAA, JCAAAA, HHHHxx), (913, 62, 1, 1, 3, 13, 3, 13, 113, 413, 913, 6, 7, DJAAAA, KCAAAA, OOOOxx), (737, 63, 1, 1, 7, 17, 7, 37, 137, 237, 737, 14, 15, JCAAAA, LCAAAA, VVVVxx), (65, 64, 1, 1, 5, 5, 5, 65, 65, 65, 65, 10, 11, NCAAAA, MCAAAA, AAAAxx), (971, 67, 1, 3, 1, 11, 1, 71, 171, 471, 971, 2, 3, JLAAAA, PCAAAA, VVVVxx), (775, 68, 1, 3, 5, 15, 5, 75, 175, 275, 775, 10, 11, VDAAAA, QCAAAA, AAAAxx), (872, 74, 0, 0, 2, 12, 2, 72, 72, 372, 872, 4, 5, OHAAAA, WCAAAA, OOOOxx), (397, 75, 1, 1, 7, 17, 7, 97, 197, 397, 397, 14, 15, HPAAAA, XCAAAA, VVVVxx), (51, 76, 1, 3, 1, 11, 1, 51, 51, 51, 51, 2, 3, ZBAAAA, YCAAAA, AAAAxx), (562, 82, 0, 2, 2, 2, 2, 62, 162, 62, 562, 4, 5, QVAAAA, EDAAAA, OOOOxx), (681, 83, 1, 1, 1, 1, 1, 81, 81, 181, 681, 2, 3, FAAAAA, FDAAAA, VVVVxx), (585, 84, 1, 1, 5, 5, 5, 85, 185, 85, 585, 10, 11, NWAAAA, GDAAAA, AAAAxx), (35, 85, 1, 3, 5, 15, 5, 35, 35, 35, 35, 10, 11, JBAAAA, HDAAAA, HHHHxx), (962, 86, 0, 2, 2, 2, 2, 62, 162, 462, 962, 4, 5, ALAAAA, IDAAAA, OOOOxx), (282, 87, 0, 2, 2, 2, 2, 82, 82, 282, 282, 4, 5, WKAAAA, JDAAAA, VVVVxx), (254, 88, 0, 2, 4, 14, 4, 54, 54, 254, 254, 8, 9, UJAAAA, KDAAAA, AAAAxx);

SELECT avg(four) AS avg_1 FROM onek;
SELECT avg(a) AS avg_32 FROM aggtest WHERE a < 100;
