SET max_parallel_workers_per_gather = 44;create table thread_44 (c1 int);
\timing 
insert into thread_44 select random()*1000000000 from generate_series(1,10000000);
create index idx_bloom on thread_44 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from thread_44 where c1 = 372410098;
SELECT pg_size_pretty( pg_relation_size('thread_44'));
SELECT pg_size_pretty( pg_indexes_size('thread_44'));
drop index idx_bloom;
drop table thread_44;
