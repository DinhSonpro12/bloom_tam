create table column_25 (c1 int,c2 int,c3 int,c4 int,c5 int,c6 int,c7 int,c8 int,c9 int,c10 int,c11 int,c12 int,c13 int,c14 int,c15 int,c16 int,c17 int,c18 int,c19 int,c20 int,c21 int,c22 int,c23 int,c24 int,c25 int);
\timing 
insert into column_25 select random()*1000000000 from generate_series(1,1000000);
explain (analyze,verbose,timing,costs,buffers) select * from column_25 where c1 = 457946 AND c2 = 457946 AND c3 = 457946 AND c4 = 457946 AND c5 = 457946 AND c6 = 457946 AND c7 = 457946 AND c8 = 457946 AND c9 = 457946 AND c10 = 457946 AND c11 = 457946 AND c12 = 457946 AND c13 = 457946 AND c14 = 457946 AND c15 = 457946 AND c16 = 457946 AND c17 = 457946 AND c18 = 457946 AND c19 = 457946 AND c20 = 457946 AND c21 = 457946 AND c22 = 457946 AND c23 = 457946 AND c24 = 457946 AND c25 = 457946 ;
create index idx_bloom on column_25 (c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,c21,c22,c23,c24,c25);
SELECT pg_size_pretty( pg_relation_size('column_25'));
SELECT pg_size_pretty( pg_indexes_size('column_25'));
drop index idx_bloom;
drop table column_25;
