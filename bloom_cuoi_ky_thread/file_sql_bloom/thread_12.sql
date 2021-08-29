SET max_parallel_workers_per_gather = 12;create table thread_12 (c1 int);
\timing 
insert into thread_12 select random()*1000000000 from generate_series(1,10000000);
create index idx_bloom on thread_12 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from thread_12 where c1 = 942659363;
SELECT pg_size_pretty( pg_relation_size('thread_12'));
SELECT pg_size_pretty( pg_indexes_size('thread_12'));
drop index idx_bloom;
drop table thread_12;
