create table max_value_1048576 (c1 int);
\timing 
insert into max_value_1048576 select random()*1048576 from generate_series(1,10000000);
create index idx_bloom on max_value_1048576 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from max_value_1048576 where c1 = 223434;
SELECT pg_size_pretty( pg_relation_size('max_value_1048576'));
SELECT pg_size_pretty( pg_indexes_size('max_value_1048576'));
drop index idx_bloom;
drop table max_value_1048576;
