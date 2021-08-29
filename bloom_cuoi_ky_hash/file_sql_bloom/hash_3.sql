create table hash_3 (c1 int);
\timing 
insert into hash_3 select random()*1000000000 from generate_series(1,1000000);
create index idx_bloom on hash_3 using bloom (c1) WITH (col1=3);
explain (analyze,verbose,timing,costs,buffers) select * from hash_3 where c1 = 604512089;
SELECT pg_size_pretty( pg_relation_size('hash_3'));
SELECT pg_size_pretty( pg_indexes_size('hash_3'));
drop index idx_bloom;
drop table hash_3;
