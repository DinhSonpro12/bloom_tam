SET max_parallel_workers_per_gather = 22;create table thread_22 (c1 int);
\timing 
insert into thread_22 select random()*1000000000 from generate_series(1,10000000);
explain (analyze,verbose,timing,costs,buffers) select * from thread_22 where c1 = 266888565;
create index idx_btree on thread_22 (c1);
SELECT pg_size_pretty( pg_relation_size('thread_22'));
SELECT pg_size_pretty( pg_indexes_size('thread_22'));
drop index idx_btree;
drop table thread_22;
