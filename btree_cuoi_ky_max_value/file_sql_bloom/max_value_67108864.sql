create table max_value_67108864 (c1 int);
\timing 
insert into max_value_67108864 select random()*67108864 from generate_series(1,10000000);
explain (analyze,verbose,timing,costs,buffers) select * from max_value_67108864 where c1 = 34175617;
create index idx_btree on max_value_67108864 (c1);
SELECT pg_size_pretty( pg_relation_size('max_value_67108864'));
SELECT pg_size_pretty( pg_indexes_size('max_value_67108864'));
drop index idx_btree;
drop table max_value_67108864;
