create table column_15 (c1 int,c2 int,c3 int,c4 int,c5 int,c6 int,c7 int,c8 int,c9 int,c10 int,c11 int,c12 int,c13 int,c14 int,c15 int);
\timing 
insert into column_15 select random()*1000000000 from generate_series(1,1000000);
explain (analyze,verbose,timing,costs,buffers) select * from column_15 where c1 = 457946 AND c2 = 457946 AND c3 = 457946 AND c4 = 457946 AND c5 = 457946 AND c6 = 457946 AND c7 = 457946 AND c8 = 457946 AND c9 = 457946 AND c10 = 457946 AND c11 = 457946 AND c12 = 457946 AND c13 = 457946 AND c14 = 457946 AND c15 = 457946 ;
create index idx_bloom on column_15 (c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15);
SELECT pg_size_pretty( pg_relation_size('column_15'));
SELECT pg_size_pretty( pg_indexes_size('column_15'));
drop index idx_bloom;
drop table column_15;
