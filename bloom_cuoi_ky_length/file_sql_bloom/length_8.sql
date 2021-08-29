create table length_8 (c1 int);
\timing 
insert into length_8 select random()*1000000000 from generate_series(1,10000000);
create index idx_bloom on length_8 using bloom (c1) WITH (length=8);
explain (analyze,verbose,timing,costs,buffers) select * from length_8 where c1 = 832344437;
SELECT pg_size_pretty( pg_relation_size('length_8'));
SELECT pg_size_pretty( pg_indexes_size('length_8'));
drop index idx_bloom;
drop table length_8;
