create table max_value_4194304 (c1 int);
\timing 
insert into max_value_4194304 select random()*4194304 from generate_series(1,10000000);
create index idx_bloom on max_value_4194304 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from max_value_4194304 where c1 = 808613;
SELECT pg_size_pretty( pg_relation_size('max_value_4194304'));
SELECT pg_size_pretty( pg_indexes_size('max_value_4194304'));
drop index idx_bloom;
drop table max_value_4194304;
