create table hash_10 (c1 int);
\timing 
insert into hash_10 select random()*1000000000 from generate_series(1,1000000);
create index idx_bloom on hash_10 using bloom (c1) WITH (col1=10);
explain (analyze,verbose,timing,costs,buffers) select * from hash_10 where c1 = 584503336;
SELECT pg_size_pretty( pg_relation_size('hash_10'));
SELECT pg_size_pretty( pg_indexes_size('hash_10'));
drop index idx_bloom;
drop table hash_10;
