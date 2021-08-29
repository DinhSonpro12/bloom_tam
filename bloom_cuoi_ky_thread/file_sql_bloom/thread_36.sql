SET max_parallel_workers_per_gather = 36;create table thread_36 (c1 int);
\timing 
insert into thread_36 select random()*1000000000 from generate_series(1,10000000);
create index idx_bloom on thread_36 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from thread_36 where c1 = 337277575;
SELECT pg_size_pretty( pg_relation_size('thread_36'));
SELECT pg_size_pretty( pg_indexes_size('thread_36'));
drop index idx_bloom;
drop table thread_36;
