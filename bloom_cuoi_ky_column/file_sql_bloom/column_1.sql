create table column_1 (c1 int);
\timing 
insert into column_1 select random()*1000000000 from generate_series(1,1000000);
create index idx_bloom on column_1 using bloom (c1) WITH (col1 = 2);
explain (analyze,verbose,timing,costs,buffers) select * from column_1 where c1 = 457946 ;
SELECT pg_size_pretty( pg_relation_size('column_1'));
SELECT pg_size_pretty( pg_indexes_size('column_1'));
drop index idx_bloom;
drop table column_1;
