SET max_parallel_workers_per_gather = 26;create table thread_26 (c1 int);
\timing 
insert into thread_26 select random()*1000000000 from generate_series(1,10000000);
create index idx_bloom on thread_26 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from thread_26 where c1 = 745392696;
SELECT pg_size_pretty( pg_relation_size('thread_26'));
SELECT pg_size_pretty( pg_indexes_size('thread_26'));
drop index idx_bloom;
drop table thread_26;
