create table hash_11 (c1 int);
\timing 
insert into hash_11 select random()*1000000000 from generate_series(1,1000000);
create index idx_bloom on hash_11 using bloom (c1) WITH (col1=11);
explain (analyze,verbose,timing,costs,buffers) select * from hash_11 where c1 = 81944785;
SELECT pg_size_pretty( pg_relation_size('hash_11'));
SELECT pg_size_pretty( pg_indexes_size('hash_11'));
drop index idx_bloom;
drop table hash_11;
