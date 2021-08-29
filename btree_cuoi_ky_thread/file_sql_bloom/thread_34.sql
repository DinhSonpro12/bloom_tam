SET max_parallel_workers_per_gather = 34;create table thread_34 (c1 int);
\timing 
insert into thread_34 select random()*1000000000 from generate_series(1,10000000);
explain (analyze,verbose,timing,costs,buffers) select * from thread_34 where c1 = 666708057;
create index idx_btree on thread_34 (c1);
SELECT pg_size_pretty( pg_relation_size('thread_34'));
SELECT pg_size_pretty( pg_indexes_size('thread_34'));
drop index idx_btree;
drop table thread_34;
