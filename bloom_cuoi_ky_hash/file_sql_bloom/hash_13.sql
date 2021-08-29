create table hash_13 (c1 int);
\timing 
insert into hash_13 select random()*1000000000 from generate_series(1,1000000);
create index idx_bloom on hash_13 using bloom (c1) WITH (col1=13);
explain (analyze,verbose,timing,costs,buffers) select * from hash_13 where c1 = 842141518;
SELECT pg_size_pretty( pg_relation_size('hash_13'));
SELECT pg_size_pretty( pg_indexes_size('hash_13'));
drop index idx_bloom;
drop table hash_13;
