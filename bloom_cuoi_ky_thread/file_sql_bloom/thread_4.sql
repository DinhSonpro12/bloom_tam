SET max_parallel_workers_per_gather = 4;create table thread_4 (c1 int);
\timing 
insert into thread_4 select random()*1000000000 from generate_series(1,10000000);
create index idx_bloom on thread_4 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from thread_4 where c1 = 577789861;
SELECT pg_size_pretty( pg_relation_size('thread_4'));
SELECT pg_size_pretty( pg_indexes_size('thread_4'));
drop index idx_bloom;
drop table thread_4;
