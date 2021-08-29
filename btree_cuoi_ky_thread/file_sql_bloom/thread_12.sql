SET max_parallel_workers_per_gather = 12;create table thread_12 (c1 int);
\timing 
insert into thread_12 select random()*1000000000 from generate_series(1,10000000);
explain (analyze,verbose,timing,costs,buffers) select * from thread_12 where c1 = 840433471;
create index idx_btree on thread_12 (c1);
SELECT pg_size_pretty( pg_relation_size('thread_12'));
SELECT pg_size_pretty( pg_indexes_size('thread_12'));
drop index idx_btree;
drop table thread_12;
