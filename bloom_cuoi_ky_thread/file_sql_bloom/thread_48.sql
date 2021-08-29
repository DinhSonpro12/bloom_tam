SET max_parallel_workers_per_gather = 48;create table thread_48 (c1 int);
\timing 
insert into thread_48 select random()*1000000000 from generate_series(1,10000000);
create index idx_bloom on thread_48 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from thread_48 where c1 = 231404732;
SELECT pg_size_pretty( pg_relation_size('thread_48'));
SELECT pg_size_pretty( pg_indexes_size('thread_48'));
drop index idx_bloom;
drop table thread_48;
