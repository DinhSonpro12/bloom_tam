create table max_value_33554432 (c1 int);
\timing 
insert into max_value_33554432 select random()*33554432 from generate_series(1,10000000);
create index idx_bloom on max_value_33554432 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from max_value_33554432 where c1 = 17397691;
SELECT pg_size_pretty( pg_relation_size('max_value_33554432'));
SELECT pg_size_pretty( pg_indexes_size('max_value_33554432'));
drop index idx_bloom;
drop table max_value_33554432;
