create table hash_12 (c1 int);
\timing 
insert into hash_12 select random()*1000000000 from generate_series(1,1000000);
create index idx_bloom on hash_12 using bloom (c1) WITH (col1=12);
explain (analyze,verbose,timing,costs,buffers) select * from hash_12 where c1 = 266450511;
SELECT pg_size_pretty( pg_relation_size('hash_12'));
SELECT pg_size_pretty( pg_indexes_size('hash_12'));
drop index idx_bloom;
drop table hash_12;
