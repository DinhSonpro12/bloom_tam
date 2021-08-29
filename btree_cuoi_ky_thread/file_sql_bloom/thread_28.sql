SET max_parallel_workers_per_gather = 28;create table thread_28 (c1 int);
\timing 
insert into thread_28 select random()*1000000000 from generate_series(1,10000000);
explain (analyze,verbose,timing,costs,buffers) select * from thread_28 where c1 = 770556318;
create index idx_btree on thread_28 (c1);
SELECT pg_size_pretty( pg_relation_size('thread_28'));
SELECT pg_size_pretty( pg_indexes_size('thread_28'));
drop index idx_btree;
drop table thread_28;
