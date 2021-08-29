SET max_parallel_workers_per_gather = 44;create table thread_44 (c1 int);
\timing 
insert into thread_44 select random()*1000000000 from generate_series(1,10000000);
explain (analyze,verbose,timing,costs,buffers) select * from thread_44 where c1 = 300095295;
create index idx_btree on thread_44 (c1);
SELECT pg_size_pretty( pg_relation_size('thread_44'));
SELECT pg_size_pretty( pg_indexes_size('thread_44'));
drop index idx_btree;
drop table thread_44;
