create table max_value_65536 (c1 int);
\timing 
insert into max_value_65536 select random()*65536 from generate_series(1,10000000);
explain (analyze,verbose,timing,costs,buffers) select * from max_value_65536 where c1 = 44183;
create index idx_btree on max_value_65536 (c1);
SELECT pg_size_pretty( pg_relation_size('max_value_65536'));
SELECT pg_size_pretty( pg_indexes_size('max_value_65536'));
drop index idx_btree;
drop table max_value_65536;
