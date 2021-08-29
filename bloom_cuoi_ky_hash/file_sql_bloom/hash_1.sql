create table hash_1 (c1 int);
\timing 
insert into hash_1 select random()*1000000000 from generate_series(1,1000000);
create index idx_bloom on hash_1 using bloom (c1) WITH (col1=1);
explain (analyze,verbose,timing,costs,buffers) select * from hash_1 where c1 = 354326179;
SELECT pg_size_pretty( pg_relation_size('hash_1'));
SELECT pg_size_pretty( pg_indexes_size('hash_1'));
drop index idx_bloom;
drop table hash_1;
