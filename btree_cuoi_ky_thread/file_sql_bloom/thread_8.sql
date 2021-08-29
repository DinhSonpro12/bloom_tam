SET max_parallel_workers_per_gather = 8;create table thread_8 (c1 int);
\timing 
insert into thread_8 select random()*1000000000 from generate_series(1,10000000);
explain (analyze,verbose,timing,costs,buffers) select * from thread_8 where c1 = 191354173;
create index idx_btree on thread_8 (c1);
SELECT pg_size_pretty( pg_relation_size('thread_8'));
SELECT pg_size_pretty( pg_indexes_size('thread_8'));
drop index idx_btree;
drop table thread_8;
