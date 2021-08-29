SET max_parallel_workers_per_gather = 6;create table thread_6 (c1 int);
\timing 
insert into thread_6 select random()*1000000000 from generate_series(1,10000000);
explain (analyze,verbose,timing,costs,buffers) select * from thread_6 where c1 = 610039479;
create index idx_btree on thread_6 (c1);
SELECT pg_size_pretty( pg_relation_size('thread_6'));
SELECT pg_size_pretty( pg_indexes_size('thread_6'));
drop index idx_btree;
drop table thread_6;
