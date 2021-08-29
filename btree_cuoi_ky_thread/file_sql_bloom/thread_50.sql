SET max_parallel_workers_per_gather = 50;create table thread_50 (c1 int);
\timing 
insert into thread_50 select random()*1000000000 from generate_series(1,10000000);
explain (analyze,verbose,timing,costs,buffers) select * from thread_50 where c1 = 141163584;
create index idx_btree on thread_50 (c1);
SELECT pg_size_pretty( pg_relation_size('thread_50'));
SELECT pg_size_pretty( pg_indexes_size('thread_50'));
drop index idx_btree;
drop table thread_50;
