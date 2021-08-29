create table length_1024 (c1 int);
\timing 
insert into length_1024 select random()*1000000000 from generate_series(1,20000000);
create index idx_bloom on length_1024 using bloom (c1) WITH (length=1024);
explain (analyze,verbose,timing,costs,buffers) select * from length_1024 where c1 = 545675935;
explain (analyze,verbose,timing,costs,buffers) select * from length_1024 where c1 = 545675935;
explain (analyze,verbose,timing,costs,buffers) select * from length_1024 where c1 = 545675935;
explain (analyze,verbose,timing,costs,buffers) select * from length_1024 where c1 = 545675935;
explain (analyze,verbose,timing,costs,buffers) select * from length_1024 where c1 = 545675935;
explain (analyze,verbose,timing,costs,buffers) select * from length_1024 where c1 = 545675935;
explain (analyze,verbose,timing,costs,buffers) select * from length_1024 where c1 = 545675935;
explain (analyze,verbose,timing,costs,buffers) select * from length_1024 where c1 = 545675935;
explain (analyze,verbose,timing,costs,buffers) select * from length_1024 where c1 = 545675935;
explain (analyze,verbose,timing,costs,buffers) select * from length_1024 where c1 = 545675935;
explain (analyze,verbose,timing,costs,buffers) select * from length_1024 where c1 = 545675935;
explain (analyze,verbose,timing,costs,buffers) select * from length_1024 where c1 = 545675935;
explain (analyze,verbose,timing,costs,buffers) select * from length_1024 where c1 = 545675935;
explain (analyze,verbose,timing,costs,buffers) select * from length_1024 where c1 = 545675935;
explain (analyze,verbose,timing,costs,buffers) select * from length_1024 where c1 = 545675935;
explain (analyze,verbose,timing,costs,buffers) select * from length_1024 where c1 = 545675935;
explain (analyze,verbose,timing,costs,buffers) select * from length_1024 where c1 = 545675935;
explain (analyze,verbose,timing,costs,buffers) select * from length_1024 where c1 = 545675935;
explain (analyze,verbose,timing,costs,buffers) select * from length_1024 where c1 = 545675935;
explain (analyze,verbose,timing,costs,buffers) select * from length_1024 where c1 = 545675935;
explain (analyze,verbose,timing,costs,buffers) select * from length_1024 where c1 = 545675935;
explain (analyze,verbose,timing,costs,buffers) select * from length_1024 where c1 = 545675935;
explain (analyze,verbose,timing,costs,buffers) select * from length_1024 where c1 = 545675935;
explain (analyze,verbose,timing,costs,buffers) select * from length_1024 where c1 = 545675935;
explain (analyze,verbose,timing,costs,buffers) select * from length_1024 where c1 = 545675935;
explain (analyze,verbose,timing,costs,buffers) select * from length_1024 where c1 = 545675935;
explain (analyze,verbose,timing,costs,buffers) select * from length_1024 where c1 = 545675935;
explain (analyze,verbose,timing,costs,buffers) select * from length_1024 where c1 = 545675935;
explain (analyze,verbose,timing,costs,buffers) select * from length_1024 where c1 = 545675935;
explain (analyze,verbose,timing,costs,buffers) select * from length_1024 where c1 = 545675935;
SELECT pg_size_pretty( pg_relation_size('length_1024'));
SELECT pg_size_pretty( pg_indexes_size('length_1024'));
drop index idx_bloom;
drop table length_1024;
