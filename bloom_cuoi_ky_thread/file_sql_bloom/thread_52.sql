SET max_parallel_workers_per_gather = 52;create table thread_52 (c1 int);
\timing 
insert into thread_52 select random()*1000000000 from generate_series(1,10000000);
create index idx_bloom on thread_52 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from thread_52 where c1 = 448677997;
SELECT pg_size_pretty( pg_relation_size('thread_52'));
SELECT pg_size_pretty( pg_indexes_size('thread_52'));
drop index idx_bloom;
drop table thread_52;
