create table max_value_32768 (c1 int);
\timing 
insert into max_value_32768 select random()*32768 from generate_series(1,10000000);
create index idx_bloom on max_value_32768 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from max_value_32768 where c1 = 11684;
SELECT pg_size_pretty( pg_relation_size('max_value_32768'));
SELECT pg_size_pretty( pg_indexes_size('max_value_32768'));
drop index idx_bloom;
drop table max_value_32768;
