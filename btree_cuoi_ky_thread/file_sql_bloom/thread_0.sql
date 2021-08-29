SET max_parallel_workers_per_gather = 0;create table thread_0 (c1 int);
\timing 
insert into thread_0 select random()*1000000000 from generate_series(1,10000000);
explain (analyze,verbose,timing,costs,buffers) select * from thread_0 where c1 = 307844852;
create index idx_btree on thread_0 (c1);
SELECT pg_size_pretty( pg_relation_size('thread_0'));
SELECT pg_size_pretty( pg_indexes_size('thread_0'));
drop index idx_btree;
drop table thread_0;
