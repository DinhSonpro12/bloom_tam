create table hash_64 (c1 int);
\timing 
insert into hash_64 select random()*1000000000 from generate_series(1,2000000);
create index idx_bloom on hash_64 using bloom (c1) WITH (col1=64);
explain (analyze,verbose,timing,costs,buffers) select * from hash_64 where c1 = 648996965;
explain (analyze,verbose,timing,costs,buffers) select * from hash_64 where c1 = 648996965;
explain (analyze,verbose,timing,costs,buffers) select * from hash_64 where c1 = 648996965;
explain (analyze,verbose,timing,costs,buffers) select * from hash_64 where c1 = 648996965;
explain (analyze,verbose,timing,costs,buffers) select * from hash_64 where c1 = 648996965;
explain (analyze,verbose,timing,costs,buffers) select * from hash_64 where c1 = 648996965;
explain (analyze,verbose,timing,costs,buffers) select * from hash_64 where c1 = 648996965;
explain (analyze,verbose,timing,costs,buffers) select * from hash_64 where c1 = 648996965;
explain (analyze,verbose,timing,costs,buffers) select * from hash_64 where c1 = 648996965;
explain (analyze,verbose,timing,costs,buffers) select * from hash_64 where c1 = 648996965;
explain (analyze,verbose,timing,costs,buffers) select * from hash_64 where c1 = 648996965;
explain (analyze,verbose,timing,costs,buffers) select * from hash_64 where c1 = 648996965;
explain (analyze,verbose,timing,costs,buffers) select * from hash_64 where c1 = 648996965;
explain (analyze,verbose,timing,costs,buffers) select * from hash_64 where c1 = 648996965;
explain (analyze,verbose,timing,costs,buffers) select * from hash_64 where c1 = 648996965;
explain (analyze,verbose,timing,costs,buffers) select * from hash_64 where c1 = 648996965;
explain (analyze,verbose,timing,costs,buffers) select * from hash_64 where c1 = 648996965;
explain (analyze,verbose,timing,costs,buffers) select * from hash_64 where c1 = 648996965;
explain (analyze,verbose,timing,costs,buffers) select * from hash_64 where c1 = 648996965;
explain (analyze,verbose,timing,costs,buffers) select * from hash_64 where c1 = 648996965;
explain (analyze,verbose,timing,costs,buffers) select * from hash_64 where c1 = 648996965;
explain (analyze,verbose,timing,costs,buffers) select * from hash_64 where c1 = 648996965;
explain (analyze,verbose,timing,costs,buffers) select * from hash_64 where c1 = 648996965;
explain (analyze,verbose,timing,costs,buffers) select * from hash_64 where c1 = 648996965;
explain (analyze,verbose,timing,costs,buffers) select * from hash_64 where c1 = 648996965;
explain (analyze,verbose,timing,costs,buffers) select * from hash_64 where c1 = 648996965;
explain (analyze,verbose,timing,costs,buffers) select * from hash_64 where c1 = 648996965;
explain (analyze,verbose,timing,costs,buffers) select * from hash_64 where c1 = 648996965;
explain (analyze,verbose,timing,costs,buffers) select * from hash_64 where c1 = 648996965;
explain (analyze,verbose,timing,costs,buffers) select * from hash_64 where c1 = 648996965;
SELECT pg_size_pretty( pg_relation_size('hash_64'));
SELECT pg_size_pretty( pg_indexes_size('hash_64'));
drop index idx_bloom;
drop table hash_64;
