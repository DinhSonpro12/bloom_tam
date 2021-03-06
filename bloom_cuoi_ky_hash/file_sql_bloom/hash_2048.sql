create table hash_2048 (c1 int);
\timing 
insert into hash_2048 select random()*1000000000 from generate_series(1,2000000);
create index idx_bloom on hash_2048 using bloom (c1) WITH (col1=2048);
explain (analyze,verbose,timing,costs,buffers) select * from hash_2048 where c1 = 716052871;
explain (analyze,verbose,timing,costs,buffers) select * from hash_2048 where c1 = 716052871;
explain (analyze,verbose,timing,costs,buffers) select * from hash_2048 where c1 = 716052871;
explain (analyze,verbose,timing,costs,buffers) select * from hash_2048 where c1 = 716052871;
explain (analyze,verbose,timing,costs,buffers) select * from hash_2048 where c1 = 716052871;
explain (analyze,verbose,timing,costs,buffers) select * from hash_2048 where c1 = 716052871;
explain (analyze,verbose,timing,costs,buffers) select * from hash_2048 where c1 = 716052871;
explain (analyze,verbose,timing,costs,buffers) select * from hash_2048 where c1 = 716052871;
explain (analyze,verbose,timing,costs,buffers) select * from hash_2048 where c1 = 716052871;
explain (analyze,verbose,timing,costs,buffers) select * from hash_2048 where c1 = 716052871;
explain (analyze,verbose,timing,costs,buffers) select * from hash_2048 where c1 = 716052871;
explain (analyze,verbose,timing,costs,buffers) select * from hash_2048 where c1 = 716052871;
explain (analyze,verbose,timing,costs,buffers) select * from hash_2048 where c1 = 716052871;
explain (analyze,verbose,timing,costs,buffers) select * from hash_2048 where c1 = 716052871;
explain (analyze,verbose,timing,costs,buffers) select * from hash_2048 where c1 = 716052871;
explain (analyze,verbose,timing,costs,buffers) select * from hash_2048 where c1 = 716052871;
explain (analyze,verbose,timing,costs,buffers) select * from hash_2048 where c1 = 716052871;
explain (analyze,verbose,timing,costs,buffers) select * from hash_2048 where c1 = 716052871;
explain (analyze,verbose,timing,costs,buffers) select * from hash_2048 where c1 = 716052871;
explain (analyze,verbose,timing,costs,buffers) select * from hash_2048 where c1 = 716052871;
explain (analyze,verbose,timing,costs,buffers) select * from hash_2048 where c1 = 716052871;
explain (analyze,verbose,timing,costs,buffers) select * from hash_2048 where c1 = 716052871;
explain (analyze,verbose,timing,costs,buffers) select * from hash_2048 where c1 = 716052871;
explain (analyze,verbose,timing,costs,buffers) select * from hash_2048 where c1 = 716052871;
explain (analyze,verbose,timing,costs,buffers) select * from hash_2048 where c1 = 716052871;
explain (analyze,verbose,timing,costs,buffers) select * from hash_2048 where c1 = 716052871;
explain (analyze,verbose,timing,costs,buffers) select * from hash_2048 where c1 = 716052871;
explain (analyze,verbose,timing,costs,buffers) select * from hash_2048 where c1 = 716052871;
explain (analyze,verbose,timing,costs,buffers) select * from hash_2048 where c1 = 716052871;
explain (analyze,verbose,timing,costs,buffers) select * from hash_2048 where c1 = 716052871;
SELECT pg_size_pretty( pg_relation_size('hash_2048'));
SELECT pg_size_pretty( pg_indexes_size('hash_2048'));
drop index idx_bloom;
drop table hash_2048;
