SET max_parallel_workers_per_gather = 42;create table thread_42 (c1 int);
\timing 
insert into thread_42 select random()*1000000000 from generate_series(1,10000000);
create index idx_bloom on thread_42 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from thread_42 where c1 = 826952246;
SELECT pg_size_pretty( pg_relation_size('thread_42'));
SELECT pg_size_pretty( pg_indexes_size('thread_42'));
drop index idx_bloom;
drop table thread_42;
