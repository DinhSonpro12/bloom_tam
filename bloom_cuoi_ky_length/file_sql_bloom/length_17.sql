create table length_17 (c1 int);
\timing 
insert into length_17 select random()*1000000000 from generate_series(1,10000000);
create index idx_bloom on length_17 using bloom (c1) WITH (length=17);
explain (analyze,verbose,timing,costs,buffers) select * from length_17 where c1 = 953618940;
SELECT pg_size_pretty( pg_relation_size('length_17'));
SELECT pg_size_pretty( pg_indexes_size('length_17'));
drop index idx_bloom;
drop table length_17;
