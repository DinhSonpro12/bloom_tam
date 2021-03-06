create table hash_32 (c1 int);
\timing 
insert into hash_32 select random()*1000000000 from generate_series(1,2000000);
create index idx_bloom on hash_32 using bloom (c1) WITH (col1=32);
explain (analyze,verbose,timing,costs,buffers) select * from hash_32 where c1 = 693220100;
explain (analyze,verbose,timing,costs,buffers) select * from hash_32 where c1 = 693220100;
explain (analyze,verbose,timing,costs,buffers) select * from hash_32 where c1 = 693220100;
explain (analyze,verbose,timing,costs,buffers) select * from hash_32 where c1 = 693220100;
explain (analyze,verbose,timing,costs,buffers) select * from hash_32 where c1 = 693220100;
explain (analyze,verbose,timing,costs,buffers) select * from hash_32 where c1 = 693220100;
explain (analyze,verbose,timing,costs,buffers) select * from hash_32 where c1 = 693220100;
explain (analyze,verbose,timing,costs,buffers) select * from hash_32 where c1 = 693220100;
explain (analyze,verbose,timing,costs,buffers) select * from hash_32 where c1 = 693220100;
explain (analyze,verbose,timing,costs,buffers) select * from hash_32 where c1 = 693220100;
explain (analyze,verbose,timing,costs,buffers) select * from hash_32 where c1 = 693220100;
explain (analyze,verbose,timing,costs,buffers) select * from hash_32 where c1 = 693220100;
explain (analyze,verbose,timing,costs,buffers) select * from hash_32 where c1 = 693220100;
explain (analyze,verbose,timing,costs,buffers) select * from hash_32 where c1 = 693220100;
explain (analyze,verbose,timing,costs,buffers) select * from hash_32 where c1 = 693220100;
explain (analyze,verbose,timing,costs,buffers) select * from hash_32 where c1 = 693220100;
explain (analyze,verbose,timing,costs,buffers) select * from hash_32 where c1 = 693220100;
explain (analyze,verbose,timing,costs,buffers) select * from hash_32 where c1 = 693220100;
explain (analyze,verbose,timing,costs,buffers) select * from hash_32 where c1 = 693220100;
explain (analyze,verbose,timing,costs,buffers) select * from hash_32 where c1 = 693220100;
explain (analyze,verbose,timing,costs,buffers) select * from hash_32 where c1 = 693220100;
explain (analyze,verbose,timing,costs,buffers) select * from hash_32 where c1 = 693220100;
explain (analyze,verbose,timing,costs,buffers) select * from hash_32 where c1 = 693220100;
explain (analyze,verbose,timing,costs,buffers) select * from hash_32 where c1 = 693220100;
explain (analyze,verbose,timing,costs,buffers) select * from hash_32 where c1 = 693220100;
explain (analyze,verbose,timing,costs,buffers) select * from hash_32 where c1 = 693220100;
explain (analyze,verbose,timing,costs,buffers) select * from hash_32 where c1 = 693220100;
explain (analyze,verbose,timing,costs,buffers) select * from hash_32 where c1 = 693220100;
explain (analyze,verbose,timing,costs,buffers) select * from hash_32 where c1 = 693220100;
explain (analyze,verbose,timing,costs,buffers) select * from hash_32 where c1 = 693220100;
SELECT pg_size_pretty( pg_relation_size('hash_32'));
SELECT pg_size_pretty( pg_indexes_size('hash_32'));
drop index idx_bloom;
drop table hash_32;
