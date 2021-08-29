SET max_parallel_workers_per_gather = 58;create table thread_58 (c1 int);
\timing 
insert into thread_58 select random()*1000000000 from generate_series(1,10000000);
explain (analyze,verbose,timing,costs,buffers) select * from thread_58 where c1 = 141739044;
create index idx_btree on thread_58 (c1);
SELECT pg_size_pretty( pg_relation_size('thread_58'));
SELECT pg_size_pretty( pg_indexes_size('thread_58'));
drop index idx_btree;
drop table thread_58;
