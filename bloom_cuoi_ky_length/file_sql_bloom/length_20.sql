create table length_20 (c1 int);
\timing 
insert into length_20 select random()*1000000000 from generate_series(1,10000000);
create index idx_bloom on length_20 using bloom (c1) WITH (length=20);
explain (analyze,verbose,timing,costs,buffers) select * from length_20 where c1 = 282226041;
SELECT pg_size_pretty( pg_relation_size('length_20'));
SELECT pg_size_pretty( pg_indexes_size('length_20'));
drop index idx_bloom;
drop table length_20;
