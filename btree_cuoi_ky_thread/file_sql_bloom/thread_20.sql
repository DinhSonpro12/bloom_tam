SET max_parallel_workers_per_gather = 20;create table thread_20 (c1 int);
\timing 
insert into thread_20 select random()*1000000000 from generate_series(1,10000000);
explain (analyze,verbose,timing,costs,buffers) select * from thread_20 where c1 = 338707873;
create index idx_btree on thread_20 (c1);
SELECT pg_size_pretty( pg_relation_size('thread_20'));
SELECT pg_size_pretty( pg_indexes_size('thread_20'));
drop index idx_btree;
drop table thread_20;
