create table hash_5 (c1 int);
\timing 
insert into hash_5 select random()*1000000000 from generate_series(1,1000000);
create index idx_bloom on hash_5 using bloom (c1) WITH (col1=5);
explain (analyze,verbose,timing,costs,buffers) select * from hash_5 where c1 = 209924742;
SELECT pg_size_pretty( pg_relation_size('hash_5'));
SELECT pg_size_pretty( pg_indexes_size('hash_5'));
drop index idx_bloom;
drop table hash_5;
