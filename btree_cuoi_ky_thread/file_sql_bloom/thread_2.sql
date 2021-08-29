SET max_parallel_workers_per_gather = 2;create table thread_2 (c1 int);
\timing 
insert into thread_2 select random()*1000000000 from generate_series(1,10000000);
explain (analyze,verbose,timing,costs,buffers) select * from thread_2 where c1 = 414619584;
create index idx_btree on thread_2 (c1);
SELECT pg_size_pretty( pg_relation_size('thread_2'));
SELECT pg_size_pretty( pg_indexes_size('thread_2'));
drop index idx_btree;
drop table thread_2;
