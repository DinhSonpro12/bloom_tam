create table hash_6 (c1 int);
\timing 
insert into hash_6 select random()*1000000000 from generate_series(1,1000000);
create index idx_bloom on hash_6 using bloom (c1) WITH (col1=6);
explain (analyze,verbose,timing,costs,buffers) select * from hash_6 where c1 = 460618557;
SELECT pg_size_pretty( pg_relation_size('hash_6'));
SELECT pg_size_pretty( pg_indexes_size('hash_6'));
drop index idx_bloom;
drop table hash_6;
