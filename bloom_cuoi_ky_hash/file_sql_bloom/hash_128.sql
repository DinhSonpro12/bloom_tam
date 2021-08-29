create table hash_128 (c1 int);
\timing 
insert into hash_128 select random()*1000000000 from generate_series(1,2000000);
create index idx_bloom on hash_128 using bloom (c1) WITH (col1=128);
explain (analyze,verbose,timing,costs,buffers) select * from hash_128 where c1 = 238063489;
explain (analyze,verbose,timing,costs,buffers) select * from hash_128 where c1 = 238063489;
explain (analyze,verbose,timing,costs,buffers) select * from hash_128 where c1 = 238063489;
explain (analyze,verbose,timing,costs,buffers) select * from hash_128 where c1 = 238063489;
explain (analyze,verbose,timing,costs,buffers) select * from hash_128 where c1 = 238063489;
explain (analyze,verbose,timing,costs,buffers) select * from hash_128 where c1 = 238063489;
explain (analyze,verbose,timing,costs,buffers) select * from hash_128 where c1 = 238063489;
explain (analyze,verbose,timing,costs,buffers) select * from hash_128 where c1 = 238063489;
explain (analyze,verbose,timing,costs,buffers) select * from hash_128 where c1 = 238063489;
explain (analyze,verbose,timing,costs,buffers) select * from hash_128 where c1 = 238063489;
explain (analyze,verbose,timing,costs,buffers) select * from hash_128 where c1 = 238063489;
explain (analyze,verbose,timing,costs,buffers) select * from hash_128 where c1 = 238063489;
explain (analyze,verbose,timing,costs,buffers) select * from hash_128 where c1 = 238063489;
explain (analyze,verbose,timing,costs,buffers) select * from hash_128 where c1 = 238063489;
explain (analyze,verbose,timing,costs,buffers) select * from hash_128 where c1 = 238063489;
explain (analyze,verbose,timing,costs,buffers) select * from hash_128 where c1 = 238063489;
explain (analyze,verbose,timing,costs,buffers) select * from hash_128 where c1 = 238063489;
explain (analyze,verbose,timing,costs,buffers) select * from hash_128 where c1 = 238063489;
explain (analyze,verbose,timing,costs,buffers) select * from hash_128 where c1 = 238063489;
explain (analyze,verbose,timing,costs,buffers) select * from hash_128 where c1 = 238063489;
explain (analyze,verbose,timing,costs,buffers) select * from hash_128 where c1 = 238063489;
explain (analyze,verbose,timing,costs,buffers) select * from hash_128 where c1 = 238063489;
explain (analyze,verbose,timing,costs,buffers) select * from hash_128 where c1 = 238063489;
explain (analyze,verbose,timing,costs,buffers) select * from hash_128 where c1 = 238063489;
explain (analyze,verbose,timing,costs,buffers) select * from hash_128 where c1 = 238063489;
explain (analyze,verbose,timing,costs,buffers) select * from hash_128 where c1 = 238063489;
explain (analyze,verbose,timing,costs,buffers) select * from hash_128 where c1 = 238063489;
explain (analyze,verbose,timing,costs,buffers) select * from hash_128 where c1 = 238063489;
explain (analyze,verbose,timing,costs,buffers) select * from hash_128 where c1 = 238063489;
explain (analyze,verbose,timing,costs,buffers) select * from hash_128 where c1 = 238063489;
SELECT pg_size_pretty( pg_relation_size('hash_128'));
SELECT pg_size_pretty( pg_indexes_size('hash_128'));
drop index idx_bloom;
drop table hash_128;