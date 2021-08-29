SET max_parallel_workers_per_gather = 38;create table thread_38 (c1 int);
\timing 
insert into thread_38 select random()*1000000000 from generate_series(1,10000000);
explain (analyze,verbose,timing,costs,buffers) select * from thread_38 where c1 = 841874872;
create index idx_btree on thread_38 (c1);
SELECT pg_size_pretty( pg_relation_size('thread_38'));
SELECT pg_size_pretty( pg_indexes_size('thread_38'));
drop index idx_btree;
drop table thread_38;
