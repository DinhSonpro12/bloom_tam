create table length_11 (c1 int);
\timing 
insert into length_11 select random()*1000000000 from generate_series(1,10000000);
create index idx_bloom on length_11 using bloom (c1) WITH (length=11);
explain (analyze,verbose,timing,costs,buffers) select * from length_11 where c1 = 951136186;
SELECT pg_size_pretty( pg_relation_size('length_11'));
SELECT pg_size_pretty( pg_indexes_size('length_11'));
drop index idx_bloom;
drop table length_11;
