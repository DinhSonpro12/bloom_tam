SET max_parallel_workers_per_gather = 46;create table thread_46 (c1 int);
\timing 
insert into thread_46 select random()*1000000000 from generate_series(1,10000000);
create index idx_bloom on thread_46 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from thread_46 where c1 = 813747961;
SELECT pg_size_pretty( pg_relation_size('thread_46'));
SELECT pg_size_pretty( pg_indexes_size('thread_46'));
drop index idx_bloom;
drop table thread_46;
