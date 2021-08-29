create table hash_4 (c1 int);
\timing 
insert into hash_4 select random()*1000000000 from generate_series(1,1000000);
create index idx_bloom on hash_4 using bloom (c1) WITH (col1=4);
explain (analyze,verbose,timing,costs,buffers) select * from hash_4 where c1 = 186043679;
SELECT pg_size_pretty( pg_relation_size('hash_4'));
SELECT pg_size_pretty( pg_indexes_size('hash_4'));
drop index idx_bloom;
drop table hash_4;
