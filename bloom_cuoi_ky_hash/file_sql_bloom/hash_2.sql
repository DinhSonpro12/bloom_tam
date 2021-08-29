create table hash_2 (c1 int);
\timing 
insert into hash_2 select random()*1000000000 from generate_series(1,1000000);
create index idx_bloom on hash_2 using bloom (c1) WITH (col1=2);
explain (analyze,verbose,timing,costs,buffers) select * from hash_2 where c1 = 869773565;
SELECT pg_size_pretty( pg_relation_size('hash_2'));
SELECT pg_size_pretty( pg_indexes_size('hash_2'));
drop index idx_bloom;
drop table hash_2;
