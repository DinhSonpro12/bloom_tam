create table max_value_2097152 (c1 int);
\timing 
insert into max_value_2097152 select random()*2097152 from generate_series(1,10000000);
create index idx_bloom on max_value_2097152 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from max_value_2097152 where c1 = 1779727;
SELECT pg_size_pretty( pg_relation_size('max_value_2097152'));
SELECT pg_size_pretty( pg_indexes_size('max_value_2097152'));
drop index idx_bloom;
drop table max_value_2097152;
