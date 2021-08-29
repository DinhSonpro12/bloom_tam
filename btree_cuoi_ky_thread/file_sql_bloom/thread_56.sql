SET max_parallel_workers_per_gather = 56;create table thread_56 (c1 int);
\timing 
insert into thread_56 select random()*1000000000 from generate_series(1,10000000);
explain (analyze,verbose,timing,costs,buffers) select * from thread_56 where c1 = 908687895;
create index idx_btree on thread_56 (c1);
SELECT pg_size_pretty( pg_relation_size('thread_56'));
SELECT pg_size_pretty( pg_indexes_size('thread_56'));
drop index idx_btree;
drop table thread_56;
