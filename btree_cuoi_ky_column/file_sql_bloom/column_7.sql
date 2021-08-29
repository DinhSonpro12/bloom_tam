create table column_7 (c1 int,c2 int,c3 int,c4 int,c5 int,c6 int,c7 int);
\timing 
insert into column_7 select random()*1000000000 from generate_series(1,1000000);
explain (analyze,verbose,timing,costs,buffers) select * from column_7 where c1 = 457946 AND c2 = 457946 AND c3 = 457946 AND c4 = 457946 AND c5 = 457946 AND c6 = 457946 AND c7 = 457946 ;
create index idx_bloom on column_7 (c1,c2,c3,c4,c5,c6,c7);
SELECT pg_size_pretty( pg_relation_size('column_7'));
SELECT pg_size_pretty( pg_indexes_size('column_7'));
drop index idx_bloom;
drop table column_7;
