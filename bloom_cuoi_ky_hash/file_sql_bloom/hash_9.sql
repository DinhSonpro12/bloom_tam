create table hash_9 (c1 int);
\timing 
insert into hash_9 select random()*1000000000 from generate_series(1,1000000);
create index idx_bloom on hash_9 using bloom (c1) WITH (col1=9);
explain (analyze,verbose,timing,costs,buffers) select * from hash_9 where c1 = 527876083;
SELECT pg_size_pretty( pg_relation_size('hash_9'));
SELECT pg_size_pretty( pg_indexes_size('hash_9'));
drop index idx_bloom;
drop table hash_9;
