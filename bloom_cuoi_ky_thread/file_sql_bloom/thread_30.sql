SET max_parallel_workers_per_gather = 30;create table thread_30 (c1 int);
\timing 
insert into thread_30 select random()*1000000000 from generate_series(1,10000000);
create index idx_bloom on thread_30 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from thread_30 where c1 = 46350709;
SELECT pg_size_pretty( pg_relation_size('thread_30'));
SELECT pg_size_pretty( pg_indexes_size('thread_30'));
drop index idx_bloom;
drop table thread_30;
