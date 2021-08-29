SET max_parallel_workers_per_gather = 54;create table thread_54 (c1 int);
\timing 
insert into thread_54 select random()*1000000000 from generate_series(1,10000000);
explain (analyze,verbose,timing,costs,buffers) select * from thread_54 where c1 = 823848622;
create index idx_btree on thread_54 (c1);
SELECT pg_size_pretty( pg_relation_size('thread_54'));
SELECT pg_size_pretty( pg_indexes_size('thread_54'));
drop index idx_btree;
drop table thread_54;
