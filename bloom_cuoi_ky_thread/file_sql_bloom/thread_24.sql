SET max_parallel_workers_per_gather = 24;create table thread_24 (c1 int);
\timing 
insert into thread_24 select random()*1000000000 from generate_series(1,10000000);
create index idx_bloom on thread_24 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from thread_24 where c1 = 543146728;
SELECT pg_size_pretty( pg_relation_size('thread_24'));
SELECT pg_size_pretty( pg_indexes_size('thread_24'));
drop index idx_bloom;
drop table thread_24;
