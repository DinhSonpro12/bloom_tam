create table hash_256 (c1 int);
\timing 
insert into hash_256 select random()*1000000000 from generate_series(1,2000000);
create index idx_bloom on hash_256 using bloom (c1) WITH (col1=256);
explain (analyze,verbose,timing,costs,buffers) select * from hash_256 where c1 = 807106074;
explain (analyze,verbose,timing,costs,buffers) select * from hash_256 where c1 = 807106074;
explain (analyze,verbose,timing,costs,buffers) select * from hash_256 where c1 = 807106074;
explain (analyze,verbose,timing,costs,buffers) select * from hash_256 where c1 = 807106074;
explain (analyze,verbose,timing,costs,buffers) select * from hash_256 where c1 = 807106074;
explain (analyze,verbose,timing,costs,buffers) select * from hash_256 where c1 = 807106074;
explain (analyze,verbose,timing,costs,buffers) select * from hash_256 where c1 = 807106074;
explain (analyze,verbose,timing,costs,buffers) select * from hash_256 where c1 = 807106074;
explain (analyze,verbose,timing,costs,buffers) select * from hash_256 where c1 = 807106074;
explain (analyze,verbose,timing,costs,buffers) select * from hash_256 where c1 = 807106074;
explain (analyze,verbose,timing,costs,buffers) select * from hash_256 where c1 = 807106074;
explain (analyze,verbose,timing,costs,buffers) select * from hash_256 where c1 = 807106074;
explain (analyze,verbose,timing,costs,buffers) select * from hash_256 where c1 = 807106074;
explain (analyze,verbose,timing,costs,buffers) select * from hash_256 where c1 = 807106074;
explain (analyze,verbose,timing,costs,buffers) select * from hash_256 where c1 = 807106074;
explain (analyze,verbose,timing,costs,buffers) select * from hash_256 where c1 = 807106074;
explain (analyze,verbose,timing,costs,buffers) select * from hash_256 where c1 = 807106074;
explain (analyze,verbose,timing,costs,buffers) select * from hash_256 where c1 = 807106074;
explain (analyze,verbose,timing,costs,buffers) select * from hash_256 where c1 = 807106074;
explain (analyze,verbose,timing,costs,buffers) select * from hash_256 where c1 = 807106074;
explain (analyze,verbose,timing,costs,buffers) select * from hash_256 where c1 = 807106074;
explain (analyze,verbose,timing,costs,buffers) select * from hash_256 where c1 = 807106074;
explain (analyze,verbose,timing,costs,buffers) select * from hash_256 where c1 = 807106074;
explain (analyze,verbose,timing,costs,buffers) select * from hash_256 where c1 = 807106074;
explain (analyze,verbose,timing,costs,buffers) select * from hash_256 where c1 = 807106074;
explain (analyze,verbose,timing,costs,buffers) select * from hash_256 where c1 = 807106074;
explain (analyze,verbose,timing,costs,buffers) select * from hash_256 where c1 = 807106074;
explain (analyze,verbose,timing,costs,buffers) select * from hash_256 where c1 = 807106074;
explain (analyze,verbose,timing,costs,buffers) select * from hash_256 where c1 = 807106074;
explain (analyze,verbose,timing,costs,buffers) select * from hash_256 where c1 = 807106074;
SELECT pg_size_pretty( pg_relation_size('hash_256'));
SELECT pg_size_pretty( pg_indexes_size('hash_256'));
drop index idx_bloom;
drop table hash_256;
