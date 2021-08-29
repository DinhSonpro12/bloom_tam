create table hash_8 (c1 int);
\timing 
insert into hash_8 select random()*1000000000 from generate_series(1,1000000);
create index idx_bloom on hash_8 using bloom (c1) WITH (col1=8);
explain (analyze,verbose,timing,costs,buffers) select * from hash_8 where c1 = 541135689;
SELECT pg_size_pretty( pg_relation_size('hash_8'));
SELECT pg_size_pretty( pg_indexes_size('hash_8'));
drop index idx_bloom;
drop table hash_8;
