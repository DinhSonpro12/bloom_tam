create table max_value_1073741824 (c1 int);
\timing 
insert into max_value_1073741824 select random()*1073741824 from generate_series(1,10000000);
create index idx_bloom on max_value_1073741824 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from max_value_1073741824 where c1 = 629521586;
SELECT pg_size_pretty( pg_relation_size('max_value_1073741824'));
SELECT pg_size_pretty( pg_indexes_size('max_value_1073741824'));
drop index idx_bloom;
drop table max_value_1073741824;
