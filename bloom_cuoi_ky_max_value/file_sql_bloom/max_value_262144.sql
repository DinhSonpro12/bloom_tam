create table max_value_262144 (c1 int);
\timing 
insert into max_value_262144 select random()*262144 from generate_series(1,10000000);
create index idx_bloom on max_value_262144 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from max_value_262144 where c1 = 96532;
SELECT pg_size_pretty( pg_relation_size('max_value_262144'));
SELECT pg_size_pretty( pg_indexes_size('max_value_262144'));
drop index idx_bloom;
drop table max_value_262144;
