create table length_61 (c1 int);
\timing 
insert into length_61 select random()*1000000000 from generate_series(1,10000000);
create index idx_bloom on length_61 using bloom (c1) WITH (length=61);
explain (analyze,verbose,timing,costs,buffers) select * from length_61 where c1 = 94239546;
SELECT pg_size_pretty( pg_relation_size('length_61'));
SELECT pg_size_pretty( pg_indexes_size('length_61'));
drop index idx_bloom;
drop table length_61;
