create table length_9 (c1 int);
\timing 
insert into length_9 select random()*1000000000 from generate_series(1,10000000);
create index idx_bloom on length_9 using bloom (c1) WITH (length=9);
explain (analyze,verbose,timing,costs,buffers) select * from length_9 where c1 = 217724308;
SELECT pg_size_pretty( pg_relation_size('length_9'));
SELECT pg_size_pretty( pg_indexes_size('length_9'));
drop index idx_bloom;
drop table length_9;
