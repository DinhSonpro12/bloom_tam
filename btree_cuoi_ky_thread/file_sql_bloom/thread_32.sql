SET max_parallel_workers_per_gather = 32;create table thread_32 (c1 int);
\timing 
insert into thread_32 select random()*1000000000 from generate_series(1,10000000);
explain (analyze,verbose,timing,costs,buffers) select * from thread_32 where c1 = 506338153;
create index idx_btree on thread_32 (c1);
SELECT pg_size_pretty( pg_relation_size('thread_32'));
SELECT pg_size_pretty( pg_indexes_size('thread_32'));
drop index idx_btree;
drop table thread_32;
