SET max_parallel_workers_per_gather = 30;create table thread_30 (c1 int);
\timing 
insert into thread_30 select random()*1000000000 from generate_series(1,10000000);
explain (analyze,verbose,timing,costs,buffers) select * from thread_30 where c1 = 78016538;
create index idx_btree on thread_30 (c1);
SELECT pg_size_pretty( pg_relation_size('thread_30'));
SELECT pg_size_pretty( pg_indexes_size('thread_30'));
drop index idx_btree;
drop table thread_30;
