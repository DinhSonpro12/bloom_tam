create table max_value_268435456 (c1 int);
\timing 
insert into max_value_268435456 select random()*268435456 from generate_series(1,10000000);
create index idx_bloom on max_value_268435456 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from max_value_268435456 where c1 = 196094810;
SELECT pg_size_pretty( pg_relation_size('max_value_268435456'));
SELECT pg_size_pretty( pg_indexes_size('max_value_268435456'));
drop index idx_bloom;
drop table max_value_268435456;
