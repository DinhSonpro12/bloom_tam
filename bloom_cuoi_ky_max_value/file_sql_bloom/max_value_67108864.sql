create table max_value_67108864 (c1 int);
\timing 
insert into max_value_67108864 select random()*67108864 from generate_series(1,10000000);
create index idx_bloom on max_value_67108864 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from max_value_67108864 where c1 = 35762206;
SELECT pg_size_pretty( pg_relation_size('max_value_67108864'));
SELECT pg_size_pretty( pg_indexes_size('max_value_67108864'));
drop index idx_bloom;
drop table max_value_67108864;
