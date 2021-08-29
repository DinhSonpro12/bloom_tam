create table column_2 (c1 int,c2 int);
\timing 
insert into column_2 select random()*1000000000 from generate_series(1,1000000);
explain (analyze,verbose,timing,costs,buffers) select * from column_2 where c1 = 457946 AND c2 = 457946 ;
create index idx_bloom on column_2 (c1,c2);
SELECT pg_size_pretty( pg_relation_size('column_2'));
SELECT pg_size_pretty( pg_indexes_size('column_2'));
drop index idx_bloom;
drop table column_2;
