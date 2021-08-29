create table hash_14 (c1 int);
\timing 
insert into hash_14 select random()*1000000000 from generate_series(1,1000000);
create index idx_bloom on hash_14 using bloom (c1) WITH (col1=14);
explain (analyze,verbose,timing,costs,buffers) select * from hash_14 where c1 = 156353991;
SELECT pg_size_pretty( pg_relation_size('hash_14'));
SELECT pg_size_pretty( pg_indexes_size('hash_14'));
drop index idx_bloom;
drop table hash_14;
