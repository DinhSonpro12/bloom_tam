create table hash_7 (c1 int);
\timing 
insert into hash_7 select random()*1000000000 from generate_series(1,1000000);
create index idx_bloom on hash_7 using bloom (c1) WITH (col1=7);
explain (analyze,verbose,timing,costs,buffers) select * from hash_7 where c1 = 38479297;
SELECT pg_size_pretty( pg_relation_size('hash_7'));
SELECT pg_size_pretty( pg_indexes_size('hash_7'));
drop index idx_bloom;
drop table hash_7;
