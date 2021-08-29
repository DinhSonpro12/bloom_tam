SET max_parallel_workers_per_gather = 16;create table thread_16 (c1 int);
\timing 
insert into thread_16 select random()*1000000000 from generate_series(1,10000000);
explain (analyze,verbose,timing,costs,buffers) select * from thread_16 where c1 = 347470641;
create index idx_btree on thread_16 (c1);
SELECT pg_size_pretty( pg_relation_size('thread_16'));
SELECT pg_size_pretty( pg_indexes_size('thread_16'));
drop index idx_btree;
drop table thread_16;
