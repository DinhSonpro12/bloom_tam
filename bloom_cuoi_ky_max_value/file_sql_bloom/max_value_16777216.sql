create table max_value_16777216 (c1 int);
\timing 
insert into max_value_16777216 select random()*16777216 from generate_series(1,10000000);
create index idx_bloom on max_value_16777216 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from max_value_16777216 where c1 = 7168807;
SELECT pg_size_pretty( pg_relation_size('max_value_16777216'));
SELECT pg_size_pretty( pg_indexes_size('max_value_16777216'));
drop index idx_bloom;
drop table max_value_16777216;
