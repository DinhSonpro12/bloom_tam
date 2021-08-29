create table length_1367 (c1 int);
\timing 
insert into length_1367 select random()*1000000000 from generate_series(1,10000000);
create index idx_bloom on length_1367 using bloom (c1) WITH (length=1367);
explain (analyze,verbose,timing,costs,buffers) select * from length_1367 where c1 = 542201807;
SELECT pg_size_pretty( pg_relation_size('length_1367'));
SELECT pg_size_pretty( pg_indexes_size('length_1367'));
drop index idx_bloom;
drop table length_1367;
