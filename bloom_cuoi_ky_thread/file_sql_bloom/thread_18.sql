SET max_parallel_workers_per_gather = 18;create table thread_18 (c1 int);
\timing 
insert into thread_18 select random()*1000000000 from generate_series(1,10000000);
create index idx_bloom on thread_18 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from thread_18 where c1 = 931792465;
SELECT pg_size_pretty( pg_relation_size('thread_18'));
SELECT pg_size_pretty( pg_indexes_size('thread_18'));
drop index idx_bloom;
drop table thread_18;
