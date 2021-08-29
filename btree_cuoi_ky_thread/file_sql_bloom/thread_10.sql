SET max_parallel_workers_per_gather = 10;create table thread_10 (c1 int);
\timing 
insert into thread_10 select random()*1000000000 from generate_series(1,10000000);
explain (analyze,verbose,timing,costs,buffers) select * from thread_10 where c1 = 724590698;
create index idx_btree on thread_10 (c1);
SELECT pg_size_pretty( pg_relation_size('thread_10'));
SELECT pg_size_pretty( pg_indexes_size('thread_10'));
drop index idx_btree;
drop table thread_10;
