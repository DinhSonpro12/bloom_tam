SET max_parallel_workers_per_gather = 40;create table thread_40 (c1 int);
\timing 
insert into thread_40 select random()*1000000000 from generate_series(1,10000000);
create index idx_bloom on thread_40 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from thread_40 where c1 = 478825144;
SELECT pg_size_pretty( pg_relation_size('thread_40'));
SELECT pg_size_pretty( pg_indexes_size('thread_40'));
drop index idx_bloom;
drop table thread_40;
