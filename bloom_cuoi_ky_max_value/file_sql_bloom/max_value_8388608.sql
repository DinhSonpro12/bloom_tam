create table max_value_8388608 (c1 int);
\timing 
insert into max_value_8388608 select random()*8388608 from generate_series(1,10000000);
create index idx_bloom on max_value_8388608 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from max_value_8388608 where c1 = 2779;
SELECT pg_size_pretty( pg_relation_size('max_value_8388608'));
SELECT pg_size_pretty( pg_indexes_size('max_value_8388608'));
drop index idx_bloom;
drop table max_value_8388608;
