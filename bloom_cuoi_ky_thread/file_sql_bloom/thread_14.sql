SET max_parallel_workers_per_gather = 14;create table thread_14 (c1 int);
\timing 
insert into thread_14 select random()*1000000000 from generate_series(1,10000000);
create index idx_bloom on thread_14 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from thread_14 where c1 = 226821053;
SELECT pg_size_pretty( pg_relation_size('thread_14'));
SELECT pg_size_pretty( pg_indexes_size('thread_14'));
drop index idx_bloom;
drop table thread_14;
